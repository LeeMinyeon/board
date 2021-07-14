package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;
@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;
	@Override
	public void register(MemberVO vo) throws Exception {
		//회원가입
		dao.register(vo);
		
	}
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// 로그인
		return dao.login(vo);
	}
	@Override
	public void modify(MemberVO vo) throws Exception {
		// 유저 정보 수정
		dao.modify(vo);
		
	}
	@Override
	public void delete(MemberVO vo) throws Exception {
		// 유저 탈퇴
		dao.delete(vo);
		
	}
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// 유저 아이디 체크
		return dao.idCheck(userId);
	}

}
