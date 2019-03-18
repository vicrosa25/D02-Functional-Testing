
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

import repositories.ProcessionRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Actor;
import domain.Brotherhood;
import domain.Enrol;
import domain.Member;
import domain.Message;
import domain.Path;
import domain.Procession;
import domain.Request;

@Service
@Transactional
public class ProcessionService {

	// Manage Repository
	@Autowired
	private ProcessionRepository	processionRepository;

	// Supporting services
	@Autowired
	private ActorService			actorService;

	@Autowired
	private MessageService			messageService;

	@Autowired
	private MemberService			memberService;

	// Validator
	@Autowired
	private Validator				validator;


	/************************************* CRUD methods ********************************/

	public Procession create() {
		Procession result;

		result = new Procession();
		result.setTicker(this.generateTicker());
		result.setPaths(new ArrayList<Path>());
		result.setRequests(new ArrayList<Request>());

		return result;
	}

	public Procession findOne(final int id) {
		final Procession result = this.processionRepository.findOne(id);

		Assert.notNull(result);

		return result;
	}

	@Transactional
	public Collection<Procession> findAll() {
		final Collection<Procession> result = this.processionRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Procession save(final Procession procession) {
		Assert.notNull(procession);
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

		if (procession.getId() == 0) {
			Assert.isInstanceOf(Brotherhood.class, principal);
			final Brotherhood brotherhood = (Brotherhood) principal;
			procession.setBrotherhood(brotherhood);
			this.automaticNotification(procession);
			if (procession.getDraftMode() == false) {
				Assert.isTrue(procession.getStatus() == "SUBMITTED");
			}
		} else {
			if (principal.getClass().equals(Brotherhood.class)) {
				final Brotherhood brotherhood = (Brotherhood) principal;
				Assert.isTrue(brotherhood.getProcessions().contains(procession));
				if (procession.getDraftMode() == false) {
					//Assert.isTrue(procession.getStatus() == "SUBMITTED"); //TODO
				}
			}
		}

		return this.processionRepository.save(procession);
	}

	public void delete(final Procession procession) {
		Assert.notNull(procession);
		Actor principal;

		// Principal must be a Brotherhood
		principal = this.actorService.findByPrincipal();
		Assert.isInstanceOf(Brotherhood.class, principal);
		Assert.isTrue(procession.getId() != 0);

		final Brotherhood brotherhood = (Brotherhood) principal;
		Assert.isTrue(brotherhood.getProcessions().contains(procession));

		this.processionRepository.delete(procession);

	}

	/************************************* Reconstruct ******************************************/
	public Procession reconstruct(final Procession pruned, final BindingResult binding) {
		Procession result = this.create();
		Procession temp;

		if (pruned.getId() == 0) {
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

			this.validator.validate(result, binding);
		}

		return result;
	}

	// Reconstruct for rejected parades
	public Procession reconstructRejected(final Procession pruned, final BindingResult binding) {
		Procession result = this.create();
		Procession temp;

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

	private void automaticNotification(final Procession procession) {
		if (!procession.getBrotherhood().getEnrols().isEmpty()) {
			final Message message = this.messageService.create();
			message.setBody("The brotherhood " + procession.getBrotherhood().getTitle() + " has published a procession called " + procession.getTitle() + ".");

			message.setIsNotification(true);
			for (final Member m : this.memberService.findByBrotherhood(procession.getBrotherhood())) {
				message.getMessageBoxes().add(m.getMessageBox("in"));
				message.getRecipients().add(m);
			}
			message.setPriority("MEDIUM");
			message.setSubject("New procession by " + procession.getBrotherhood().getTitle());

			this.messageService.save(message);
		}
	}

	public Collection<Procession> findByBrotherhoodNotDraftAndApproved(final int brotherhoodId) {
		final Collection<Procession> result = this.processionRepository.findByBrotherhoodNotDraftAndApproved(brotherhoodId);
		Assert.notNull(result);
		return result;
	}

	public Collection<Procession> findByBrotherhoodNotDraft(final int brotherhoodId) {
		final Collection<Procession> result = this.processionRepository.findByBrotherhoodNotDraft(brotherhoodId);
		Assert.notNull(result);
		return result;
	}

	public Collection<Procession> findAllMemberToRequest(final Member member) {
		final Collection<Procession> result = new ArrayList<Procession>();
		// Todas las brotherhood a las que pertenece, de ahi las que no tenga request suyas
		for (final Enrol enrol : member.getEnrols()) {
			result.addAll(this.findByBrotherhoodNotDraft(enrol.getBrotherhood().getId()));
		}
		for (final Request r : member.getRequests()) {
			result.remove(r.getProcession());
		}

		Assert.notNull(result);

		return result;
	}

	public Collection<Procession> getProcessionsSortedByStatus(int brotherhoodId) {
		Collection<Procession> result = this.processionRepository.getProcessionsSortedByStatus(brotherhoodId);
		Assert.notNull(result);
		return result;
	}
}
