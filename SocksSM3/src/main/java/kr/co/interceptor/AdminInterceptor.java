package kr.co.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		
		if (vo == null) {
			res.sendRedirect("/member/login");
			return false;
		}
		
		if (vo == null || vo.getVerify() != 9) {
			res.sendRedirect("/");
			return false;
		}
		
		return true;
	}

}
