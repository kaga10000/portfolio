package daiabongd.com.project.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import daiabongd.com.project.Vo.admin;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.member;

public interface IGoodsDao {
	
	
	List<goods> goods_select_Sort(@Param("pageNum")Integer pageNum,@Param("method") String method,@Param("Url") String Url);
@Select ("SELECT COUNT(*) FROM GOODS WHERE GOODS_CLASS =#{category}")
	int getBoardCount(String category);
List<goods> goods_select(@Param("pageNum")Integer pageNum,@Param("category") String category);
@Select ("select * from goods where goods_class =#{category}")
List<goods> goods_selectt(String category);

}

