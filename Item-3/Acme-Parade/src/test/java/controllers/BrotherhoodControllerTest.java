package controllers;




import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;

import javax.transaction.Transactional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import domain.Brotherhood;
import domain.Configurations;
import services.BrotherhoodService;
import services.ConfigurationsService;


@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class BrotherhoodControllerTest {
	
	@Mock
	private BrotherhoodService brotherhoodService;
	
	@Mock
	private ConfigurationsService configurationsService;
	
	@InjectMocks
	private BrotherhoodController brotherhoodController;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		// Process mock annotations
        MockitoAnnotations.initMocks(this);

        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(this.brotherhoodController).build();
        
	}
	
	/**
	 * 
	 * Prueba que la lista de mensajes que crea el servicio es la que se le pasa
	 * y utiliza el controllador.
	 */
	
	@Test
	public void testListMessages() throws Exception{
		ArrayList<Brotherhood> brotherhoods = new ArrayList<>();
		brotherhoods.add(this.brotherhoodService.create());
		brotherhoods.add(this.brotherhoodService.create());
		
		String title = "title";
		String logo = "https://tinyurl.com/acme-madruga";
		
		Configurations config = new Configurations();
		config.setTitle(title);
		config.setLogo(logo);
		
		// Config from AbstractController 
		when(this.configurationsService.getConfiguration()).thenReturn(config);
		
		// Check BrotherhoodController
		when(this.brotherhoodService.findAll()).thenReturn(brotherhoods);
		
		this.mockMvc.perform(get("/brotherhood/list"))
					.andExpect(status().isOk())
					.andExpect(view().name("brotherhood/list"))
					.andExpect(model().attribute("brotherhoods", hasSize(2)));
				
	}
}