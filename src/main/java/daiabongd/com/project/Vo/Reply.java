package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.TIMESTAMP;
@Alias("reply")
@Data
@Accessors(chain = true)
public class Reply {
	private int Reply_goods_code; //상품코드
	private int Reply_review_code;//리뷰코드
	private int Reply_code;//댓글 코드
	private String Reply_id; // 댓글 id
	private String Reply_contents;//댓글 내용
	private String Reply_emoticon;//댓글 이모티콘
	private String Reply_star;//댓글 이모티콘
    private Timestamp Reply_regdate;// 생성날짜
}
