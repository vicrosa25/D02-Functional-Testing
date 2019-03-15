
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

import services.BrotherhoodService;
import services.PathService;
import services.ProcessionService;
import services.SegmentService;
import domain.Brotherhood;
import domain.Path;
import domain.Procession;
import forms.PathForm;

@Controller
@RequestMapping("/path/brotherhood")
public class PathController extends AbstractController {

	@Autowired
	private PathService			pathService;

	@Autowired
	private BrotherhoodService	brotherhoodService;

	@Autowired
	private ProcessionService	procesionService;

	@Autowired
	private SegmentService		segmentService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return this.forbiddenOpperation();
	}
	
	// Display ------------------------------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int pathId) {
		ModelAndView result;
		Brotherhood brotherhood;
		Path path;

		try {
			brotherhood = this.brotherhoodService.findByPrincipal();
			path = this.pathService.findOne(pathId);
			
			Assert.isTrue(brotherhood.getProcessions().contains(path.getProcession()));
			
			result = new ModelAndView("path/brotherhood/display");
			result.addObject("path", path);
			
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
			
		}

		return result;
	}
	
	// List ------------------------------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int processionId) {
		ModelAndView result;
		Brotherhood brotherhood;
		Procession procession;

		try {
			brotherhood = this.brotherhoodService.findByPrincipal();
			procession = this.procesionService.findOne(processionId);
			
			Assert.isTrue(brotherhood.getProcessions().contains(procession));
			
			result = new ModelAndView("path/brotherhood/list");
			result.addObject("paths", procession.getPaths());
			
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
	public ModelAndView create() {
		ModelAndView result;

		try {
			PathForm pathForm = new PathForm();
			
			result = new ModelAndView("path/brotherhood/create");
			result.addObject("pathForm", pathForm);
			result.addObject("parades", this.brotherhoodService.findByPrincipal().getProcessions());
			
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
	public ModelAndView saveInception(@Valid final PathForm pathForm, final BindingResult binding) {
		ModelAndView result;
		Path path;
		
		if(pathForm.getProcession() == null){
			binding.rejectValue("procession", "path.error.procession", "A procession must be selected");
		}
		
		path = this.pathService.reconstruct(pathForm, binding);

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}
			result = new ModelAndView("path/brotherhood/create");
			result.addObject("pathForm", pathForm);
			result.addObject("parades", this.brotherhoodService.findByPrincipal().getProcessions());
		
		} else {
			try {
				this.pathService.save(path);
				result = new ModelAndView("redirect:/path/brotherhood/list.do?processionId="+path.getProcession().getId());
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = new ModelAndView("path/brotherhood/create");
				result.addObject("pathForm", pathForm);
				result.addObject("parades", this.brotherhoodService.findByPrincipal().getProcessions());
			}
		}
		return result;
	}
	
	// Delete ------------------------------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int pathId) {
		ModelAndView result;

		try {
			Path path = this.pathService.findOne(pathId);
			
			Assert.isTrue(this.brotherhoodService.findByPrincipal().getProcessions().contains(path.getProcession()));
			
			this.pathService.delete(path);
			result = new ModelAndView("redirect:/path/brotherhood/list.do?processionId="+path.getProcession().getId());
			
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
			
		}

		return result;
	}
	
	// Ancillary methods ------------------------------------------------------
	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
}
