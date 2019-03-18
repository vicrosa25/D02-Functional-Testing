
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import domain.MessageBox;
import domain.SocialIdentity;
import domain.Sponsor;
import domain.Sponsorship;
import forms.SponsorForm;
import repositories.SponsorRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;

@Service
@Transactional
public class SponsorService {

	// Manage Repository
	@Autowired
	private SponsorRepository		sponsorRepository;

	// Supporting services
	@Autowired
	MessageBoxService				messageBoxService;

	@Autowired
	private ConfigurationsService	configurationsService;
	
	@Autowired
	private Validator				validator;


	// CRUD methods
	public Sponsor create() {
		final Sponsor result = new Sponsor();

		final UserAccount userAccount = new UserAccount();
		final Collection<Authority> authorities = new ArrayList<Authority>();
		final Authority authority = new Authority();
		authority.setAuthority(Authority.SPONSOR);
		authorities.add(authority);
		userAccount.setAuthorities(authorities);

		result.setSponsorships(new ArrayList<Sponsorship>());
		result.setMessageBoxes(new ArrayList<MessageBox>());
		result.setSocialIdentities(new ArrayList<SocialIdentity>());
		result.setUserAccount(userAccount);
		result.setUsername(result.getUserAccount().getUsername());

		return result;
	}

	public Sponsor findOne(final int sponsorID) {
		final Sponsor result = this.sponsorRepository.findOne(sponsorID);
		Assert.notNull(result);

		return result;
	}

	public Collection<Sponsor> findAll() {
		final Collection<Sponsor> result = this.sponsorRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Sponsor save(final Sponsor sponsor) {
		Assert.notNull(sponsor);
		final Sponsor result;
		final UserAccount userAccount;

		if (sponsor.getId() == 0) {
			sponsor.setMessageBoxes(this.messageBoxService.createSystemMessageBox());
			if (!sponsor.getPhoneNumber().startsWith("+")) {
				final String countryCode = this.configurationsService.getConfiguration().getCountryCode();
				final String phoneNumer = sponsor.getPhoneNumber();
				sponsor.setPhoneNumber(countryCode.concat(phoneNumer));
			}
			result = this.sponsorRepository.save(sponsor);
		} else {
			userAccount = LoginService.getPrincipal();
			Assert.isTrue(userAccount.equals(sponsor.getUserAccount()));
			if (!sponsor.getPhoneNumber().startsWith("+")) {
				final String countryCode = this.configurationsService.getConfiguration().getCountryCode();
				final String phoneNumer = sponsor.getPhoneNumber();
				sponsor.setPhoneNumber(countryCode.concat(phoneNumer));
			}
			result = this.sponsorRepository.save(sponsor);
		}

		return result;
	}

	public void delete(final Sponsor sponsor) {
		Assert.notNull(sponsor);

		this.sponsorRepository.delete(sponsor);
	}
	
	
	
	/****************************************************************** 
	 * Reconstruct form object, check validity and update binding 
	 * ***************************************************************/
	public Sponsor reconstruct(SponsorForm form, BindingResult binding) {
		Sponsor sponsor = this.create();

		sponsor.getUserAccount().setPassword(form.getUserAccount().getPassword());
		sponsor.getUserAccount().setUsername(form.getUserAccount().getUsername());

		sponsor.setAddress(form.getAddress());
		sponsor.setEmail(form.getEmail());
		sponsor.setMiddleName(form.getMiddleName());
		sponsor.setName(form.getName());
		sponsor.setPhoneNumber(form.getPhoneNumber());
		sponsor.setPhoto(form.getPhoto());
		sponsor.setSurname(form.getSurname());


		// Default attributes from Actor
		sponsor.setUsername(form.getUserAccount().getUsername());
		sponsor.setIsBanned(false);

		this.validator.validate(sponsor, binding);

		return sponsor;
	}
	
	
	
	
	
	
	
	
	// Other business methods
	public Sponsor findByPrincipal() {
		Sponsor result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Sponsor findByUserAccount(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		Sponsor result;

		result = this.sponsorRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

}