
package controllers;

import java.util.Collection;
import java.util.List;

import javax.swing.JOptionPane;
import javax.validation.Valid;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Sponsor;
import services.SponsorService;
import utilities.Md5;

@Controller
@RequestMapping("/sponsor")
public class SponsorController extends AbstractController {

	@Autowired
	private SponsorService	sponsorService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		JOptionPane.showMessageDialog(null, "Forbidden operation");
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Sponsor> sponsors;

		sponsors = this.sponsorService.findAll();

		result = new ModelAndView("sponsor/list");
		result.addObject("sponsors", sponsors);
		result.addObject("requestURI", "sponsor/list.do");

		return result;
	}

	// Creation ---------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Sponsor sponsor;

		sponsor = this.sponsorService.create();
		result = this.createEditModelAndView(sponsor);

		return result;
	}

	// Edition -------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int sponsorId) {
		ModelAndView result;
		Sponsor sponsor;

		sponsor = this.sponsorService.findOne(sponsorId);
		Assert.notNull(sponsor);
		result = this.createEditModelAndView(sponsor);

		return result;
	}

	// Save -------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Sponsor sponsor, final BindingResult binding) {
		ModelAndView result;
		String password;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());
			result = this.createEditModelAndView(sponsor);
		} else
			try {
				password = Md5.encodeMd5(sponsor.getUserAccount().getPassword());
				sponsor.getUserAccount().setPassword(password);
				this.sponsorService.save(sponsor);
				result = new ModelAndView("redirect:../security/login.do");
			} catch (final Throwable oops) {
				result = new ModelAndView("sponsor/edit");
				result.addObject("sponsor", sponsor);
				if (oops instanceof DataIntegrityViolationException)
					result.addObject("message", "admin.duplicated.username");
				else {
					System.out.println(oops.getCause().toString());
					result.addObject("message", "admin.registration.error");
				}
			}

		return result;
	}

	// Update ------------------------------------------------------------------------------------
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update() {
		ModelAndView result;
		Sponsor sponsor;

		sponsor = this.sponsorService.findByPrincipal();
		result = new ModelAndView("sponsor/update");
		result.addObject("sponsor", sponsor);
		return result;
	}

	// Save Update ----------------------------------------------------------
	@RequestMapping(value = "/update", method = RequestMethod.POST, params = "save")
	public ModelAndView edit(@Valid final Sponsor sponsor, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());
			result = new ModelAndView("sponsor/update");
			result.addObject("sponsor", sponsor);
		} else
			try {
				this.sponsorService.save(sponsor);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (final Throwable oops) {
				result = new ModelAndView("sponsor/update");
				result.addObject("sponsor", sponsor);
				result.addObject("message", "administrator.commit.error");
			}
		return result;
	}

	// Delete ------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Sponsor sponsor, final BindingResult binding) {
		ModelAndView result;

		try {
			this.sponsorService.delete(sponsor);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.createEditModelAndView(sponsor, "sponsor.commit.error");
		}

		return result;
	}

	// Ancillary methods ------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Sponsor sponsor) {
		ModelAndView result;

		result = this.createEditModelAndView(sponsor, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Sponsor sponsor, final String message) {
		ModelAndView result;

		result = new ModelAndView("sponsor/edit");
		result.addObject("sponsor", sponsor);
		result.addObject("message", message);

		return result;
	}

}
