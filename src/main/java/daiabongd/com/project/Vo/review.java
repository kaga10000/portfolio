package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.TIMESTAMP;
@Alias("review")
@Data
@Accessors(chain = true)
public class review {
	private int review_goods_code;//상품코드
	private int review_code;//리뷰코드
	private String review_firstshot; //상품정보
	private String review_Class; // 클래스
	private String review_id; // 판매자
	private String review_title;//제목
	private String review_contents;//글
	private String review_star;// 평점
	private String review_comment;// 댓글
	private int review_hit;//조회수
    private Timestamp review_regdate;// 생성날짜
    private Timestamp review_updatedate;// 수정날짜
   

}
