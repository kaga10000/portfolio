package daiabongd.com.project.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class lectureController {
	
	private static final Logger logger = LoggerFactory.getLogger(lectureController.class);
	
	@RequestMapping(value = "lecture_korea")
	public String lecture_korea() {
		
		return "Category/lecture/lecture_Detail/lecture_korea";
	}
	@RequestMapping(value = "lecture_english", method = RequestMethod.GET)
	public String lecture_english() {
		
		return "Category/lecture/lecture_Detail/lecture_english";
	}
	@RequestMapping(value = "lecture_math", method = RequestMethod.GET)
	public String lecture_math() {
		
		return "Category/lecture/lecture_Detail/lecture_math";
	}
	@RequestMapping(value = "lecture_science", method = RequestMethod.GET)
	public String lecture_science() {
		
		return "Category/lecture/lecture_Detail/lecture_science";
	}
	@RequestMapping(value = "lecture_society", method = RequestMethod.GET)
	public String lecture_society() {
		
		return "Category/lecture/lecture_Detail/society";
	}
	@RequestMapping(value = "lecture_programming", method = RequestMethod.GET)
	public String lecture_programming() {
		
		return "Category/lecture/lecture_Detail/lecture_programming";
	}
}
