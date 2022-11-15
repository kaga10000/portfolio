package daiabongd.com.project.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import daiabongd.com.project.Dao.IAdminDao;
import daiabongd.com.project.MM.AdminMM;
import daiabongd.com.project.Vo.introduce;
import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.banner;
import daiabongd.com.project.Vo.introduce;
import daiabongd.com.project.Vo.slide;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminMM am;// new MemberMM();
	@Autowired
	private IAdminDao aDao;

	ModelAndView mav;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "admin_category_goods")
	public String admin_category_goods() {

		return "Admin/Admin_category/Admin_Goods/Goods"; // 관리자페이지 상품판매
	}

	@RequestMapping(value = "admin_goods_korea", method = RequestMethod.GET)
	public ModelAndView admin_category_goods_korea(Integer pageNum, HttpServletRequest request, HttpSession session) {
		String URL = "k";
		String fullUrl = request.getRequestURI();
		String refineUrl = fullUrl.replace("/project/", "");
		System.out.println(refineUrl);
		mav = am.admin_category_goods_board(pageNum, URL, refineUrl, session);
		return mav; // 관리자페이지 국어
	}

	@RequestMapping(value = "admin_goods_english", method = RequestMethod.GET)
	public ModelAndView admin_category_goods_english(Integer pageNum, HttpServletRequest request, HttpSession session) {
		String URL = "e";
		String fullUrl = request.getRequestURI();
		String refineUrl = fullUrl.replace("/project/", "");
		System.out.println(refineUrl);
		mav = am.admin_category_goods_board(pageNum, URL, refineUrl, session);
		return mav; // 관리자페이지 영어
	}

	@RequestMapping(value = "admin_goods_math", method = RequestMethod.GET)
	public String admin_category_goods_math() {

		return "Admin/Admin_category/Admin_Goods/admin_goods_math"; // 관리자페이지 수학
	}

	@RequestMapping(value = "admin_goods_programming", method = RequestMethod.GET)
	public String admin_category_goods_programming() {

		return "Admin/Admin_category/Admin_Goods/admin_goods_programming"; // 관리자페이지 프로그래밍
	}

	@RequestMapping(value = "admin_goods_science", method = RequestMethod.GET)
	public String admin_category_goods_science() {

		return "Admin/Admin_category/Admin_Goods/admin_goods_science"; // 관리자페이지 과학
	}

	@RequestMapping(value = "admin_goods_society", method = RequestMethod.GET)
	public String admin_category_goods_society() {

		return "Admin/Admin_category/Admin_Goods/admin_goods_society"; // 관리자페이지 사회
	}

	@RequestMapping(value = "admin_goods_Enrollment", method = RequestMethod.GET)
	public String admin_goods_Enrollment(HttpServletRequest req, Model model) {
		String URL = req.getQueryString();
		System.out.println(URL);
		model.addAttribute("URL", URL);
		return "Admin/Admin_category/Admin_Goods/admin_goods_Enrollment"; // 상품등록
	}
	// 관리자페이지 상품탭 끝

	@RequestMapping(value = "admin_Introduce_korea", method = RequestMethod.GET)
	public String admin_category_Introduce_korea() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_korea"; // 관리자페이지 국어
	}

	@RequestMapping(value = "admin_Introduce_english", method = RequestMethod.GET)
	public String admin_category_Introduce_english() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_english"; // 관리자페이지 영어
	}

	@RequestMapping(value = "admin_Introduce_math", method = RequestMethod.GET)
	public String admin_category_Introduce_math() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_math"; // 관리자페이지 수학
	}

	@RequestMapping(value = "admin_Introduce_programming", method = RequestMethod.GET)
	public String admin_category_Introduce_programming() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_programming"; // 관리자페이지 프로그래밍
	}

	@RequestMapping(value = "admin_Introduce_science", method = RequestMethod.GET)
	public String admin_category_Introduce_science() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_science"; // 관리자페이지 과학
	}

	@RequestMapping(value = "admin_Introduce_society", method = RequestMethod.GET)
	public String admin_category_Introduce_society() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_society"; // 관리자페이지 사회
	}

	@RequestMapping(value = "admin_Introduce_Enrollment", method = RequestMethod.GET)
	public String admin_Introduce_Enrollment() {

		return "Admin/Admin_category/Admin_Introduce/admin_Introduce_Enrollment"; // 상품등록
	}
	// 관리자페이지 교수탭 끝

	@RequestMapping(value = "admin_category_Introduce", method = RequestMethod.GET)
	public String admin_category_Introduce() {

		return "Admin/Admin_category/Admin_Introduce/Introduce"; // 관리자페이지 교수소개
	}

	@RequestMapping(value = "admin_category_community", method = RequestMethod.GET)
	public String admin_category_community() {

		return "Admin/Admin_category/Admin_community/community"; // 관리자페이지 커뮤니티
	}

	@RequestMapping(value = "admin_main_management", method = RequestMethod.GET)
	public String admin_main_management() {

		return "Admin/Admin_category/Admin_management/admin_main_management"; // 관리자페이지 메인관리
	}

	@RequestMapping(value = "admin_main_slide_update")
	public String admin_main_slide_update(Model model) {
		List<slide> slide_list = aDao.select_slide();
		model.addAttribute("slide_list", slide_list);
		return "Admin/Admin_category/Admin_management/Admin_main_update/admin_main_slide_update"; // 관리자페이지 메인페이지의 슬라이드
																									// 관리
	}

	@RequestMapping(value = "update_slide_img", method = RequestMethod.POST)
	public String update_slide_img(MultipartHttpServletRequest mul) {
		logger.info("==================update_slide_img==============");
		String fullPath = "E:\\workspace\\daiabongd\\src\\main\\webapp\\resources\\image\\";
		File dir = new File(fullPath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		String testPath = fullPath + "slide/";
		Map<String, String> fMap = new HashMap<String, String>();
		List<MultipartFile> fList = mul.getFiles("slide_img");
 		for (int i = 0; i < fList.size(); i++) {
 			System.out.println(i);
 			int j = i + 1;
			// 파일 메모리에 저장
			MultipartFile mf = fList.get(i); // 실제파일
			String oriFileName = mf.getOriginalFilename(); // a.txt
			fMap.put("origFileName", oriFileName);
			UUID uuid = UUID.randomUUID();
			String savedName = uuid.toString() + "_" + oriFileName;
			fMap.put("sysFileName", savedName);
			try {
				if (fList.get(i) == fList.get(i) && oriFileName != "") {
					mf.transferTo(new File(testPath + savedName));
					if(aDao.select_slide_img(savedName, j) == 1){
						new File(testPath + mul.getParameter("today_slide_img" + j)).delete();
						aDao.update_slide_img(savedName, j);						
					}else {
						aDao.insert_slide_img(savedName, j);
					} 
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin_main_slide_update"; // 관리자페이지 메인페이지의 슬라이드

	}

	@RequestMapping(value = "update_banner_img", method = RequestMethod.POST)
	public String update_banner_img(MultipartHttpServletRequest mul) {
		logger.info("==================update_slide_img==============");
		String fullPath = "E:\\workspace\\daiabongd\\src\\main\\webapp\\resources\\image\\";
		File dir = new File(fullPath);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		String testPath = fullPath + "banner/";
		Map<String, String> fMap = new HashMap<String, String>();
		List<MultipartFile> fList = mul.getFiles("banner_img");
		String position = mul.getParameter("banner_position");
		System.out.println(position);
		System.out.println(fList);
		for (int i = 0; i < fList.size(); i++) {
			// 파일 메모리에 저장
			MultipartFile mf = fList.get(i); // 실제파일
			String oriFileName = mf.getOriginalFilename(); // a.txt
			fMap.put("origFileName", oriFileName);
			UUID uuid = UUID.randomUUID();
			String savedName = uuid.toString() + "_" + oriFileName;
			fMap.put("sysFileName", savedName);
			try {
				if (fList.get(i) == fList.get(0) && oriFileName != "") {
					mf.transferTo(new File(testPath + savedName));
					int j = i + 1;
					String href = mul.getParameter("banner_href_" + j);
					System.out.println(href);
					if (aDao.goods_select_banner(position, j) == 1) {
						new File(testPath + mul.getParameter("banner_ori_firstshot" + j)).delete();
						aDao.update_banner_img(position, savedName, j, href);
					} else {
						aDao.insert_banner_img(position, savedName, j, href);
					}
				} else if (fList.get(i) == fList.get(1) && oriFileName != "") {
					mf.transferTo(new File(testPath + savedName));
					int j = i + 1;
					String href = mul.getParameter("banner_href_" + j);
					System.out.println(href);
					if (aDao.goods_select_banner(position, j) == 1) {
						new File(testPath + mul.getParameter("banner_ori_firstshot" + j)).delete();
						aDao.update_banner_img(position, savedName, j, href);
					} else {
						aDao.insert_banner_img(position, savedName, j, href);
					}
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin_banner_management?position=" + position; // 메인페이지 배너 설정

	}

	@RequestMapping(value = "admin_main_product_exqlanation_update", method = RequestMethod.GET)
	public ModelAndView admin_main_product_exqlanation_update(Integer pageNum, HttpServletRequest request,
			String Sort) {
		String fullUrl = request.getRequestURI();
		String refineUrl = fullUrl.replace("/project/", "");
		mav = am.admin_main_product_exqlanation_update(pageNum, Sort, refineUrl);
		return mav;
	}

	@RequestMapping(value = "main_product_modify", method = RequestMethod.POST)
	public ModelAndView main_product_modify(HttpServletRequest req, String goods_chk, String product_goods_firstshot,
			String product_class) {
		String selectValue = req.getParameter("selectValue");
		mav = am.main_product_modify(goods_chk, product_goods_firstshot, product_class, selectValue);
		return mav;
	}

	@RequestMapping(value = "admin_banner_management", method = RequestMethod.GET)
	public String admin_banner_management(Model model, String position) {
		model.addAttribute("banner_position", position);
		List<banner> banner_img_list = aDao.select_banner_img(position);
		System.out.println(banner_img_list);
		model.addAttribute("banner_img_list", banner_img_list);
		return "Admin/Admin_category/Admin_management/admin_banner_management"; // 관리자페이지 배너관리
	}

	@RequestMapping(value = "admin_slide_management", method = RequestMethod.GET)
	public String admin_slide_management() {

		return "Admin/Admin_category/Admin_management/admin_slide_management"; // 관리자페이지 슬라이드
	}

	@RequestMapping(value = "Create_Admin", method = RequestMethod.GET)
	public String Create_Admin() {

		return "Admin/Admin_Create/joinFrm_admin";
	}
	
	@RequestMapping(value = "Create_Introduce", method = RequestMethod.GET)
	public String Create_Introduce() {
		return "Admin/Admin_Create/joinFrm_Introduce";
	}
	@RequestMapping(value = "joinFrm_introduce", method = RequestMethod.POST)
	public ModelAndView joinFrm_introduce(introduce intro , MultipartHttpServletRequest mul ) {
		System.out.println(mul);
		mav = am.joinFrm_introduce(intro,mul);
		return mav;
	}
	
	@RequestMapping(value = "/joinFrm_admin", method = RequestMethod.POST)
	public ModelAndView joinFrm_admin(admin admin, HttpServletRequest req) {
		logger.info("관리자 등록");
		mav = new ModelAndView();
		mav = am.joinFrm_admin(admin, req);
		return mav;
	}

	@RequestMapping(value = "/goods_sale") // 게시판 글작성
	public ModelAndView goods_sale(MultipartHttpServletRequest mul) {
		System.out.println(mul);
		mav = am.goods_sale(mul);
		return mav;
	}

	@RequestMapping(value = "/goods_update") // 게시판 글수정
	public ModelAndView goods_update(MultipartHttpServletRequest mul) {
		System.out.println(mul);
		mav = am.goods_update(mul);
		return mav;

	}
}