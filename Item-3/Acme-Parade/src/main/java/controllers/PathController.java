
package controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Brotherhood;
import domain.Parade;
import domain.Path;
import domain.Segment;
import forms.PathForm;
import services.BrotherhoodService;
import services.ParadeService;
import services.PathService;
import services.SegmentService;

@Controller
@RequestMapping("/path/brotherhood")
public class PathController extends AbstractController {

	@Autowired
	private PathService			pathService;

	@Autowired
	private BrotherhoodService	brotherhoodService;

	@Autowired
	private ParadeService		paradeService;

	@Autowired
	private SegmentService		segmentService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return this.forbiddenOpperation();
	}

	// Display ------------------------------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int paradeId) {
		ModelAndView result;
		Brotherhood brotherhood;
		Path path;
		Parade parade;

		try {
			brotherhood = this.brotherhoodService.findByPrincipal();
			parade = this.paradeService.findOne(paradeId);
			path = parade.getPath();

			if (path == null) {
				result = new ModelAndView("redirect:/path/brotherhood/create.do?paradeId=" + paradeId);
			} else {
				Assert.isTrue(brotherhood.getParades().contains(path.getParade()));

				result = new ModelAndView("path/brotherhood/display");
				result.addObject("path", path);
			}

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// Create ------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int paradeId) {
		ModelAndView result;

		try {
			final PathForm pathForm = new PathForm();
			Parade parade = this.paradeService.findOne(paradeId);
			Assert.isTrue(this.brotherhoodService.findByPrincipal().getParades().contains(parade));

			pathForm.setParade(parade);
			result = new ModelAndView("path/brotherhood/create");
			result.addObject("pathForm", pathForm);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Save path ------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final PathForm pathForm, final BindingResult binding) {
		ModelAndView result;
		Path path;

		path = this.pathService.reconstruct(pathForm, binding);

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}
			result = new ModelAndView("path/brotherhood/create");
			result.addObject("pathForm", pathForm);
			result.addObject("parades", this.brotherhoodService.findByPrincipal().getParades());

		} else {
			try {
				path = this.pathService.save(path);
				final Segment segment = this.pathService.reconstructSegment(pathForm, binding);
				segment.setPath(path);
				this.segmentService.save(segment);

				result = new ModelAndView("redirect:/path/brotherhood/display.do?paradeId=" + path.getParade().getId());
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("path/brotherhood/create");
				result.addObject("pathForm", pathForm);
				result.addObject("parades", this.brotherhoodService.findByPrincipal().getParades());
			}
		}
		return result;
	}

	// Delete ------------------------------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int pathId) {
		ModelAndView result;

		try {
			final Path path = this.pathService.findOne(pathId);

			Assert.isTrue(this.brotherhoodService.findByPrincipal().getParades().contains(path.getParade()));

			this.pathService.delete(path);
			result = new ModelAndView("redirect:/");

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = this.forbiddenOpperation();

		}

		return result;
	}
	// Ancillary methods ------------------------------------------------------
	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
}
