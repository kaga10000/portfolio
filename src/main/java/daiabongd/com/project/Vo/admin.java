package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
@Alias("admin")
@Data
@Accessors(chain = true)
public class admin {
	private int admin_code;
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_phone;
	private String admin_level;
}
