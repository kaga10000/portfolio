package daiabongd.com.project.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import daiabongd.com.project.Dao.IMemberDao;
import daiabongd.com.project.MM.MemberMM;
import daiabongd.com.project.Vo.member;
import daiabongd.com.project.Vo.review;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MemberMM mm;// new MemberMM();
	private IMemberDao mDao;// new MemberMM();

	ModelAndView mav;

	@RequestMapping(value = "/")
	public ModelAndView home(HttpSession session) {
		mav = mm.home(session);
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 완료");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() {

		return "test";
	}

	@RequestMapping(value = "category_goods", method = RequestMethod.GET)
	public String Goods_Main(HttpSession session, Model model) {
		String test = (String) session.getAttribute("id");
		model.addAttribute("id", test);
		return "Category/Goods/Goods_Main";
	}

	@RequestMapping(value = "Search_view", method = RequestMethod.GET)
	public ModelAndView search_view(@RequestParam("search_val") String search_val, HttpServletRequest req,
			Integer pageNum) {
		HashMap<String, String> Search_value = new HashMap<String, String>();
		Search_value.put("search_type", "N");
		Search_value.put("search_name", search_val);
		Search_value.put("search_goods", "goods");
		Search_value.put("search_money_1", "");
		Search_value.put("search_money_2", "");
		System.out.println(Search_value);
		mav = mm.searchForm(Search_value, req, pageNum);
		mav.addObject("search_val", search_val);
		return mav;
	}

	@RequestMapping(value = "searchForm", method = RequestMethod.GET)
	public ModelAndView searchForm(HttpServletRequest req, Integer pageNum) {

		System.out.println("==================!=======================");
		System.out.println(req.getParameter("search_goods"));
		System.out.println(req.getParameter("search_type"));
		System.out.println(req.getParameter("search_name"));
		System.out.println(req.getParameter("search_money_1"));
		System.out.println(req.getParameter("search_money_2"));
		System.out.println(req.getParameter("search_order"));
		System.out.println("==================!=======================");
		HashMap<String, String> Search_value = new HashMap<String, String>();
		Search_value.put("search_goods", req.getParameter("search_goods"));
		Search_value.put("search_type", req.getParameter("search_type"));
		Search_value.put("search_name", req.getParameter("search_name"));
		Search_value.put("search_money_1", req.getParameter("search_money_1"));
		Search_value.put("search_money_2", req.getParameter("search_money_2"));
		Search_value.put("search_order", req.getParameter("search_order"));
		mav = mm.searchForm(Search_value, req, pageNum);
		return mav;
	}

	@RequestMapping(value = "goods_view_detail", method = RequestMethod.GET)
	public ModelAndView goods_view_detail(Model model, @RequestParam("goods_code") String goods_code,
			HttpSession session) {
		model.addAttribute("goods_code", goods_code);
		mav = mm.goods_view_detail(goods_code);
		return mav;
	}

	@RequestMapping(value = "category_Introduce", method = RequestMethod.GET)
	public String Introduce_Main() {

		return "Category/Introduce/Introduce_Main";
	}

	@RequestMapping(value = "category_lecture", method = RequestMethod.GET)
	public String lecture_Main() {

		return "Category/Introduce/lecture_Main";
	}

	@RequestMapping(value = "category_Community", method = RequestMethod.GET)
	public String Community_Main() {

		return "Category/Introduce/Community_Main";
	}

	@RequestMapping(value = "/admin_home", method = RequestMethod.GET)
	public String admin_home() {
		return "admin_home";
	}

	@RequestMapping(value = "member_login", method = RequestMethod.GET)
	public String member_login() {

		return "Member/Login/member_login";
	}

	@RequestMapping(value = "Review_write", method = RequestMethod.GET)
	public ModelAndView Review_write(HttpSession session, @RequestParam("goods_code") String goods_code) {
		System.out.println(goods_code);
		mav = mm.Review_write(session, goods_code);
		return mav;
	}

	@RequestMapping(value = "Review_writeFrm", method = RequestMethod.POST)
	public ModelAndView Review_writeFrm(HttpSession session, review Review, MultipartHttpServletRequest mul) {
		mav = mm.Review_writeFrm(session, Review, mul);
		return mav;
	}

	@RequestMapping(value = "Review_view", method = RequestMethod.GET)
	public ModelAndView Review_view() {
		mav = mm.Review_view();
		return mav;
	}

	@RequestMapping(value = "Review_view_detail", method = RequestMethod.GET)
	public ModelAndView Review_view_detail(@RequestParam("review_code") String review_code) {
		System.out.println(review_code);
		mav = mm.Review_view_detail(review_code);

		return mav;
	}

	@RequestMapping(value = "test_login", method = RequestMethod.GET)
	public String test_login() {

		return "Member/Login/test_login";
	}

	@RequestMapping(value = "login_form", method = RequestMethod.POST)
	public ModelAndView login_form(member mb, HttpSession session) {
		mav = new ModelAndView();
		mav = mm.login_form(mb, session);
		return mav;
	}
	@RequestMapping(value = "member_cart_list")
	public ModelAndView member_cart_list(HttpSession session) {
		mav = new ModelAndView();
		mav = mm.member_cart_list(session);
		return mav;
	}

	@RequestMapping(value = "/loging") // 메인페이지 가기직전
	public String loging(HttpSession session, String name, String id) {
		logger.info("메인화면 이동중");
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		System.out.println(id);
		System.out.println(name);
		return "Member/Login/loging";
	}

	@RequestMapping(value = "member_joinFrm", method = RequestMethod.GET)
	public String member_joinFrm() {

		return "Member/JoinFrm/member_joinFrm";
	}

	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(member mb, HttpServletRequest req) {
		logger.info("회원가입");
		mav = new ModelAndView();
		mav = mm.memberJoin(mb, req);
		return mav;
	}

	@RequestMapping(value = "/board_update")
	public ModelAndView board_update(@RequestParam("goods_code") String goods_code,
			@RequestParam("goods_class") String goods_class, HttpSession session) {
		System.out.println("굿즈코드 확인 = " + goods_code);
		System.out.println("상품분류 확인 = " + goods_class);
		mav = new ModelAndView();
		mav = mm.board_update(goods_code, session);
		return mav;
	}

}
