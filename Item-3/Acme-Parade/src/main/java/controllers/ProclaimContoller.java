package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import services.ProclaimService;

@Controller
@RequestMapping("/proclaim")
public class ProclaimContoller extends AbstractController {
	
	
	@Autowired
	private ProclaimService		proclaimService;

}
