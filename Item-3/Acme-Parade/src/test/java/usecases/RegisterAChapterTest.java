
package usecases;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Chapter;
import services.ChapterService;
import utilities.AbstractTest;
import utilities.Md5;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class RegisterAChapterTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private ChapterService chapterService;

	// Test ------------------------------------------------------


	/*
	 * An actor who is not authenticated must be able to:
	 * Register to the system as a Chapter. As of the time of registering,
	 * 
	 * 01- All ok
	 * 02- Blank username; Error
	 * 04- Blank name; Error
	 * 05- Blank middlename; Error
	 * 06- Blank suername; Error
	 * 07- Blank photo; Error
	 * 08- Blank mail; Error
	 * 09- Blank phoneNumber; Error
	 * 10- Blank title; Error
	 */

	@Test
	public void driver() {
		final Object testingData[][] = {
			{
				null, "pass", "userName", "name", "middleName", "surname", "http://pictureTest.com", "chapter@gmail.com", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "", "name", "middleName", "surname", "http://pictureTest.com", "chapter@gmail.com", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "", "middleName", "surname", "http://pictureTest.com", "chapter@gmail.com", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "name", "", "surname", "http://pictureTest.com", "chapter@gmail.com", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "name", "middleName", "", "http://pictureTest.com", "chapter@gmail.com", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "name", "middleName", "surname", "", "chapter@gmail.com", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "name", "middleName", "surname", "http://pictureTest.com", "", "123456789", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "name", "middleName", "surname", "http://pictureTest.com", "chapter@gmail.com", "", "Chapter1"
			}, {
				ConstraintViolationException.class, "pass", "userName", "name", "middleName", "surname", "http://pictureTest.com", "chapter@gmail.com", "123456789", ""
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.template((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], 
						  (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], 
						  (String) testingData[i][6], (String) testingData[i][7], (String) testingData[i][8], 
						  (String) testingData[i][9]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void template(Class<?> expected, String pass, String userName, String name, 
							String middleName, String surname, String photo, String email, 
							String phoneNumber, String title) {
		Class<?> caught;
		caught = null;

		try {
			String password;
			int i;
			i = this.chapterService.findAll().size();

			this.authenticate(null);

			// Create new Chapter
			Chapter chapter = this.chapterService.create();
			
			
			// Chapter Attributes
			password = Md5.encodeMd5(pass);
			chapter.getUserAccount().setPassword(password);
			chapter.getUserAccount().setUsername(userName);
			chapter.setName(name);
			chapter.setEmail(middleName);
			chapter.setPhoneNumber(surname);
			chapter.setPhoto(photo);
			chapter.setSurname(email);
			chapter.setPhoneNumber(phoneNumber);
			chapter.setTitle(title);
			
			// Chapter Relatioships
			chapter.setProclaims(null);
			chapter.setAddress(null);
			
			
			chapter.setIsBanned(false);
			
			// Save new Chorbi
			this.chapterService.save(chapter);

			Assert.isTrue(this.chapterService.findAll().size() > i);
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

}
