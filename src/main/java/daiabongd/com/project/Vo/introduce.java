package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
@Alias("introduce")
@Data
@Accessors(chain = true)
public class introduce {
	private int introduce_code;
	private String introduce_id;
	private String introduce_pw;
	private String introduce_name;
	private String introduce_phone;
	private String introduce_profile;
	private String introduce_project;
	private String introduce_firstshot;
	private String introduce_category;
}
