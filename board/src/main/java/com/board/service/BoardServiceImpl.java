package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

 @Inject
 private BoardDAO dao;
 //게시물 리스트
 @Override
 public List<BoardVO> list() throws Exception {

  return dao.list();
 }
//게시물 작성
@Override
public void write(BoardVO vo) throws Exception {
	dao.write(vo);
	
}
@Override
public BoardVO view(int bno) throws Exception {
	//게시물조회
	return dao.view(bno);
}
@Override
public void modify(BoardVO vo) throws Exception {
	// 게시물 수정
	dao.modify(vo);
}
@Override
public void delete(int bno) throws Exception {
	// 게시물 삭제
	dao.delete(bno);
}
@Override
public int count() throws Exception {
	// 게시물 총 갯수
	return dao.count();
}
@Override
public List listPage(int displayPost, int postNum) throws Exception {
	// 게시물 목록+페이징
	return dao.listPage(displayPost, postNum);
}
@Override
public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
	// 게시물 목록+페이징+검색
	return dao.listPageSearch(displayPost, postNum, searchType, keyword);
}
@Override
public int searchCount(String searchType, String keyword) throws Exception {
	// 게시물 총 갯수 
	return dao.searchCount(searchType, keyword);
}

}