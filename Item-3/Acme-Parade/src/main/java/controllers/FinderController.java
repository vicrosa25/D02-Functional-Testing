
package controllers;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Finder;
import domain.Member;
import domain.Parade;
import services.AreaService;
import services.FinderService;
import services.MemberService;

@Controller
@RequestMapping("/finder/member")
public class FinderController extends AbstractController {

	@Autowired
	private FinderService	finderService;

	@Autowired
	private MemberService	memberService;

	@Autowired
	private AreaService		areaService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	// Clear -----------------------------------------------------------
	@RequestMapping(value = "/clear", method = RequestMethod.GET)
	public ModelAndView clear() {
		ModelAndView result;
		Finder saved;
		try {
			final Finder finder = this.memberService.findByPrincipal().getFinder();
			finder.setArea(null);
			finder.setKeyword(null);
			finder.setLastUpdate(new Date());
			finder.setMaxDate(null);
			finder.setMinDate(null);
			saved = this.finderService.updateResults(finder);

			result = new ModelAndView("parade/list");
			result.addObject("parades", saved.getParades());
			result.addObject("requestURI", "finder/member/result.do");
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = new ModelAndView("redirect:/");
		}
		return result;
	}

	// Edit -----------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		ModelAndView result;

		final Member member = this.memberService.findByPrincipal();
		final Finder finder = member.getFinder();

		result = this.createEditModelAndView(finder);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Finder finder, final BindingResult binding) {
		ModelAndView result;
		Finder saved;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}
			result = this.createEditModelAndView(finder);

		} else {
			try {
				saved = this.finderService.checkChanges(finder);

				result = new ModelAndView("parade/list");
				result.addObject("parades", saved.getParades());
				result.addObject("requestURI", "finder/member/result.do");
			} catch (final Throwable oops) {
				System.out.println(finder);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = this.createEditModelAndView(finder);
			}
		}
		return result;
	}

	// Search -----------------------------------------------------------
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public ModelAndView result() {
		ModelAndView result;

		try {
			final Member member = this.memberService.findByPrincipal();
			final Finder finder = member.getFinder();
			final Collection<Parade> parades = this.finderService.getResults(finder);

			result = new ModelAndView("parade/list");
			result.addObject("parades", parades);
			result.addObject("requestURI", "finder/member/result.do");
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = new ModelAndView("redirect:/");
		}
		return result;
	}

	// Ancillary methods ------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Finder finder) {
		ModelAndView result;

		result = this.createEditModelAndView(finder, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Finder finder, final String message) {
		ModelAndView result;

		result = new ModelAndView("finder/member/edit");
		result.addObject("areas", this.areaService.findAll());
		result.addObject("finder", finder);
		result.addObject("message", message);

		return result;
	}
}
