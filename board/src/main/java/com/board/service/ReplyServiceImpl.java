package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO dao;
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		// 댓글 조회
		return dao.list(bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {
		// 댓글 작성
		dao.write(vo);
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		// 댓글 수정
		dao.modify(vo);
	}

	@Override
	public void delete(int rno, int bno) throws Exception {
		// 댓글 삭제
		dao.delete(rno,bno);
	}

	@Override
	public ReplyVO select(int rno) throws Exception {
		// 해당 댓글 조회
		return dao.select(rno);
		
	}

}
