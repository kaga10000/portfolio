package daiabongd.com.project.Vo;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.TIMESTAMP;
@Alias("product")
@Data
@Accessors(chain = true)
public class product {
 private int	product_goods_code ;
 private String	product_goods_firstshot;
 private String product_goods_step;
 private String product_goods_type;
 private String product_goods_class;
   
}
