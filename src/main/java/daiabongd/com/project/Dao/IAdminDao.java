package daiabongd.com.project.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.banner;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.introduce;
import daiabongd.com.project.Vo.member;
import daiabongd.com.project.Vo.product;
import daiabongd.com.project.Vo.slide;

public interface IAdminDao {

	boolean adminJoin(admin admin);

	void goods_sale(goods goods);


	boolean Goods_Insert(goods goods);

	boolean Goods_Update(goods goods);
	void goods_update_nofile(goods goods); // 텍스트만 변경시
	
@Select ("SELECT COUNT(*) FROM GOODS where goods_class =#{URL}")
	int getBoardCount(String URL);

	List<goods> select_goods_board(@Param("pageNum")Integer pageNum,@Param ("URL")String URL);
@Select ("SELECT COUNT(*) FROM GOODS WHERE GOODS_CODE = #{goods_code}")
	int goods_select_count(int goods_code);


@Update ("UPDATE slide SET slide_img = #{savedName} , slide_regdate = SYSDATE WHERE SLIDE_STEP = #{j}")
void update_slide_img(@Param("savedName") String savedName ,@Param("j") int j);
@Insert ("INSERT INTO SLIDE (SLIDE_IMG,SLIDE_REGDATE,SLIDE_STEP)VALUES(#{savedName} , sysdate , #{j})")
void insert_slide_img(@Param("savedName") String savedName ,@Param("j") int j);

@Select ("SELECT COUNT(*) FROM PRODUCT")
int main_product_count();

void main_product_insert(@Param("goods_chk") String goods_chk, @Param("product_goods_firstshot") String product_goods_firstshot,@Param("selectValue")
String selectValue,@Param("product_class") String product_class);

void main_product_update(@Param("goods_chk") String goods_chk,@Param("product_goods_firstshot") String product_goods_firstshot,
		@Param("selectValue") String selectValue,@Param("product_class") String product_class);

@Select("Select * from product")
List<product> main_product();

@Select("SELECT COUNT(*) FROM BANNER WHERE banner_position = #{position} and banner_step =#{j}")
int goods_select_banner(@Param("position")String position ,@Param("j")int j);
@Update ("UPDATE banner SET banner_img = #{savedName} , banner_regdate = SYSDATE , banner_href = #{href} WHERE banner_STEP = #{j} and banner_position=#{position}")
void update_banner_img(@Param("position")String position ,@Param("savedName")String savedName,@Param("j") int j,@Param("href") String href);
@Insert("insert into banner (banner_position,banner_img,banner_regdate,banner_step,banner_href)values(#{position},#{savedName},sysdate,#{j},#{href})")
void insert_banner_img(@Param("position")String position ,@Param("savedName")String savedName,@Param("j") int j,@Param("href") String href);


@Select("SELECT BANNER_IMG,BANNER_href FROM BANNER WHERE BANNER_POSITION = #{position}")
List<banner> select_banner_img(String position);
@Select("SELECT * FROM SLIDE")
List<slide> select_slide();
@Select("SELECT COUNT(*) FROM SLIDE WHERE SLIDE_STEP = #{j}")
int select_slide_img(@Param("savedName") String savedName ,@Param("j")int j);

boolean Introduce_Insert(introduce Int);
@Select("SELECT COUNT(*) FROM introduce WHERE INTRODUCE_CODE = #{introduce_code}")
int introduce_select_count(int introduce_code);



	

}

