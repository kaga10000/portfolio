package daiabongd.com.project.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import daiabongd.com.project.Dao.IAdminDao;
import daiabongd.com.project.Dao.IGoodsDao;
import daiabongd.com.project.MM.AdminMM;
import daiabongd.com.project.MM.GoodsMM;
import daiabongd.com.project.Vo.goods;

@Controller
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	  @Autowired private GoodsMM Gm;
	  ModelAndView mav;
	@Autowired
	private IGoodsDao gDao;

	
	  @RequestMapping(value = "goods_korea") 
	  public ModelAndView goods_korea(Integer pageNum , HttpServletRequest request) { 
			String category = "k";
			String fullUrl = request.getRequestURI();
			String refineUrl = fullUrl.replace("/project/","");
			System.out.println(refineUrl);
			mav = new ModelAndView();
			mav = Gm.goods_select(category, pageNum , refineUrl);
		return mav;
		}
	 
	@RequestMapping(value = "goods_english", method = RequestMethod.GET)
	public ModelAndView goods_english(Integer pageNum , HttpServletRequest request) {
		String category = "e";
		String fullUrl = request.getRequestURI();
		String refineUrl = fullUrl.replace("/project/","");
		System.out.println(refineUrl);
		mav = new ModelAndView();
		mav = Gm.goods_select(category, pageNum , refineUrl);
	return mav;
	}
	@RequestMapping(value = "goods_math", method = RequestMethod.GET)
	public String goods_math() {
		
		return "Category/Goods/Goods_Detail/goods_math";
	}
	@RequestMapping(value = "goods_science", method = RequestMethod.GET)
	public String goods_science() {
		
		return "Category/Goods/Goods_Detail/goods_science";
	}
	@RequestMapping(value = "goods_society", method = RequestMethod.GET)
	public String goods_society() {
		
		return "Category/Goods/Goods_Detail/goods_society";
	}
	@RequestMapping(value = "goods_programming", method = RequestMethod.GET)
	public String goods_programming() {
		
		return "Category/Goods/Goods_Detail/goods_programming";
	}
	@RequestMapping(value = "goods_Sort", method = RequestMethod.GET)
	public ModelAndView goods_Sort(Integer pageNum , @RequestParam("method") String method , @RequestParam("Sort") String Sort) {
		mav = new ModelAndView();
		int test = Sort.length();
		int test2 = test - 1;
		String Url = Sort.substring(0, Sort.length()-test2);
		System.out.println(Sort);
		mav = Gm.goods_Sort(pageNum,method,Sort,Url);
		return mav;
	}
}
