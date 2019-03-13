
package controllers;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.BrotherhoodService;
import services.HistoryService;
import services.InceptionRecordService;
import services.LegalRecordService;
import services.LinkRecordService;
import services.MiscellaneousRecordService;
import services.PeriodRecordService;
import domain.Brotherhood;
import domain.InceptionRecord;

@Controller
@RequestMapping("/history")
public class HistoryController extends AbstractController {

	@Autowired
	private HistoryService				historyService;

	@Autowired
	private BrotherhoodService			brotherhoodService;

	@Autowired
	private InceptionRecordService		inceptionService;

	@Autowired
	private PeriodRecordService			periodService;

	@Autowired
	private LinkRecordService			linkService;

	@Autowired
	private LegalRecordService			legalService;

	@Autowired
	private MiscellaneousRecordService	miscService;
	// EXEPTIONS
	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}
	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
	
	/** UNAUTHENTICATED METHODS **/
	// Display ------------------------------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int brotherhoodId) {
		ModelAndView result;
		Brotherhood brotherhood;

		try {
			brotherhood = this.brotherhoodService.findOne(brotherhoodId);
			result = new ModelAndView("history/display");
			result.addObject("history", brotherhood.getHistory());
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
			
		}

		return result;
	}
	
	/** BROTHERHOOD METHODS **/
	// Display ------------------------------------------------------------------------------------
	@RequestMapping(value = "/brotherhood/display", method = RequestMethod.GET)
	public ModelAndView display() {
		ModelAndView result;
		Brotherhood brotherhood;

		try {
			brotherhood = this.brotherhoodService.findByPrincipal();
			result = new ModelAndView("history/display");
			result.addObject("history", brotherhood.getHistory());
			result.addObject("bro", 1);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
			
		}

		return result;
	}
	
	// Edit inception record ------------------------------------------------------------------------------------
	@RequestMapping(value = "/brotherhood/inceptionRecord/edit", method = RequestMethod.GET)
	public ModelAndView inceptionRecord() {
		ModelAndView result;
		Brotherhood brotherhood;

		try {
			brotherhood = this.brotherhoodService.findByPrincipal();
			result = new ModelAndView("history/brotherhood/inceptionRecord/edit");
			result.addObject("inceptionRecord", brotherhood.getHistory().getInceptionRecord());
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
			
		}

		return result;
	}
	
	// Save inception ------------------------------------------------------------------------------------
	@RequestMapping(value = "/brotherhood/inceptionRecord/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveInception(@Valid final InceptionRecord inception, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}
			result = new ModelAndView("history/brotherhood/inceptionRecord/edit");
			result.addObject("inceptionRecord", inception);
		
		} else {
			try {
				this.inceptionService.save(inception);
				result = new ModelAndView("redirect:/history/brotherhood/display.do");
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = new ModelAndView("history/brotherhood/inceptionRecord/edit");
				result.addObject("inceptionRecord", inception);
			}
		}
		return result;
	}

}