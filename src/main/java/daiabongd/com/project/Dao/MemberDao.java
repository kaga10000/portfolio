package daiabongd.com.project.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daiabongd.com.project.Vo.member;
@Repository//@Component
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate tpl;
	
	public boolean getLoginResult(member mb) {
			return tpl.selectOne("memberMapper.getLoginResult", mb);
	}
		
}
