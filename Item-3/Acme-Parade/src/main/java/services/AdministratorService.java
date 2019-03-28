
package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AdministratorRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Actor;
import domain.Administrator;
import domain.Brotherhood;
import domain.Chapter;
import domain.CreditCard;
import domain.Message;
import domain.MessageBox;
import domain.Procession;
import domain.Sponsorship;

@Service
@Transactional
public class AdministratorService {

	// Manage Repository
	@Autowired
	private AdministratorRepository	adminRepository;

	// Supporting services
	@Autowired
	private ConfigurationsService	configurationsService;

	@Autowired
	private ActorService			actorService;

	@Autowired
	private MessageBoxService		messageBoxService;

	@Autowired
	private MessageService			messageService;

	@Autowired
	private SponsorshipService		sponsorshipService;


	/*************************************
	 * CRUD methods
	 ********************************/
	public Administrator create() {
		// Initialice
		final UserAccount userAccount = new UserAccount();
		final Collection<Authority> authorities = new ArrayList<Authority>();
		final Authority authority = new Authority();
		authority.setAuthority(Authority.ADMIN);
		authorities.add(authority);
		userAccount.setAuthorities(authorities);

		final Collection<MessageBox> boxes = this.messageBoxService.createSystemMessageBox();

		final Administrator admin = new Administrator();
		admin.setUserAccount(userAccount);
		admin.setMessageBoxes(boxes);
		admin.setIsSpammer(false);

		return admin;
	}

