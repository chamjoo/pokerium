package kr.co.pokerium.member.model.service;

import java.util.HashMap;

import kr.co.pokerium.member.model.vo.MemberInfo;

public interface MemberService {

	MemberInfo selectLoginMember(MemberInfo member);
	
	int insertMember(MemberInfo m);

	int updateLastlogin(MemberInfo member);

	int updateMemberDrop(MemberInfo member);

	int updateMember(HashMap<String, Object> map);

	
}
