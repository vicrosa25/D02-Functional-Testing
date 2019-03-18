
package controllers;

import java.util.Collection;
import java.util.List;

import javax.swing.JOptionPane;
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

import domain.Sponsor;
import forms.SponsorForm;
import services.SponsorService;
import utilities.Md5;

@Controller
@RequestMapping("/sponsor")
public class SponsorController extends AbstractController {

	@Autowired
	private SponsorService sponsorService;


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

	// Register formObject ------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		SponsorForm form;

		try {
			form = new SponsorForm();
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
	public ModelAndView save(SponsorForm sponsorForm, BindingResult binding) {
		ModelAndView result;
		Sponsor sponsor;
		String password;

		sponsor = this.sponsorService.reconstruct(sponsorForm, binding);

		if (!sponsorForm.isAccepted()) {
			binding.rejectValue("accepted", "register.terms.error", "Service terms must be accepted");
		}
		if (binding.hasErrors()) {
			List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = this.createEditModelAndView(sponsorForm);
		}

		else
			try {
				password = Md5.encodeMd5(sponsor.getUserAccount().getPassword());
				sponsor.getUserAccount().setPassword(password);
				this.sponsorService.save(sponsor);
				result = new ModelAndView("redirect:../security/login.do");
			} catch (final Throwable oops) {
				System.out.println(sponsor);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.createEditModelAndView(sponsorForm);
			}
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
	protected ModelAndView createEditModelAndView(SponsorForm sponsorForm) {
		ModelAndView result;

		result = this.createEditModelAndView(sponsorForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(SponsorForm sponsorForm, String message) {
		ModelAndView result;

		result = new ModelAndView("sponsor/create");
		result.addObject("sponsorForm", sponsorForm);
		result.addObject("message", message);

		return result;
	}

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

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}

}
