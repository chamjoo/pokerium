package kr.co.pokerium.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.pokerium.member.model.dao.MemberDAO;
import kr.co.pokerium.member.model.vo.MemberAddr;
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
		
		return mDAO.insertMember(m);
		
		
	}

	@Override
	public int updateMemberDrop(MemberInfo member) {

		return mDAO.updateMemberDrop(member);
		

	}

	@Override
	public int updateMember(HashMap<String, Object> map) {
		return mDAO.updateMember(map);
		
	}
	
	@Override
	public int updateMemberAddr(HashMap<String, Object> map) {
			
		return mDAO.updateMemberAddr(map);
		
	}

	@Override
	public int selectIdcheck(String miId) {
		
		return mDAO.selectIdCheck(miId);
		
	}

	@Override
	public int selectNicknamecheck(String miNickname) {
		
		return mDAO.selectNicknameCheck(miNickname);
		
	}

	@Override
	public int insertMemberAddr(MemberAddr ma) {
		
		return mDAO.insertMemberAddr(ma);
		
	}



	
	
	
}
