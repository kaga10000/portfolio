package daiabongd.com.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.json.simple.JSONObject;

import daiabongd.com.project.Vo.Reply;
import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.banner;
import daiabongd.com.project.Vo.cart;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.member;
import daiabongd.com.project.Vo.product;
import daiabongd.com.project.Vo.review;
import daiabongd.com.project.Vo.slide;

public interface IMemberDao {

	boolean memberJoin(member mb);

	member getMemberInfo(String member_id);

	@Select("Select * from member where member_id = #{member_id}")
	List<member> getMember(String member_id);

	@Select("Select * from admin")
	List<admin> getadminList(Integer pageNum);

	@Select("Select count(*) from admin")
	int getAdminCount();

	@Select("Select * from goods where goods_code = #{goods_code}")
	List<goods> Select_Goods(String goods_code);

	@Select("SELECT COUNT(*) FROM REVIEW WHERE REVIEW_GOODS_CODE = #{review_goods_code}")
	String select_review_cnt(int goods_code);

	void insertReview(review review);

	@Update("UPDATE GOODS SET GOODS_COMMENT = #{review_cnt} WHERE GOODS_CODE = #{goods_code}")
	void update_goods_comment(@Param("review_cnt") String review_cnt, @Param("goods_code") int goods_code);

	@Select("SELECT * FROM REVIEW")
	List<review> Select_review_view();

	@Select("SELECT * FROM REVIEW WHERE REVIEW_CODE = #{REVIEW_CODE}")
	List<review> Select_Review(String review_code);

	@Select("SELECT review_goods_code from review where review_code = #{review_code}")
	String Select_Goods_code(String review_code);

	void insertReply(JSONObject json);

	@Update("update REVIEW set REVIEW_COMMENT = REVIEW_COMMENT + 1 where REVIEW_CODE =#{r_code}")
	void update_Review(JSONObject json);

	@Select("SELECT * from reply where reply_review_code = #{r_code}")
	List<Reply> replyselect(JSONObject review_code);

	@Select("SELECT * from reply where reply_review_code = #{review_code}")
	List<Reply> view_reply_select(String review_code);

	@Select("SELECT REVIEW_COMMENT FROM REVIEW WHERE REVIEW_CODE = #{r_code}")
	String reply_count(JSONObject json);

	void board_delete(Integer test_arr);

	void reply_Delete(Integer test_arr);

	void review_delete(Integer test_arr);

	@Select("Select * from reply where reply_goods_code = #{test_arr}")
	List<Reply> getReplyList(Integer test_arr);

	@Select("Select * from review where review_goods_code = #{test_arr}")
	List<review> getReviewList(Integer integer);

	@Select("Select * from goods where goods_code = #{test_arr}")
	List<goods> getgoodsList(Integer integer);

	@Select("Select * from goods where goods_code = #{chk_val}")
	List<goods> chk_value(JSONObject json);

	@Select("Select * from product")
	List<product> select_product();

	List<goods> product_type_sort(HashMap<String, Object> type_test);

	@Select("SELECT PRODUCT_GOODS_TYPE FROM PRODUCT")
	String Select_product_type();

	@Select("SELECT PRODUCT_GOODS_class FROM PRODUCT")
	String Select_product_class();

	List<product> select_emotional_product(HashMap<String, String> product);

	@Select("SELECT * FROM BANNER WHERE banner_position = 1")
	List<banner> select_banner_one();

	@Select("SELECT * FROM BANNER WHERE banner_position = 2")
	List<banner> select_banner_two();

	@Select("select * from slide")
	List<slide> select_slide();

	List<goods> boardSearch(HashMap<String, String> Search_value);

	int getsearchCount(HashMap<String, String> Search_value);

	String match_member_pw(String member_id);
@Select("SELECT count(*) FROM GOODS WHERE GOODS_CODE= #{goods_code}")
	int showping_basket_select(JSONObject json);

void showping_basket_insert(JSONObject json);
@Select("SELECT goods_count from cart where member_id = #{member_id} and goods_code =#{goods_code}")
String my_showping_basket_select_count(JSONObject json);
@Select("SELECT CART_CODE FROM CART WHERE MEMBER_ID=#{member_id} AND GOODS_CODE =#{goods_code}")
int my_showping_basket_select(JSONObject json);
@Update("UPDATE cart SET goods_count = #{update_basket} WHERE cart_code = #{cart_code}")
void my_showping_basket_update(@Param("update_basket")int update_basket,@Param("cart_code") int cart_code);
@Select("SELECT goods_code FROM CART WHERE  MEMBER_ID = #{id}")
String[] member_cart_select_code(String id);
@Select("SELECT GOODS_CODE FROM CART WHERE MEMBER_ID = #{id}")
List<cart> member_cart_count(String id);
List<goods> member_cart_select(@Param("test_code")String test_code,@Param("id") String id);
@Select("SELECT GOODS_COUNT FROM CART WHERE GOODS_CODE = #{test_code} and member_id = #{id}")
String member_cart_goods_count(@Param("test_code")String test_code,@Param("id") String id);
@Select("SELECT * FROM CART WHERE GOODS_CODE = #{test_arr} and member_id = #{id}")
List<cart> getCartList(@Param("test_arr")Integer test_arr,@Param("id") String id);

void my_cart_Delete(@Param("test_arr")Integer test_arr,@Param("id") String id);



}
