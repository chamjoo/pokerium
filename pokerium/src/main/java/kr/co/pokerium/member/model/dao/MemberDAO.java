package kr.co.pokerium.member.model.dao;

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
	
	
	public int insertMember(MemberInfo m) {
		
		return sqlSession.insert("member.insertMember", m);
	}





	
}
