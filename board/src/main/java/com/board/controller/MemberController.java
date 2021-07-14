package com.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		return "board/register";
	}

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		//패스워드 암호화
		String inputPass = vo.getUserPass();
		String pass=passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		memberService.register(vo);
		return "redirect:/";

	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
		MemberVO login = memberService.login(vo);
		/*
		 * if (login == null) { session.setAttribute("member", null);
		 * rttr.addFlashAttribute("msg", false); return "redirect:/"; } else {
		 * session.setAttribute("member", login); return
		 * "redirect:/board/listPageSearch?num=1";
		 * 
		 * }
		 */
		boolean passCheck=passEncoder.matches(vo.getUserPass(), login.getUserPass());
		if(login!=null&&passCheck) {
			session.setAttribute("member", login);
			return "redirect:/board/listPageSearch?num=1";
		}else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/";
			
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	// 비밀번호 변경 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModify() throws Exception {
		return "board/passModify";
	}

	// 비밀번호 변경 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, MemberVO vo) throws Exception {
		memberService.modify(vo);
		logout(session);
		return "redirect:/";
	}

	// 유저 탈퇴 get
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession session) throws Exception {
		System.out.println("member***********" + session);
		return "board/userDelete";
	}

	// 유저 탈퇴
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getUserPass();
		System.out.println("member***********" + sessionPass);
		String deletePass = vo.getUserPass();
		
		if (!(sessionPass.equals(deletePass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/delete";
		} else {
			memberService.delete(vo);

			logout(session);
			return "redirect:/";
		}

	}

	// 유저 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		String userId = req.getParameter("userId");
		MemberVO idCheck = memberService.idCheck(userId);

		int result = 0;
		if(userId.trim()==null) {
			result=2;
		}
		if (idCheck != null) {
			result = 1;

		}

		return result;
	}

}
