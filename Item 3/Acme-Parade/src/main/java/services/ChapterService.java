package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Chapter;
import domain.MessageBox;
import repositories.ChapterRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;

@Service
@Transactional
public class ChapterService {
	
	// Manage Repository
	@Autowired
	private ChapterRepository		chapterRepository;
	
	
	// Supporting services
	@Autowired
	private MessageBoxService		messageBoxService;
	
	@Autowired
	private ConfigurationsService 	configurationsService;
	
	
	/*************************************
	 * CRUD methods
	 *************************************/
	public Chapter create() {
		
		Chapter result;
		
		// UserAccount
		UserAccount userAccount = new UserAccount();
		Collection<Authority> authorities = new ArrayList<Authority>();
		Authority authority = new Authority();
		authority.setAuthority(Authority.CHAPTER);
		authorities.add(authority);
		userAccount.setAuthorities(authorities);

		// MessageBox
		Collection<MessageBox> boxes = this.messageBoxService.createSystemMessageBox();

		// Default settings
		result = new Chapter();
		result.setUserAccount(userAccount);
		result.setMessageBoxes(boxes);

		return result;
	}
	
	public Collection<Chapter> findAll() {
		Collection<Chapter> result = this.chapterRepository.findAll();
		Assert.notNull(result);
		
		return result;
	}
	
	public Chapter findOne(int chapterID) {
		Chapter result = this.chapterRepository.findOne(chapterID);
		Assert.notNull(result);
		
		return result;
	}
	
	public Chapter save(Chapter chapter) {
		Assert.notNull(chapter);
		UserAccount userAccount;

		if (chapter.getId() == 0) {
			chapter.setMessageBoxes(this.messageBoxService.createSystemMessageBox());
			if (!chapter.getPhoneNumber().startsWith("+")) {
				String countryCode = this.configurationsService.getConfiguration().getCountryCode();
				String phoneNumer = chapter.getPhoneNumber();
				chapter.setPhoneNumber(countryCode.concat(phoneNumer));
			}
		} else {
			if (!chapter.getPhoneNumber().startsWith("+")) {
				String countryCode = this.configurationsService.getConfiguration().getCountryCode();
				String phoneNumer = chapter.getPhoneNumber();
				chapter.setPhoneNumber(countryCode.concat(phoneNumer));
			}
			
			userAccount = LoginService.getPrincipal();
			Assert.isTrue(userAccount.equals(chapter.getUserAccount()));
		}
		
		
		return this.chapterRepository.save(chapter);
	}
	
	public void delete(Chapter chapter) {
		Assert.notNull(chapter);
		Assert.isTrue(chapter.getId() != 0);
		this.chapterRepository.delete(chapter);
	}

	/*************************************
	 * Other business methods
	 *************************************/
	public Chapter findByPrincipal() {
		Chapter result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Chapter findByUserAccount(UserAccount userAccount) {
		Assert.notNull(userAccount);

		Chapter result;

		result = this.chapterRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

}
