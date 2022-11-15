package daiabongd.com.project.MM;
//회원관리 서비스 클래스

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import daiabongd.com.project.userclass.FileManager;
import daiabongd.com.project.userclass.Paging;
import daiabongd.com.project.userclass.Product_Paging;
import daiabongd.com.project.Vo.introduce;
import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.introduce;
import daiabongd.com.project.Vo.member;
import daiabongd.com.project.Vo.product;
import daiabongd.com.project.Dao.IAdminDao;
import daiabongd.com.project.Dao.IMemberDao;
import daiabongd.com.project.MM.AdminMM;

@Service // @Component //IoC컨테이너 등록
public class AdminMM {

	@Autowired
	private IAdminDao aDao;
	@Autowired
	private FileManager fm;

	ModelAndView mav;

	public ModelAndView joinFrm_admin(admin admin, HttpServletRequest req) { // 회원가입
		mav = new ModelAndView();
		String view = null;
		String mobile1 = req.getParameter("mobile1");
		String mobile2 = req.getParameter("mobile2");
		String mobile3 = req.getParameter("mobile3");
		String resultphone = mobile1 + "-" + mobile2 + "-" + mobile3;
		admin.setAdmin_phone(resultphone);
		if (aDao.adminJoin(admin)) { // 입력된 값 순서 == DB컬럼 순서가 맞으면 진행
			System.out.println("관리자 등록 성공");
			view = "redirect:/admin_home";
		} else {
			System.out.println("관리자 등록 실패");
			view = "joinfrm";
		}
		mav.setViewName(view);
		return mav;

	}

	public ModelAndView goods_sale(MultipartHttpServletRequest mul) {
		mav = new ModelAndView();
		String view = null;
		String rclass = mul.getParameter("goods_class"); // 실제 URL 값
		String gcontents = mul.getParameter("goods_contents");
		System.out.println("상품 설명" + gcontents);
		String gclass = rclass.substring(0, 1); // 첫글자 빼고 제외
		System.out.println("결과값2" + gclass);
		String title = mul.getParameter("goods_title");
		String inven = mul.getParameter("goods_inven");
		String inven2 = mul.getParameter("goods_inven2");
		int price = Integer.parseInt(mul.getParameter("goods_price"));
		String id = mul.getSession().getAttribute("id").toString();
		int check = Integer.parseInt(mul.getParameter("fileCheck"));
		goods goods = new goods();
		if (inven.equals("n")) {
			goods.setGoods_inven(inven2);
		} else {
			goods.setGoods_inven(inven);
		}
		goods.setGoods_title(title).setGoods_price(price).setGoods_id(id).setGoods_class(gclass)
				.setGoods_contents(gcontents);
		if (check == 1) {
			fm.fileUp(mul, goods);
		} else {
			System.out.println("사진 업슴!");
		}

		view = "redirect:/admin_goods_" + rclass;
		mav.setViewName(view);
		return mav;
	}

