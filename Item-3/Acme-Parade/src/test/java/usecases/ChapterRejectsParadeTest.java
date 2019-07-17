
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import domain.Parade;
import services.ChapterService;
import services.ParadeService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ChapterRejectsParadeTest extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private ChapterService	chapterService;

	@Autowired
	private ParadeService	paradeService;


	// Tests -----------------------------------------------------------------------------------------

	/**
	 * Requirement: An actor who is authenticated as a chapter must be able to: "Chapter rejects a Parade"
	 * 
	 * 1. Positive test.
	 * 
	 **/
	@Test
	public void selfAssignaAnArea() {
		int paradeId;
		Parade parade;

		paradeId = super.getEntityId("parade2");
		parade = this.paradeService.findOne(paradeId);

		super.authenticate("chapter2");
		this.chapterService.rejectParade(parade);

		super.unauthenticate();

	}

	/**
	 * Requirement: An actor who is authenticated as a chapter must be albe to: "Chapter rejects a Parade"
	 * 
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as a chapter
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void testBanRequestNotAadmin() {
		int paradeId;
		Parade parade;

		// Get the Parade
		paradeId = super.getEntityId("parade2");
		parade = this.paradeService.findOne(paradeId);

		// Chapter is not authenticate
		this.authenticate(null);

		this.chapterService.rejectParade(parade);

		this.unauthenticate();
	}

}
