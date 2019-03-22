
package usecases;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import services.BrotherhoodService;
import services.HistoryService;
import services.InceptionRecordService;
import services.PeriodRecordService;
import utilities.AbstractTest;
import domain.InceptionRecord;
import domain.PeriodRecord;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ManageHistoryTest extends AbstractTest {

	// Systems under test ------------------------------------------------------
	@Autowired
	private HistoryService			historyService;

	@Autowired
	private InceptionRecordService	inceptionRecordService;

	@Autowired
	private PeriodRecordService		periodRecordService;

	// Supporting services
	@Autowired
	private BrotherhoodService		brotherhoodService;


	// Test ------------------------------------------------------

	/** Test about history, all are done using brothehood1 account **/

	/*
	 * Brotherhoods can manage their histories: Inception record
	 * 
	 * 01- Change title and description, Correct
	 * 02- Change title and description, blank title; Erroe
	 */

	@Test
	public void driverInception() {
		final Object testingData[][] = {
			// exception, title, description
			{
				null, "Test title", "Test description"
			}, {
				ConstraintViolationException.class, "Test title", null
			}, {
				ConstraintViolationException.class, null, "Test Description"
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateInception((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2]);
	}

	/*
	 * Brotherhoods can manage their histories: Period record
	 * 
	 * 01- Change title, description, start year and end year; Correct
	 * 02- blank title; Error
	 * 03- End before star; Error
	 */

	@Test
	public void driverPeriod() {
		final Object testingData[][] = {
			// exception, title, description, start, end
			{
				null, "Test title", "Test description", 2010, 2011
			}, {
				ConstraintViolationException.class, null, "Test description", 2010, 2011
			}, {
				ConstraintViolationException.class, null, "Test description", 2011, 2010
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.templatePeriod((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2],
				(Integer) testingData[i][3], (Integer) testingData[i][4]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void templatePeriod(Class<?> expected, String title, String description, Integer startYear, Integer endYear) {
		Class<?> caught;
		caught = null;

		try {
			// Authentication
			authenticate("brotherhood1");

			// Creating a period record
			PeriodRecord record = this.periodRecordService.create();

			// Applying the changes
			record.setTitle(title);
			record.setDescription(description);
			record.setStartYear(startYear);
			record.setEndYear(endYear);

			this.periodRecordService.save(record);
			this.periodRecordService.flush();
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

	// Ancillary methods ------------------------------------------------------
	protected void templateInception(Class<?> expected, String title, String description) {
		Class<?> caught;
		caught = null;

		try {
			// Authentication
			authenticate("brotherhood1");

			// Getting the inception record
			InceptionRecord record = this.brotherhoodService.findByPrincipal()
				.getHistory().getInceptionRecord();

			// Applying the changes
			record.setTitle(title);
			record.setDescription(description);

			this.inceptionRecordService.save(record);
			this.inceptionRecordService.flush();
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

}
/*
 * 
 * System.out.println(oops.getMessage());
 * System.out.println(oops.getClass());
 * System.out.println(oops.getCause());
 */