	public Collection<Administrator> findAll() {
		final Collection<Administrator> result = this.adminRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Administrator findOne(final int adminID) {
		final Administrator result = this.adminRepository.findOne(adminID);
		Assert.notNull(result);
		return result;
	}

	public Administrator save(final Administrator admin) {
		Assert.notNull(admin);
		UserAccount userAccount;

		if (admin.getId() == 0) {
			admin.setMessageBoxes(this.messageBoxService.createSystemMessageBox());
			if (!admin.getPhoneNumber().startsWith("+")) {
				final String countryCode = this.configurationsService.getConfiguration().getCountryCode();
				final String phoneNumer = admin.getPhoneNumber();
				admin.setPhoneNumber(countryCode.concat(phoneNumer));
			}
		} else {
			if (!admin.getPhoneNumber().startsWith("+")) {
				final String countryCode = this.configurationsService.getConfiguration().getCountryCode();
				final String phoneNumer = admin.getPhoneNumber();
				admin.setPhoneNumber(countryCode.concat(phoneNumer));
			}
			userAccount = LoginService.getPrincipal();
			Assert.isTrue(userAccount.equals(admin.getUserAccount()));
		}
		return this.adminRepository.save(admin);
	}

	public void delete(final Administrator admin) {
		Assert.notNull(admin);
		Assert.isTrue(admin.getId() != 0);
		this.adminRepository.delete(admin);
	}

	/*************************************
	 * Other business methods
	 ********************************/
	public Administrator findByPrincipal() {
		Administrator result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Administrator findByUserAccount(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		Administrator result;

		result = this.adminRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

	// 12.1 Create user accounts for new
	// administrators---------------------------------------------------
	public Administrator registerNewAdmin(final Administrator admin) {
		Administrator principal;

		// Make sure that the principal is an Admin
		principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		// Check admin is not null
		Assert.notNull(admin);

		// Saves admin in the databese
		return this.adminRepository.save(admin);
	}


	/**
	 * 
	 * Admin Dashboard Queries ****************************************************************************
	 */

	// 12.3 Display a dashboard with the following information-------------------------------
	public Object[] query1() {
		return this.adminRepository.query1();
	}

	public Collection<Brotherhood> query2() {
		final Collection<Brotherhood> result = this.adminRepository.query2();
		return result;
	}

	public Collection<Brotherhood> query3() {
		final Collection<Brotherhood> result = this.adminRepository.query3();
		return result;
	}

	public Collection<Double> query4() {
		final Collection<Double> result = this.adminRepository.query4();
		return result;
	}

	public Collection<Procession> query5() {
		Collection<Procession> result;
		final Calendar c = new GregorianCalendar();
		c.add(Calendar.DATE, 30);
		final Date date = c.getTime();
		result = this.adminRepository.query5(date);
		return result;
	}

	public Collection<Object> query7() {
		return this.adminRepository.query7();
	}

	public Collection<Object> query8() {
		return this.adminRepository.query8();
	}

	// 22.2 Display a dashboard with the following information-----------------------------
	public Object[] query9() {
		return this.adminRepository.query9();
	}

	public Object[] query10() {
		return this.adminRepository.query10();
	}

	public Double query11() {
		return this.adminRepository.query11();
	}

	// Chart Queries
	public int[] querySpammersGetValues() {
		int[] values = new int[2];

		values[0] = this.adminRepository.getAllSpammers();
		values[1] = this.adminRepository.getAllNotSpammers();
		return values;
	}

	public int queryGetSpammers() {
		return this.adminRepository.getAllSpammers();
	}

	public int queryGetNotSpammers() {
		return this.adminRepository.getAllNotSpammers();
	}

	public Double getAveragePolarity() {
		return this.adminRepository.getAveragePolarity();
	}

	// ACME PARADE queries level C, requeriment 4 ----------------------------------------------
	public Object[] query12() {
		return this.adminRepository.query12();
	}

	public Brotherhood query13() {
		return this.adminRepository.query13();
	}

	public Collection<Brotherhood> query14() {
		return this.adminRepository.query14();
	}

	// ACME PARADE queries level B -------------------------------------------------------------
	public Double query15() {
		return this.adminRepository.query15();
	}

	public Object[] query16() {
		return this.adminRepository.query16();
	}

	public Collection<Chapter> query17() {
		return this.adminRepository.query17();
	}

	public Double query18() {
		return this.adminRepository.query18();
	}

	public Collection<Object> query19() {
		return this.adminRepository.query19();
	}

	// ACME PARADE queries level B -------------------------------------------------------------
	public Double query20() {
		return this.adminRepository.query20();
	}

	public Object[] query21() {
		return this.adminRepository.query21();
	}

	public Collection<Object> query22(int top) {
		Collection<Object> queryResult = this.adminRepository.query22();
		Collection<Object> result = new ArrayList<Object>();

		int count = 0;
		for (Object o : queryResult)
			if (count <= top) {
				result.add(o);
				count++;
			} else
				break;

		return result;
	}

	// 28.2 Spammers procedure--------------------------------------------------------------------
	public void computeSpammers() {
		Actor principal;
		Collection<Message> messages;
		int spamMessages;
		final Collection<Actor> users = this.actorService.findAll();
		final Collection<String> spamWords = this.configurationsService.getConfiguration().getSpamWords();

		// Make sure that the principal is an Admin
		principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		for (final Actor user : users) {
			spamMessages = 0;
			messages = this.messageService.findAllBySender(user.getId());

			if ((messages != null) && !messages.isEmpty())
				for (final Message message : messages)
					for (final String spamWord : spamWords)
						if (message.getBody().contains(spamWord) || message.getSubject().contains(spamWord))
							spamMessages++;
			if ((spamMessages != 0) && (spamMessages >= (messages.size() * 0.1)))
				user.setIsSpammer(true);
			else
				user.setIsSpammer(false);
		}
	}

	// 28.2 Spammers actors--------------------------------------------------------------------
	public Collection<Actor> getSpammers() {
		Actor principal;

		// Make sure that the principal is an Admin
		principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		return this.actorService.findSpammers();
	}

	// 28.5 Ban an actor
	// ----------------------------------------------------------------
	public Actor banAnActor(final Actor actor) {
		Assert.notNull(actor);
		Assert.isTrue(actor.getIsSpammer());

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		actor.setUsername(actor.getUserAccount().getUsername());
		actor.getUserAccount().setUsername(null);
		actor.setIsBanned(true);

		return this.actorService.save(actor);

	}

	// 28.6 Unbans an actor, which means that his or her user account is
	// re-activated
	public Actor unBanAnActor(final Actor actor) {
		Assert.notNull(actor);
		// Assert.notNull(actor.getUsername());

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		actor.getUserAccount().setUsername(actor.getUsername());
		actor.setIsBanned(false);

		return this.actorService.save(actor);

	}

	// 50.1 Launch process that computes all actors polarity score
	public void computeAllScores() {

		Collection<Actor> actors;
		Collection<Message> messages;

		// Make sure that the principal is an Admin
		final Actor principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		actors = this.actorService.findAll();
		actors.remove(principal);

		for (final Actor actor : actors) {
			messages = this.messageService.findAllBySender(actor.getId());
			actor.setScore(this.computeScore(messages));
			this.actorService.save(actor);
		}
	}

	private Double computeScore(final Collection<Message> messages) {
		final Collection<String> positiveWords = this.configurationsService.getConfiguration().getPositiveWords();
		final Collection<String> negativeWords = this.configurationsService.getConfiguration().getNegativeWords();

		Double positiveWordsValue = 0.0;
		Double negativeWordsValue = 0.0;

		for (Message message : messages) {

			for (String positiveWord : positiveWords)
				if (message.getBody().contains(positiveWord) || message.getSubject().contains(positiveWord))
					positiveWordsValue += 1.0;
			for (String negativeWord : negativeWords)
				if (message.getBody().contains(negativeWord) || message.getSubject().contains(negativeWord))

					negativeWordsValue += 1.0;

		}

		// check for NaN values

		if (((positiveWordsValue + negativeWordsValue) == 0) || ((positiveWordsValue - negativeWordsValue) == 0))
			return 0.0;
		else
			return (positiveWordsValue - negativeWordsValue) / (positiveWordsValue + negativeWordsValue);

	}
	/**
	 * 
	 * 50.2 Manage polarity Word
	 * ****************************************************************************
	 */

	// 50.2 Manage the lists of positive and negative words
	public Collection<String> getPositiveWords() {
		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		final Collection<String> result = this.configurationsService.getConfiguration().getPositiveWords();
		Assert.notNull(result);
		Assert.notEmpty(result);

		return result;
	}

	public Collection<String> getNegativeWords() {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		final Collection<String> result = this.configurationsService.getConfiguration().getNegativeWords();
		Assert.notNull(result);
		Assert.notEmpty(result);

		return result;
	}

	public void addPositiveWord(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.isTrue(this.configurationsService.getConfiguration().getPositiveWords().contains(word) != true);

		this.configurationsService.getConfiguration().getPositiveWords().add(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	public void editPositiveWord(final String word, final Integer index) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.notNull(index);
		Assert.isTrue(this.configurationsService.getConfiguration().getPositiveWords().contains(word) != true);

		final ArrayList<String> words = new ArrayList<String>(this.configurationsService.getConfiguration().getPositiveWords());
		words.set(index, word);

		this.configurationsService.getConfiguration().setPositiveWords(words);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	public void removePositiveWord(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(this.configurationsService.getConfiguration().getPositiveWords().contains(word));

		this.configurationsService.getConfiguration().getPositiveWords().remove(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	public void addNegativeWord(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.isTrue(this.configurationsService.getConfiguration().getNegativeWords().contains(word) != true);

		this.configurationsService.getConfiguration().getNegativeWords().add(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	public void editNegativeWord(final String word, final Integer index) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.notNull(index);
		Assert.isTrue(this.configurationsService.getConfiguration().getNegativeWords().contains(word) != true);

		final ArrayList<String> words = new ArrayList<String>(this.configurationsService.getConfiguration().getNegativeWords());
		words.set(index, word);

		this.configurationsService.getConfiguration().setNegativeWords(words);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	public void removeNegativeWord(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(this.configurationsService.getConfiguration().getNegativeWords().contains(word));

		this.configurationsService.getConfiguration().getNegativeWords().remove(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	/**
	 * 
	 * Manage Spam Word ****************************************************************************
	 */

	// Add SPAM Word
	public void addSpamWord(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.isTrue(this.configurationsService.getConfiguration().getSpamWords().contains(word) != true);

		this.configurationsService.getConfiguration().getSpamWords().add(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	// Edit SPAM Word
	public void editSpamWord(final String word, final Integer index) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.notNull(index);

		Assert.isTrue(this.configurationsService.getConfiguration().getSpamWords().contains(word) != true);

		final ArrayList<String> words = new ArrayList<String>(this.configurationsService.getConfiguration().getSpamWords());
		words.set(index, word);

		this.configurationsService.getConfiguration().setSpamWords(words);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	// Remove SPAM Word
	public void removeSpamWord(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(this.configurationsService.getConfiguration().getSpamWords().contains(word));

		this.configurationsService.getConfiguration().getSpamWords().remove(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	/**
	 * 
	 * Process to deactivate Sponsorships **********************************************************************
	 */
	public void deactivateSponsorships() {
		Collection<Sponsorship> sponsorships;
		CreditCard card;
		Date expiration;
		Date now = new Date();
		sponsorships = this.sponsorshipService.findAll();

		for (Sponsorship sponsorship : sponsorships) {
			card = sponsorship.getCreditCard();
			expiration = card.getExpiration();

			if (expiration.after(now)) {
				sponsorship.setActive(false);
				this.sponsorshipService.save(sponsorship);
			}

		}
	}

	/**
	 * 
	 * Manage Brands ****************************************************************************
	 */

	// Add Brand
	public void addBrand(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.isTrue(this.configurationsService.getConfiguration().getBrandName().contains(word) != true);

		this.configurationsService.getConfiguration().getBrandName().add(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	// Edit Brand
	public void editBrand(final String word, final Integer index) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(word != "");
		Assert.notNull(index);

		Assert.isTrue(this.configurationsService.getConfiguration().getBrandName().contains(word) != true);

		final ArrayList<String> words = new ArrayList<String>(this.configurationsService.getConfiguration().getBrandName());
		words.set(index, word);

		this.configurationsService.getConfiguration().setBrandName(words);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	// Remove Brand
	public void removeBrand(final String word) {

		// Make sure that the principal is an Admin
		final Object principal = this.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);

		Assert.notNull(word);
		Assert.isTrue(this.configurationsService.getConfiguration().getBrandName().contains(word));

		this.configurationsService.getConfiguration().getBrandName().remove(word);
		this.configurationsService.update(this.configurationsService.getConfiguration());
	}

	public void informSecurityBreach() {
		final Message message = this.messageService.create();
		message.setBody("There has been a security breach in our data system.");

		message.setIsNotification(true);
		message.setPriority("HIGH");
		message.setSubject("Security breach");
		Collection<Actor> recipients = new ArrayList<Actor>(this.actorService.findAll());
		message.setRecipients(recipients);
			
		for (Actor actor : recipients) {
			message.getMessageBoxes().add(actor.getMessageBox("in"));
		}
			
		this.messageService.save(message);
		}
}
