package daiabongd.com.project.MM;
//회원관리 서비스 클래스

import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import daiabongd.com.project.Dao.IMemberDao;
import daiabongd.com.project.Vo.Reply;
import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.banner;
import daiabongd.com.project.Vo.cart;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.member;
import daiabongd.com.project.Vo.product;
import daiabongd.com.project.Vo.review;
import daiabongd.com.project.Vo.slide;
import daiabongd.com.project.userclass.searchPaging;
import daiabongd.com.project.userclass.userPaging;

@Service // @Component //IoC컨테이너 등록
public class MemberMM {

	@Autowired
	private IMemberDao mDao;

	ModelAndView mav;

	public ModelAndView memberJoin(member mb, HttpServletRequest req) { // 회원가입
		mav = new ModelAndView();
		String view = null;
		String mobile1 = req.getParameter("mobile1");
		String mobile2 = req.getParameter("mobile2");
		String mobile3 = req.getParameter("mobile3");
		String resultphone = mobile1 + "-" + mobile2 + "-" + mobile3;
		System.out.println(mb);
		mb.setMember_phone(resultphone);
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		mb.setMember_pw(pwdEncoder.encode(mb.getMember_pw()));
		System.out.println("암호화 테스트" + mb);
		if (mDao.memberJoin(mb)) { // 입력된 값 순서 == DB컬럼 순서가 맞으면 진행
			System.out.println("회원가입 성공");
			view = "home";
			mav.addObject("check", 1);
		} else {
			System.out.println("회원가입 실패");
			view = "joinfrm";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView login_form(member mb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); // 비밀번호
																		// 암호화
		String pwdEncode = mDao.match_member_pw(mb.getMember_id()); // 비밀번호 가져오기
		System.out.println(pwdEncode);
		if (pwdEncode != null) {
			if (pwdEncoder.matches(mb.getMember_pw(), pwdEncode)) { // 비밀번호 매칭
				session.setAttribute("id", mb.getMember_id());
				mb = mDao.getMemberInfo(mb.getMember_id());
				session.setAttribute("mb", mb);
				System.out.println(mb.getMember_id());
				mav.addObject("id", mb.getMember_id());
				mav.addObject("name", mb.getMember_name());
				view = "redirect:/";
			}
		} else {
			System.out.println("로그인 실패");
			view = "home";
			mav.addObject("check", 2);
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView admin_home(Integer pageNum, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		List<admin> alist = null;
		pageNum = (pageNum == null) ? 1 : pageNum; // 페이징
		alist = mDao.getadminList(pageNum); // 다오로 보냅니다
		System.out.println("확인" + alist);
		if (alist != null && alist.size() != 0) {
			mav.addObject("alist", alist);
			mav.addObject("Paging", getPaging(pageNum));
			view = "admin_home";
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}

	private String getPaging(Integer pageNum) {
		int maxNum = mDao.getAdminCount(); // 총 게시물 카운트메소드
		int listCount = 10; // 페이지당 글의 개수
		int pageCount = 2; // 그룹당 페이지 개수
		userPaging paging = new userPaging(maxNum, pageNum, listCount, pageCount);
		return paging.makeHtmlPaging();
	}

	public ModelAndView goods_view_detail(String goods_code) {
		mav = new ModelAndView();
		List<goods> Goods_view = mDao.Select_Goods(goods_code);
		mav.addObject("Goods_view", Goods_view); // 상품 상세보기
		mav.setViewName("Category/Goods/Goods_View_Detail/goods_view_detail");
		return mav;
	}

	public ModelAndView Review_write(HttpSession session, String goods_code) {
		mav = new ModelAndView();
		List<goods> Goods_view = mDao.Select_Goods(goods_code);
		mav.addObject("Goods_view", Goods_view); // 상품 상세보기
		mav.setViewName("Member/Review/Review_write");
		return mav;
	}

	public ModelAndView Review_writeFrm(HttpSession session, review review, MultipartHttpServletRequest mul) {
		mav = new ModelAndView();
		int goods_code = Integer.parseInt(mul.getParameter("review_goods_code"));
		String id = mul.getSession().getAttribute("id").toString();
		String title = mul.getParameter("review_title");
		String contents = mul.getParameter("review_contents");
		String rclass = mul.getParameter("review_class");
		System.out.println(rclass);
		String star = mul.getParameter("review_star");
		String firstShot = mul.getParameter("review_firstshot");
		review.setReview_goods_code(goods_code).setReview_id(id).setReview_title(title).setReview_contents(contents)
				.setReview_star(star).setReview_firstshot(firstShot).setReview_Class(rclass);
		System.out.println(review);
		mDao.insertReview(review);
		String review_cnt = mDao.select_review_cnt(goods_code);
		mDao.update_goods_comment(review_cnt, goods_code);
		mav.setViewName("redirect:/Review_view");
		return mav;
	}

	public ModelAndView Review_view() {
		mav = new ModelAndView();
		review review = new review();
		List<review> Rlist = mDao.Select_review_view();
		mav.addObject("Rlist", Rlist);
		mav.setViewName("Member/Review/Review_view");
		return mav;
	}

	public ModelAndView Review_view_detail(String review_code) {
		mav = new ModelAndView();
		List<review> Review_view = mDao.Select_Review(review_code);
		String goods_code = mDao.Select_Goods_code(review_code);
		List<Reply> rlist = mDao.view_reply_select(review_code);
		System.out.println(goods_code);
		List<goods> goods_view = mDao.Select_Goods(goods_code);
		mav.addObject("goods_view", goods_view); // 상품 상세보기
		mav.addObject("Review_view", Review_view); // 상품 상세보기
		mav.addObject("rlist", rlist); // 상품 상세보기
		mav.setViewName("Member/Review/Review_detail");
		return mav;
	}

	public List<Reply> replyselect(JSONObject review_code, HttpSession session) {
		List<Reply> rlist = mDao.replyselect(review_code);
		return rlist;
	}

	public void replyinsert(JSONObject json) {
		mDao.insertReply(json);
		mDao.update_Review(json);
	}

	public String reply_count(JSONObject json) {
		String rcount = mDao.reply_count(json);
		return rcount;
	}

	public ModelAndView board_update(String goods_code, HttpSession session) {
		mav = new ModelAndView();
		List<goods> glist = mDao.Select_Goods(goods_code);
		mav.addObject("glist", glist);
		System.out.println(glist);
		mav.setViewName("Admin/Admin_category/board/board_update_view");
		return mav;
	}

	public List<goods> chk_value(JSONObject json) {
		List<goods> glist = mDao.chk_value(json);
		return glist;
	}

	public ModelAndView home(HttpSession session) {
		mav = new ModelAndView();
		String product_type = mDao.Select_product_type();
		String product_class = mDao.Select_product_class();
		HashMap<String, String> product = new HashMap<String, String>();
		product.put("product_type", product_type);
		product.put("product_class", product_class);
		List<slide> slide_list = mDao.select_slide();
		List<product> product_list = mDao.select_product();
		List<product> product_emotional_list = mDao.select_emotional_product(product); // 상품리스트
																						// 끝
		List<banner> banner_list_step_one = mDao.select_banner_one();
		List<banner> banner_list_step_two = mDao.select_banner_two();
		mav.addObject("product_class", product_class);
		mav.addObject("slide_list", slide_list);
		mav.addObject("banner_list_step_one", banner_list_step_one);
		mav.addObject("banner_list_step_two", banner_list_step_two);
		mav.addObject("product_list", product_list);
		mav.addObject("product_emotional_list", product_emotional_list);
		mav.setViewName("home");
		return mav;
	}

	public List<goods> product_type_sort(HashMap<String, Object> type_test) {
		List<goods> glist = mDao.product_type_sort(type_test);
		return glist;
	}

	public ModelAndView searchForm(HashMap<String, String> search_value, HttpServletRequest req, Integer pageNum) {
		mav = new ModelAndView();
		List<goods> glist = null;
		pageNum = (pageNum == null) ? 1 : pageNum;
		search_value.put("pageNum", pageNum.toString());
		if (search_value.get("search_name") != null) {
			glist = mDao.boardSearch(search_value);
			System.out.println(glist);
		}
		mav.setViewName("/Member/Search/searchFrom");
		mav.addObject("glist", glist);
		mav.addObject("search_val", search_value.get("search_name"));
		mav.addObject("getSearchPaging", getSearchPaging(pageNum, search_value));

		return mav;
	}

	private String getSearchPaging(Integer pageNum, HashMap<String, String> search_value) {
		int maxNum = mDao.getsearchCount(search_value); // 총 게시물 카운트메소드
		int listCount = 12; // 페이지당 글의 개수
		int pageCount = 2; // 그룹당 페이지 개수
		searchPaging paging = new searchPaging(maxNum, pageNum, listCount, pageCount, search_value);
		return paging.makeHtmlPaging();
	}

	public void showping_basket_insert(JSONObject json) {
		String test = mDao.my_showping_basket_select_count(json);
			if (test != null) {
			int test2 = Integer.parseInt(test);
			int update_basket = test2 + 1;
			int cart_code = mDao.my_showping_basket_select(json);
			mDao.my_showping_basket_update(update_basket, cart_code);
		} else {
			mDao.showping_basket_insert(json);
		}
		
	}

	public ModelAndView member_cart_list(HttpSession session) {
		mav = new ModelAndView();
		List<cart> Clist = null;
		String id = session.getAttribute("id").toString();
		List<goods> list = new ArrayList<goods>();
		if (id != null) {
			Clist = mDao.member_cart_count(id);
			if (Clist.size() != 0) {
				int clist_array = Clist.size();
				String[] goods_code = mDao.member_cart_select_code(id);
				for (int i = 0; i < clist_array; i++) {
					String test_code = goods_code[i];
					List<goods> glist = mDao.member_cart_select(test_code,id);
					list.addAll(i, glist);
				}
			}
		} else {
			mav.setViewName("/Member/Cart/member_cart_list");
		}
		mav.setViewName("/Member/Cart/member_cart_list");
		System.out.println(list);
		mav.addObject("list", list);
		return mav;
	}
}