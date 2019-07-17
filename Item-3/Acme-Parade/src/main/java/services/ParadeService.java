
package services;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import domain.Actor;
import domain.Brotherhood;
import domain.Enrol;
import domain.Member;
import domain.Message;
import domain.Parade;
import domain.Request;
import domain.Sponsorship;
import repositories.ParadeRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;

@Service
@Transactional
public class ParadeService {

	// Manage Repository
	@Autowired
	private ParadeRepository	paradeRepository;

	// Supporting services
	@Autowired
	private ActorService		actorService;

	@Autowired
	private BrotherhoodService	brotherhoodService;

	@Autowired
	private MessageService		messageService;

	@Autowired
	private MemberService		memberService;

	@Autowired
	private SponsorshipService	sponsorshipService;

	@Autowired
	private PathService			pathService;

	// Validator
	@Autowired
	private Validator			validator;


	/************************************* CRUD methods ********************************/

	public Parade create() {
		Parade result;

		result = new Parade();
		result.setTicker(this.generateTicker());
		result.setRequests(new ArrayList<Request>());

		return result;
	}

	public Parade findOne(final int id) {
		final Parade result = this.paradeRepository.findOne(id);

		Assert.notNull(result);

		return result;
	}

	@Transactional
	public Collection<Parade> findAll() {
		final Collection<Parade> result = this.paradeRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Parade save(final Parade parade) {
		Assert.notNull(parade);
		Actor principal;

		principal = this.actorService.findByPrincipal();

		// Principal must be a Brotherhood
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Authority broAuthority = new Authority();
		broAuthority.setAuthority("BROTHERHOOD");

		final Authority chapterAuthority = new Authority();
		chapterAuthority.setAuthority("CHAPTER");

		Assert.isTrue(userAccount.getAuthorities().contains(broAuthority) || userAccount.getAuthorities().contains(chapterAuthority));

		if (parade.getId() == 0) {
			Assert.isInstanceOf(Brotherhood.class, principal);
			final Brotherhood brotherhood = (Brotherhood) principal;
			parade.setBrotherhood(brotherhood);
			if (parade.getDraftMode() == false) {
				parade.setStatus("SUBMITTED");
			}
			this.automaticNotification(parade);
		} else {
			if (principal.getClass().equals(Brotherhood.class)) {
				final Brotherhood brotherhood = (Brotherhood) principal;
				Assert.isTrue(brotherhood.getParades().contains(parade));
				if (parade.getDraftMode() == false) {
					//Assert.isTrue(parade.getStatus() == "SUBMITTED"); //TODO
				}
			}
		}

		return this.paradeRepository.save(parade);
	}

	public void delete(final Parade parade) {
		Assert.notNull(parade);
		Actor principal;

		// Principal must be a Brotherhood
		principal = this.actorService.findByPrincipal();
		Assert.isInstanceOf(Brotherhood.class, principal);
		Assert.isTrue(parade.getId() != 0);

		final Brotherhood brotherhood = (Brotherhood) principal;
		Assert.isTrue(brotherhood.getParades().contains(parade));

		for (Sponsorship s : this.sponsorshipService.findByParade(parade)) {
			this.sponsorshipService.deleteBrotherhood(s);
		}
		if (parade.getPath() != null) {
			this.pathService.delete(parade.getPath());
		}

		this.paradeRepository.delete(parade);

	}

	/************************************* Reconstruct ******************************************/
	public Parade reconstruct(final Parade pruned, final BindingResult binding) {
		Parade result = this.create();
		Parade temp;

		if (pruned.getId() == 0) {
			pruned.setStatus(null);
			this.validator.validate(pruned, binding);
			result = pruned;
		} else {
			temp = this.findOne(pruned.getId());
			result.setId(temp.getId());
			result.setVersion(temp.getVersion());
			result.setBrotherhood(temp.getBrotherhood());
			result.setTicker(temp.getTicker());

			result.setTitle(pruned.getTitle());
			result.setDescription(pruned.getDescription());
			result.setMoment(pruned.getMoment());
			result.setDraftMode(pruned.getDraftMode());
			if (!pruned.getDraftMode()) {
				result.setStatus("SUBMITTED");
			}

			this.validator.validate(result, binding);
		}

		return result;
	}

	// Reconstruct for rejected parades
	public Parade reconstructRejected(final Parade pruned, final BindingResult binding) {
		Parade result = this.create();
		Parade temp;

		if (pruned.getId() == 0) {
			this.validator.validate(pruned, binding);
			result = pruned;
		} else {
			temp = this.findOne(pruned.getId());
			result.setId(temp.getId());
			result.setVersion(temp.getVersion());
			result.setBrotherhood(temp.getBrotherhood());
			result.setTicker(temp.getTicker());
			result.setTitle(temp.getTitle());
			result.setDescription(temp.getDescription());
			result.setMoment(temp.getMoment());
			result.setDraftMode(temp.getDraftMode());

			// Edit attributes
			result.setReasson(pruned.getReasson());

			this.validator.validate(result, binding);
		}

		return result;
	}

	/************************************* Other business methods ********************************/
	public String generateTicker() {
		String ticker = "";
		final DateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		final Date date = new Date();
		final String tickerDate = (dateFormat.format(date));
		final String tickerAlphanumeric = RandomStringUtils.randomAlphanumeric(5).toUpperCase();
		ticker = ticker.concat(tickerDate).concat("-").concat(tickerAlphanumeric);
		return ticker;
	}

	private void automaticNotification(final Parade parade) {
		if (!parade.getBrotherhood().getEnrols().isEmpty()) {
			final Message message = this.messageService.create();
			message.setBody("The brotherhood " + parade.getBrotherhood().getTitle() + " has published a parade called " + parade.getTitle() + ".");

			message.setIsNotification(true);
			message.setPriority("MEDIUM");
			message.setSubject("New parade by " + parade.getBrotherhood().getTitle());
			Collection<Actor> recipients = new ArrayList<Actor>(this.memberService.findByBrotherhood(parade.getBrotherhood()));
			message.setRecipients(recipients);

			for (Actor actor : recipients) {
				message.getMessageBoxes().add(actor.getMessageBox("in"));
			}

			this.messageService.save(message);
		}
	}

	public Collection<Parade> findByBrotherhoodNotDraftAndApproved(final int brotherhoodId) {
		final Collection<Parade> result = this.paradeRepository.findByBrotherhoodNotDraftAndApproved(brotherhoodId);
		Assert.notNull(result);
		return result;
	}

	public Collection<Parade> findByBrotherhoodNotDraft(final int brotherhoodId) {
		final Collection<Parade> result = this.paradeRepository.findByBrotherhoodNotDraft(brotherhoodId);
		Assert.notNull(result);
		return result;
	}

	public Collection<Parade> findAllMemberToRequest(final Member member) {
		final Collection<Parade> result = new ArrayList<Parade>();
		// Todas las brotherhood a las que pertenece, de ahi las que no tenga request suyas
		for (final Enrol enrol : member.getEnrols()) {
			result.addAll(this.findByBrotherhoodNotDraft(enrol.getBrotherhood().getId()));
		}
		for (final Request r : member.getRequests()) {
			result.remove(r.getParade());
		}

		Assert.notNull(result);

		return result;
	}

	public Collection<Parade> getParadesSortedByStatus(int brotherhoodId) {
		Collection<Parade> result = this.paradeRepository.getParadesSortedByStatus(brotherhoodId);
		Assert.notNull(result);
		return result;
	}

	public Collection<Parade> findAllAccepted() {
		Collection<Parade> result = this.paradeRepository.findAllAccepted();
		return result;
	}

	public Parade copy(int paradeId) {
		Parade parade = this.findOne(paradeId);
		Brotherhood principal = this.brotherhoodService.findByPrincipal();

		Assert.isTrue(principal.getParades().contains(parade));

		Parade copy = this.create();
		copy.setBrotherhood(principal);
		copy.setDescription(parade.getDescription());
		copy.setDraftMode(true);
		copy.setMoment(parade.getMoment());
		copy.setTitle(parade.getTitle());

		copy = this.save(copy);
		principal.getParades().add(copy);
		return copy;
	}
}
