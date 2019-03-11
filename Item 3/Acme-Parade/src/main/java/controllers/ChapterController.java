package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import services.ChapterService;

@Controller
@RequestMapping("/chapter")
public class ChapterController extends AbstractController {
	
	@Autowired
	private ChapterService 	chapterService;

}
