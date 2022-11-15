package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.TIMESTAMP;
@Alias("banner")
@Data
@Accessors(chain = true)
public class banner {
 private int	banner_position;
 private int	banner_step;
 private String	banner_img;
 private String	banner_href;
 private Timestamp banner_regdate;
   
}
