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
	public int insertMember(MemberInfo m) {
		int result = mDAO.insertMember(m);
		
		return result;
		
	}
	
}
