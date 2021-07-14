package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace="com.board.mappers.member";
	@Override
	public void register(MemberVO vo) throws Exception {
		// 회원가입
		sql.insert(namespace+".register",vo);
		
	}
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// 로그인
		//return sql.selectOne(namespace+".login",vo);
		return sql.selectOne(namespace+".loginBcrypt",vo);
	}
	@Override
	public void modify(MemberVO vo) throws Exception {
		// 유저 정보 수정
		sql.update(namespace+".modify",vo);
		
	}
	@Override
	public void delete(MemberVO vo) throws Exception {
		// 유저 탈퇴
		sql.delete(namespace+".delete",vo);
		
	}
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		// 유저 아이디 체크
		return sql.selectOne(namespace+".idCheck",userId);
	}

}
