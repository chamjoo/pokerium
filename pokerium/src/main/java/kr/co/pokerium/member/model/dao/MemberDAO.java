package kr.co.pokerium.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.pokerium.member.model.vo.MemberInfo;

@Repository
public class MemberDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	
	public MemberInfo selectLoginMember(MemberInfo member) {
		
		return sqlSession.selectOne("member.selectLoginMember", member);
		
	}
	
	public int updateLastlogin(MemberInfo member) {
		
		return sqlSession.update("member.updateLastlogin", member);
		
	}
	
	
	public int insertMember(MemberInfo m) {
		
		return sqlSession.insert("member.insertMember", m);
	}

	public int updateMemberDrop(MemberInfo member) {

		return sqlSession.update("member.updateMemberDrop", member);

	}

	public int updateMember(HashMap<String, Object> map) {
		
		return sqlSession.update("member.updateMember", map);
		
	}

	public int selectIdCheck(String miId) {
		
		return sqlSession.selectOne("member.selectIdCheck", miId) != null ? 1 : 0;
		
	}


	





	
}
