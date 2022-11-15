package daiabongd.com.project;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
//JUnit를 이용한 단위테스트 :JDBCTest /*
@Log4j
//@Slf4j
public class JDBCTest {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try {
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "abongd","1231");
			assertThat(con,is(notNullValue())); //nullValue()
			//log.info("con={}",con);
			log.info("con="+con);
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패");
			fail(e.getMessage()); //문법 오류 메세지 출력
			e.printStackTrace();
		}
		
	}

	
	
}
