package kr.co.pokerium.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pokerium.member.model.dao.MemberDAO;
import kr.co.pokerium.member.model.vo.MemberInfo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	
	@Override
	public MemberInfo selectLoginMember(MemberInfo member) {
		
		MemberInfo m = mDAO.selectLoginMember(member);

		return m;
	
	}
	
	@Override
	public int updateLastlogin(MemberInfo member) {
		
		return mDAO.updateLastlogin(member);
		
	}
	
	@Override
	public int insertMember(MemberInfo m) {
		int result = mDAO.insertMember(m);
		
		return result;
		
	}

	
	
	
}
