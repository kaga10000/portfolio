package daiabongd.com.project.Vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import java.util.HashMap;
@Alias("cart")
@Data
@Accessors(chain = true)
public class cart {
	private int cart_code; // 장바구니 코드
	private String member_id; // 회원 코드
	private String goods_code; // 상품 번호
	private int goods_count;// 상품 수량------- `

}
