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
public class IntroduceController {
	
	private static final Logger logger = LoggerFactory.getLogger(IntroduceController.class);
	
	@RequestMapping(value = "Introduce_korea")
	public String Introduce_korea() {
		
		return "Category/Introduce/Introduce_Detail/Introduce_korea";
	}
	@RequestMapping(value = "Introduce_english", method = RequestMethod.GET)
	public String Introduce_english() {
		
		return "Category/Introduce/Introduce_Detail/Introduce_english";
	}
	@RequestMapping(value = "Introduce_math", method = RequestMethod.GET)
	public String Introduce_math() {
		
		return "Category/Introduce/Introduce_Detail/Introduce_math";
	}
	@RequestMapping(value = "Introduce_science", method = RequestMethod.GET)
	public String Introduce_science() {
		
		return "Category/Introduce/Introduce_Detail/Introduce_science";
	}
	@RequestMapping(value = "Introduce_society", method = RequestMethod.GET)
	public String Introduce_society() {
		
		return "Category/Introduce/Introduce_Detail/Introduce_society";
	}
	@RequestMapping(value = "Introduce_programming", method = RequestMethod.GET)
	public String Introduce_programming() {
		
		return "Category/Introduce/Introduce_Detail/Introduce_programming";
	}
}
