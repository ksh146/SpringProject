package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
			
	// 회원 가입 get
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void getInsert() throws Exception {
		logger.info("get insert");
	}
	
	// 회원 가입 post
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String postInsert(MemberVO vo) throws Exception {
		logger.info("post insert");
			
		String inputPw = vo.getUserPw();
		String pw = passEncoder.encode(inputPw);
		vo.setUserPw(pw);
	
		service.insert(vo);
	
		return "redirect:/";
	}		
		
	// 로그인  get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		logger.info("get login");
	}
	
	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
				
		MemberVO login = service.login(vo);		
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUserPw(), login.getUserPw());
		
		if(login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}		
		
		return "redirect:/";
	}
			
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");
		
		service.logout(session);
				
		return "redirect:/";
	}
		
		
}