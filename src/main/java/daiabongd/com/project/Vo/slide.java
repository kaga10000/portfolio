package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.TIMESTAMP;
@Alias("slide")
@Data
@Accessors(chain = true)
public class slide {
 private int	slide_step ;
 private String	slide_img;
 private Timestamp slide_regdate;
   
}
