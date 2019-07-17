
package controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
import domain.Sponsorship;
import services.BrotherhoodService;
import services.ParadeService;
import services.SponsorshipService;

@Controller
@RequestMapping("/parade")
public class ParadeController extends AbstractController {

	@Autowired
	private ParadeService		paradeService;

	@Autowired
	private BrotherhoodService	brotherhoodService;

	@Autowired
	private SponsorshipService	sponsorshipService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	// Display ------------------------------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int paradeId) {
		ModelAndView result;
		Parade parade;

		try {
			parade = this.paradeService.findOne(paradeId);
			ArrayList<Sponsorship> sponsorships = sponsorshipService.findByParade(parade);

			result = new ModelAndView("parade/display");
			result.addObject("parade", parade);
			if (!sponsorships.isEmpty()) {
				Random rand = new Random();
				Sponsorship sponsorship = sponsorships.get(rand.nextInt(sponsorships.size()));

				sponsorship = this.sponsorshipService.updateCharge(sponsorship);
				result.addObject("sponsorship", sponsorship);
			}

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// List
	// ------------------------------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Brotherhood principal;
		Collection<Parade> parades;

		try {
			principal = this.brotherhoodService.findByPrincipal();
			parades = this.paradeService.getParadesSortedByStatus(principal.getId());
			result = new ModelAndView("parade/list");
			result.addObject("parades", parades);
			result.addObject("uri", "parade/list");
			result.addObject("bro", 1);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Brotherhood List ------------------------------------------------------------------------------------
	@RequestMapping(value = "/brotherhoodList", method = RequestMethod.GET)
	public ModelAndView brotherhoodList(@RequestParam final int brotherhoodId) {
		ModelAndView result;
		Collection<Parade> parades;

		try {
			parades = this.paradeService.findByBrotherhoodNotDraftAndApproved(brotherhoodId);

			result = new ModelAndView("parade/list");
			result.addObject("parades", parades);
			result.addObject("uri", "parade/brotherhoodList");

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Create
	// ------------------------------------------------------------------------------------
	@RequestMapping(value = "brotherhood/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Parade parade;

		parade = this.paradeService.create();

		result = this.createEditModelAndView(parade);

		return result;
	}

	// Edition -------------------------------------------------------------
	@RequestMapping(value = "brotherhood/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int paradeId) {
		ModelAndView result;
		Parade parade;

		try {
			Brotherhood principal = this.brotherhoodService.findByPrincipal();
			parade = this.paradeService.findOne(paradeId);

			Assert.notNull(parade);
			Assert.isTrue(principal.getParades().contains(parade));
			Assert.isTrue(parade.getDraftMode());

		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
			return result;
		}

		result = this.createEditModelAndView(parade);

		return result;
	}

	// Save -------------------------------------------------------------
	@RequestMapping(value = "brotherhood/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(final Parade pruned, final BindingResult binding) {
		ModelAndView result;
		Parade constructed;

		constructed = this.paradeService.reconstruct(pruned, binding);
		if (pruned.getMoment() != null)
			if (pruned.getMoment().before(new Date()))
				binding.rejectValue("moment", "parade.moment.error", "Must be future");

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}
			result = this.createEditModelAndView(pruned);
		} else {
			try {
				this.paradeService.save(constructed);
				result = new ModelAndView("redirect:../list.do");
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = this.createEditModelAndView(pruned, "parade.registration.error");
			}
		}

		return result;
	}

	// Delete
	// --------------------------------------------------------------------------------------
	@RequestMapping(value = "brotherhood/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int paradeId) {
		ModelAndView result = null;
		Parade parade;

		try {
			Brotherhood principal = this.brotherhoodService.findByPrincipal();
			parade = this.paradeService.findOne(paradeId);
			Assert.notNull(parade);
			Assert.isTrue(principal.getParades().contains(parade));
			this.paradeService.delete(parade);
			result = new ModelAndView("redirect:../list.do");
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Copy ------------------------------------------------------------------------------------
	@RequestMapping(value = "brotherhood/copy", method = RequestMethod.GET)
	public ModelAndView copy(@RequestParam final int paradeId) {
		ModelAndView result;
		try {
			this.paradeService.copy(paradeId);

			result = new ModelAndView("redirect:../list.do");
		} catch (final Throwable oops) {
			oops.printStackTrace();
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Ancillary Methods
	// -----------------------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Parade parade) {
		ModelAndView result;

		result = this.createEditModelAndView(parade, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Parade parade, final String message) {
		ModelAndView result;

		result = new ModelAndView("parade/brotherhood/edit");
		result.addObject("parade", parade);
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
}
