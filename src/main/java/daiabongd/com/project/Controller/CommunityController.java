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
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping(value = "Community_board")
	public String Community_board() {
		
		return "Category/Community/Community_Detail/Community_board";
	}
	@RequestMapping(value = "Community_kakao", method = RequestMethod.GET)
	public String Community_kakao() {
		
		return "Category/Community/Community_Detail/Community_kakao";
	}
	@RequestMapping(value = "Community_Suggestions", method = RequestMethod.GET)
	public String Community_Suggestions() {
		
		return "Category/Community/Community_Detail/Community_Suggestions";
	}

}
