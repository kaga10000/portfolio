package daiabongd.com.project.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import daiabongd.com.project.Dao.IMemberDao;
import daiabongd.com.project.MM.MemberMM;
import daiabongd.com.project.Vo.Reply;
import daiabongd.com.project.Vo.cart;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.review;

@RestController // @ResponseBody생략가능
@RequestMapping(value = "/rest")
public class HomeRestController {
	@Autowired
	private MemberMM mm;// new MemberMM();
	@Autowired
	private IMemberDao mDao;
	ModelAndView mav;

	//

	@PostMapping(value = "/replyselect", produces = "application/json;charset=utf-8")
	public List<Reply> replyselect(@RequestBody JSONObject json, HttpSession session) {

		List<Reply> rList = mm.replyselect(json, session);
		return rList;
	}

	@PostMapping(value = "/showping_basket_insert" , produces = "application/json;charset=utf-8")
	public void showping_basket_insert(@RequestBody JSONObject json) {
		System.out.println(json);
		int goods_count = mDao.showping_basket_select(json);
		if(goods_count == 1 ){
		mm.showping_basket_insert(json);			
		}
	}

	@PostMapping(value = "/reply_count", produces = "application/json;charset=utf-8")
	public String reply_count(@RequestBody JSONObject json) {
		System.out.println("요기==========" + json);
		String rcount = mm.reply_count(json);
		System.out.println(rcount);
		return rcount;
	}

	@PostMapping(value = "/replyinsert", produces = "application/json;charset=utf-8")
	public void replyinsert(@RequestBody JSONObject review_code) {
		mm.replyinsert(review_code);
	}

	@PostMapping(value = "/board_delete")
	public void board_delete(@RequestParam(value = "test_arr[]") List<Integer> test_arr) {
		System.out.println(test_arr);
		for (int i = 0; i < test_arr.size(); i++) {
			List<Reply> rList = mDao.getReplyList(test_arr.get(i));
			if (rList.size() != 0) { // 댓글이 있다면 삭제
				mDao.reply_Delete(test_arr.get(i));
			}
			List<review> review_list = mDao.getReviewList(test_arr.get(i));
			if (review_list.size() != 0) {
				mDao.review_delete(test_arr.get(i));
			}
			List<goods> goods_list = mDao.getgoodsList(test_arr.get(i));
			if (goods_list.size() != 0) {
				mDao.board_delete(test_arr.get(i));
			}
		}
	}
	@PostMapping(value = "/cart_delete")
	public void cart_delete(@RequestParam(value = "test_arr[]") List<Integer> test_arr,HttpSession session) {
		String id = session.getAttribute("id").toString();
		System.out.println(test_arr);
		for (int i = 0; i < test_arr.size(); i++) {
			List<cart> cList = mDao.getCartList(test_arr.get(i),id);
			if (cList.size() != 0) { // 상품이 있다면 삭제
				mDao.my_cart_Delete(test_arr.get(i),id);
			}
		}
	}

	@PostMapping(value = "/chk_value", produces = "application/json;charset=utf-8")
	public List<goods> chk_value(@RequestBody JSONObject json) {
		System.out.println(json);
		List<goods> glist = mm.chk_value(json);
		System.out.println(glist);
		return glist;
	}

	@PostMapping(value = "/product_type_sort", produces = "application/json;charset=utf-8")
	public List<goods> product_type_sort(@RequestBody JSONObject json) {
		System.out.println(json);
		HashMap<String, Object> type_test = new HashMap<String, Object>();
		type_test.put("product_class", json.get("product_class").toString());
		type_test.put("selectValue", json.get("selectValue").toString());
		System.out.println(type_test);
		List<goods> glist = mm.product_type_sort(type_test);
		System.out.println(glist);
		return glist;
	}

}