	private String Paging(Integer pageNum, String URL, String refineUrl) {
		int maxNum = aDao.getBoardCount(URL); // 총 게시물 카운트메소드
		int listCount = 12; // 페이지당 글의 개수
		int pageCount = 1; // 그룹당 페이지 개수
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, refineUrl);
		return paging.makeHtmlPaging();
	}

	public ModelAndView admin_category_goods_board(Integer pageNum, String URL, String refineUrl, HttpSession session) {
		mav = new ModelAndView();
		List<goods> glist = null;
		String id = session.getAttribute("id").toString();
		pageNum = (pageNum == null) ? 1 : pageNum; // 페이징
		glist = aDao.select_goods_board(pageNum, URL);
		if (glist != null && glist.size() != 0) {
			mav.addObject("glist", glist);
			mav.addObject("id", id);
			mav.addObject("Paging", Paging(pageNum, URL, refineUrl));
		}
		mav.setViewName("Admin/Admin_category/Admin_Goods/" + refineUrl);
		System.out.println(mav);
		return mav;
	}

	public ModelAndView goods_update(MultipartHttpServletRequest mul) {
		mav = new ModelAndView();
		String view = null;
		String rclass = mul.getParameter("goods_class"); // 실제 URL 값
		String gclass = rclass.substring(0, 1); // 첫글자 빼고 제외
		String gcontents = mul.getParameter("goods_contents");
		int gcode = Integer.parseInt(mul.getParameter("goods_code"));
		String title = mul.getParameter("goods_title");
		String inven = mul.getParameter("goods_inven");
		String inven2 = mul.getParameter("goods_inven2");
		int price = Integer.parseInt(mul.getParameter("goods_price"));
		String id = mul.getSession().getAttribute("id").toString();
		int check = Integer.parseInt(mul.getParameter("fileCheck"));
		goods goods = new goods();
		if (inven.equals("n")) {
			goods.setGoods_inven(inven2);
		} else {
			goods.setGoods_inven(inven);
		}
		goods.setGoods_title(title).setGoods_price(price).setGoods_id(id).setGoods_class(gclass)
				.setGoods_contents(gcontents).setGoods_code(gcode);

		if (check == 1) {
			fm.fileUp(mul, goods);
		} else {
			aDao.goods_update_nofile(goods);
		}
		view = "redirect:/admin_goods_" + rclass;
		mav.setViewName(view);
		return mav;
	}

	private String Product_Paging(Integer pageNum, String URL, String refineUrl) {
		int maxNum = aDao.getBoardCount(URL); // 총 게시물 카운트메소드
		int listCount = 12; // 페이지당 글의 개수
		int pageCount = 1; // 그룹당 페이지 개수
		Product_Paging Product_Paging = new Product_Paging(maxNum, pageNum, listCount, pageCount, refineUrl, URL);
		return Product_Paging.makeHtmlPaging();
	}

	public ModelAndView admin_main_product_exqlanation_update(Integer pageNum, String Sort, String refineUrl) {
		mav = new ModelAndView();
		int test = Sort.length();
		int test2 = test - 1;
		String URL = Sort.substring(0, Sort.length() - test2);
		System.out.println(URL);
		pageNum = (pageNum == null) ? 1 : pageNum; // 페이징
		List<goods> goods_list = aDao.select_goods_board(pageNum, URL);
		List<product> product_list = aDao.main_product();
		if (goods_list != null && goods_list.size() != 0) {
			mav.addObject("goods_list", goods_list);
			mav.addObject("product_class", URL);
			mav.addObject("product_list", product_list);
			mav.addObject("Paging", Product_Paging(pageNum, URL, refineUrl));
		}
		mav.setViewName(
				"Admin/Admin_category/Admin_management/Admin_main_update/admin_main_product_exqlanation_update");
		System.out.println(mav);
		return mav;
	}

	public ModelAndView main_product_modify(String goods_chk, String product_goods_firstshot, String product_class,
			String selectValue) {
		int count = aDao.main_product_count();
		System.out.println(product_class);
		if (count == 0) {
			aDao.main_product_insert(goods_chk, product_goods_firstshot, selectValue, product_class);
		} else {
			aDao.main_product_update(goods_chk, product_goods_firstshot, selectValue, product_class);
		}
		List<product> product_list = aDao.main_product();
		mav.addObject("product_list", product_list);
		RedirectView rv = new RedirectView("admin_main_product_exqlanation_update?Sort=" + product_class);
		rv.setExposeModelAttributes(false);
		mav.setView(rv);
		return mav;
	}

	public ModelAndView joinFrm_introduce(introduce intro, MultipartHttpServletRequest mul) {
		mav = new ModelAndView();
		String view = null;
		String id = mul.getParameter("id");
		System.out.println("컨트롤러_아이디값"+mul.getParameter("id"));
		String pw = mul.getParameter("pw");
		String category = mul.getParameter("category");
		String project = mul.getParameter("project");
		String profile = mul.getParameter("profile");
		String phone = mul.getParameter("phone");
		String name = mul.getParameter("name");
		int check = Integer.parseInt(mul.getParameter("fileCheck"));
		introduce introduce  = new introduce();
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		introduce.setIntroduce_pw(pwdEncoder.encode(pw));
		introduce.setIntroduce_id(id).setIntroduce_category(category).setIntroduce_project(project)
				.setIntroduce_profile(profile).setIntroduce_phone(phone).setIntroduce_name(name);
		System.out.println("컨트롤러"+introduce);
		if (check == 1) {
			fm.introduce_fileUp(mul, introduce);
		} else {
			System.out.println("사진 업슴!");
		}
			
		view = "admin_home";

		mav.setViewName(view);
		return mav;
	}
}