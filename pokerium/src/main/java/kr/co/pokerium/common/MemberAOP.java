package kr.co.pokerium.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.pokerium.member.model.vo.MemberInfo;

@Aspect
@Component
public class MemberAOP {

	@Autowired
	private SHA256Util enc;
	
	// 회원 가입 암호화 처리 AOP 로직
	
	@Pointcut("execution(int kr.co.pokerium.member.model.service.MemberServiceImpl.insertMember(..))")
	public void insertMemberPointCut() {}
	
	@Before("insertMemberPointCut()")
	public void insertMemberPasswordEncryption(JoinPoint jp) throws Exception {
		
		MemberInfo m = (MemberInfo)jp.getArgs()[0];	
		
		String miPwd = m.getMiPwd();
		String miId = m.getMiId();
		
		String encryptPwd = enc.encryptionData(miPwd, miId);
		
		m.setMiPwd(encryptPwd);
		
		
	}
	
	// 로그인 할때 작성한 비밀번호 암호화 처리 로직
	
		@Pointcut("execution(kr.co.pokerium.member.model.vo.MemberInfo kr.co.pokerium.member.model.service.MemberServiceImpl.selectLoginMember(..))")
		public void selectLoginPointCut() {}
		
		@Before("selectLoginPointCut()")
		public void loginPasswordEncrypt(JoinPoint jp) throws Exception {
			
			MemberInfo m = (MemberInfo)jp.getArgs()[0];
			
			String miId = m.getMiId();
			String miPwd = m.getMiPwd();
			
			String encryptData = enc.encryptionData(miPwd, miId);
			
			
			m.setMiPwd(encryptData);
		}
	
}
