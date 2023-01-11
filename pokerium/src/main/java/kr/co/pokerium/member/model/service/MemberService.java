package kr.co.pokerium.member.model.service;

import kr.co.pokerium.member.model.vo.MemberInfo;

public interface MemberService {

	MemberInfo selectLoginMember(MemberInfo member);
	
	int insertMember(MemberInfo m);

	
}
