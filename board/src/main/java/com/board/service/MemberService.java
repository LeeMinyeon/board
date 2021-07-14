package com.board.service;

import com.board.domain.MemberVO;

public interface MemberService {
	//회원가입
	public void register(MemberVO vo) throws Exception;
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	//유저 정보 수정
	public void modify(MemberVO vo) throws Exception;
	//유저 탈퇴
	public void delete(MemberVO vo) throws Exception;
	//유저 아이디 체크
	public MemberVO idCheck(String userId) throws Exception;

}
