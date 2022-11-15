package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.TIMESTAMP;
@Alias("goods")
@Data
@Accessors(chain = true)
public class goods {
	private int goods_code;//상품코드
	private String goods_class; // 상품분류
	private String goods_id; // 판매자
	private String goods_firstshot; //썸네일
	private String goods_title;//제목
	private String goods_contents;//글	
	private int goods_price; //가격
	private int goods_salenumber;//판매수량
	private String goods_comment;//댓글
	private int goods_hit;//조회수
    private String goods_inven;// 재고
    private Timestamp goods_regdate;// 재고
    private Timestamp goods_updatedate;// 재고
    
    private String goods_count; //장바구니 수량
   

}
