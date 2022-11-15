package daiabongd.com.project.MM;
//회원관리 서비스 클래스

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import daiabongd.com.project.userclass.FileManager;
import daiabongd.com.project.userclass.Paging;
import daiabongd.com.project.userclass.SortPaging;
import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.member;
import daiabongd.com.project.Dao.IAdminDao;
import daiabongd.com.project.Dao.IGoodsDao;
import daiabongd.com.project.Dao.IMemberDao;
import daiabongd.com.project.MM.GoodsMM;

@Service // @Component //IoC컨테이너 등록
public class GoodsMM {

	@Autowired
	private IGoodsDao gDao;
	
	ModelAndView mav;
	
	private String Paging(Integer pageNum,String category, String refineUrl) {
		int maxNum = gDao.getBoardCount(category); // 총 게시물 카운트메소드
		int listCount = 12; // 페이지당 글의 개수
		int pageCount = 1; // 그룹당 페이지 개수
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount,refineUrl);
		return paging.makeHtmlPaging();
	}
	private String SortPaging(Integer pageNum,String category, String Sort, String method) {
		int maxNum = gDao.getBoardCount(category); // 총 게시물 카운트메소드
		int listCount = 12; // 페이지당 글의 개수
		int pageCount = 1; // 그룹당 페이지 개수
		SortPaging paging = new SortPaging(maxNum, pageNum, listCount, pageCount,Sort,method);
		return paging.makeHtmlPaging();
	}

	public ModelAndView goods_select(String category, Integer pageNum, String refineUrl) {
		mav = new ModelAndView();
		pageNum = (pageNum == null) ? 1 : pageNum; // 페이징
		List<goods> glist = gDao.goods_select(pageNum, category); 
		int glist_count = gDao.getBoardCount(category);
		if (glist != null && glist.size() != 0) {
		mav.addObject("glist", glist);
		mav.addObject("glist_count", glist_count);
		 mav.addObject("Paging",Paging(pageNum,category,refineUrl)); 
		}
		mav.setViewName("Category/Goods/Goods_Detail/"+refineUrl);
		return mav;
	}

	public ModelAndView goods_Sort(Integer pageNum, String method,String Sort, String Url) {
		mav = new ModelAndView();
		pageNum = (pageNum == null) ? 1 : pageNum; // 페이징
		List<goods> glist = gDao.goods_select_Sort(pageNum, method , Url); 
		String category = Url;
		int glist_count = gDao.getBoardCount(category);
		if (glist != null && glist.size() != 0) {
		mav.addObject("glist", glist);
		mav.addObject("glist_count", glist_count);
		 mav.addObject("Paging",SortPaging(pageNum,category,Sort,method));
		}
		mav.setViewName("Category/Goods/Goods_Detail/goods_"+Sort);
		return mav;
	}
}