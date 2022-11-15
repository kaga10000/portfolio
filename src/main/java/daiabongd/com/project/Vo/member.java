package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
@Alias("member")
@Data
@Accessors(chain = true)
public class member {
	private int member_code;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
}
