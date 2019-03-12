
package controllers;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Area;
import domain.Chapter;
import forms.ChapterForm;
import services.AreaService;
import services.ChapterService;
import utilities.Md5;

@Controller
@RequestMapping("/chapter")
public class ChapterController extends AbstractController {

	@Autowired
	private ChapterService	chapterService;

	@Autowired
	private AreaService		areaService;


	// Register formObject ------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		ChapterForm form;

		try {
			form = new ChapterForm();
			result = this.createEditModelAndView(form);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Save the new brotherhood from formObject -------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(ChapterForm chapterForm, BindingResult binding) {
		ModelAndView result;
		Chapter chapter;
		String password;

		chapter = this.chapterService.reconstruct(chapterForm, binding);

		if (!chapterForm.isAccepted()) {
			binding.rejectValue("accepted", "register.terms.error", "Service terms must be accepted");
		}
		if (binding.hasErrors()) {
			List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = this.createEditModelAndView(chapterForm);
		}

		else
			try {
				password = Md5.encodeMd5(chapter.getUserAccount().getPassword());
				chapter.getUserAccount().setPassword(password);
				this.chapterService.save(chapter);
				result = new ModelAndView("redirect:../security/login.do");
			} catch (final Throwable oops) {
				System.out.println(chapter);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.createEditModelAndView(chapterForm);
			}
		return result;
	}

	// Edit Pruned Object -------------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		ModelAndView result;
		Chapter chapter;

		try {
			chapter = this.chapterService.findByPrincipal();

			// Set relations to null to use as a prune object
			chapter.setArea(null);

			result = new ModelAndView("chapter/edit");
			result.addObject("chapter", chapter);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// SAVE Pruned Object ---------------------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(Chapter prune, BindingResult binding) {
		ModelAndView result;
		Chapter chapter;

		chapter = this.chapterService.reconstruct(prune, binding);

		if (binding.hasErrors()) {
			List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("chapter/edit");
			result.addObject("chapter", prune);
		}

		else
			try {
				this.chapterService.save(chapter);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				System.out.println(chapter);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.editModelAndView(chapter, "chapter.registration.error");
			}
		return result;
	}

	// Self-assign an area ------------------------------------------------------------------------------------
	@RequestMapping(value = "/area/assign", method = RequestMethod.GET)
	public ModelAndView assignArea() {
		ModelAndView result;
		Chapter chapter;
		Collection<Area> areas;

		chapter = this.chapterService.findByPrincipal();

		if (chapter.getArea() != null) {
			result = this.displayArea();
		} else {
			areas = this.areaService.findFreeAreas();
			result = new ModelAndView("chapter/area/assign");
			result.addObject("areas", areas);
			result.addObject("chapter", chapter);
		}

		return result;
	}

	@RequestMapping(value = "/area/assign", method = RequestMethod.POST, params = "save")
	public ModelAndView assignArea(Chapter prune, BindingResult binding) {
		ModelAndView result;
		Chapter chapter;

		chapter = this.chapterService.reconstruct(prune, binding);

		if (binding.hasErrors()) {
			List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("chapter/area/assign");
			result.addObject("chapter", prune);
		}

		else
			try {
				this.chapterService.save(chapter);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				System.out.println(chapter);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.editModelAndView(chapter, "chapter.registration.error");
			}
		return result;
	}

	// Display area ------------------------------------------------------------------------------------
	@RequestMapping(value = "/area/display", method = RequestMethod.GET)
	public ModelAndView displayArea() {
		ModelAndView result;
		Chapter chapter;
		Area area;
		
		chapter = this.chapterService.findByPrincipal();
		area = chapter.getArea();


		result = new ModelAndView("chapter/area/display");
		result.addObject("area", area);
		result.addObject("brotherhoods", area.getBrotherhoods());
		result.addObject("pictures", area.getPictures());

		return result;
	}

	// Ancillary methods -----------------------------------------------------------------------
	protected ModelAndView createEditModelAndView(ChapterForm chapterForm) {
		ModelAndView result;

		result = this.createEditModelAndView(chapterForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(ChapterForm chapterForm, String message) {
		ModelAndView result;

		result = new ModelAndView("chapter/create");
		result.addObject("area", this.areaService.findAll());
		result.addObject("chapterForm", chapterForm);
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView editModelAndView(Chapter chapter) {
		ModelAndView result;

		result = this.editModelAndView(chapter, null);

		return result;
	}

	protected ModelAndView editModelAndView(Chapter chapter, String message) {
		ModelAndView result;

		result = new ModelAndView("chapter/edit");
		result.addObject("chapter", chapter);
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
}
