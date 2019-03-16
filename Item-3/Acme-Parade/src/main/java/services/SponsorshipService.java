
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Sponsor;
import domain.Sponsorship;
import repositories.SponsorshipRepository;

@Service
@Transactional
public class SponsorshipService {

	// Manage Repository
	@Autowired
	private SponsorshipRepository sponsorshipRepository;
	
	@Autowired
	private SponsorService		  sponsorService;

	
	// CRUD methods
	public Sponsorship create() {
		final Sponsorship result = new Sponsorship();

		Sponsor principal = this.sponsorService.findByPrincipal();
		
		result.setSponsor(principal);
		
		return result;
	}

	public Sponsorship findOne(final int sponsorshipID) {
		final Sponsorship result = this.sponsorshipRepository.findOne(sponsorshipID);
		Assert.notNull(result);

		return result;
	}

	public Collection<Sponsorship> findAll() {
		final Collection<Sponsorship> result = this.sponsorshipRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Sponsorship save(Sponsorship sponsorship) {
		Assert.notNull(sponsorship);
		Assert.isTrue(sponsorship.getProcession().getStatus().equals("APPROVED"));
		
		
		Sponsorship result = this.sponsorshipRepository.save(sponsorship);

		return result;
	}

	public void delete(final Sponsorship sponsorship) {
		Assert.notNull(sponsorship);

		this.sponsorshipRepository.delete(sponsorship);
	}

	// Other business methods
	public Collection<Sponsorship> findBySponsor(int sponsorId) {
		return this.sponsorshipRepository.findBySponsor(sponsorId);
	}
}
