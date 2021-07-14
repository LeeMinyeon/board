package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private BoardService service;

	@Inject
	private ReplyService replyService;
	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		List<BoardVO> list = null;
		list = service.list();
		model.addAttribute("list", list);

	}

	// 게시물작성 GET
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session,Model model) throws Exception {
		Object loginInfo=session.getAttribute("member");
		if(loginInfo==null) {
			model.addAttribute("msg",false);
		}
	}

	// 게시물 작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWriter(BoardVO vo) throws Exception {
		service.write(vo);

		return "redirect:/board/listPageSearch?num=1";

	}

	// 게시물조회 GET
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);

		//댓글 조회
		List<ReplyVO> reply=null;
		reply=replyService.list(bno);
		model.addAttribute("reply",reply);
	}

	// 게시물 수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);
	}

	// 게시물 수정POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {

		service.modify(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);
		return "redirect:/board/listPageSearch?num=1";
	}

	// 게시물 목록+페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());
		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);
		/*
		 * //게시물 총 갯수 int count=service.count(); //한페이지에 출력할 게시물 갯수 int postNum=10; //하단
		 * 페이징 번호([게시물 총 갯수/한페이지에 출력할 갯수]의 올림) int
		 * pageNum=(int)Math.ceil((double)count/postNum); //출력할 게시물 //num은 페이지번호 int
		 * displayPost =(num-1)*postNum;
		 * 
		 * //한번에 표시할 페이징 번호의 갯수 int pageNum_cnt=10; // 표시되는 페이지 번호 중 마지막 번호 int
		 * endPageNum=(int)(Math.ceil((double)num/(double)pageNum_cnt)*pageNum_cnt); //
		 * 표시되는 페이지 번호 중 첫 번째 번호 int startPageNum=endPageNum-(pageNum_cnt-1); //마지막 번호
		 * 재계산 //위의 페이지로하면 빈 페이지 번호들이 생기므로 마지막 게시물을 기준으로 마지막 페이지번호를 구해준다. int
		 * endPageNum_tmp=(int)(Math.ceil((double)count/(double)pageNum_cnt));
		 * if(endPageNum>endPageNum_tmp) { endPageNum=endPageNum_tmp; } //이전 다음조건
		 * //시작페이지가 1이면 표시안되고 1이외에는 표시된다 boolean prev=startPageNum==1?false:true;
		 * //넥스트페이지번호가 총 게시물 갯수보다 작으면 표시 boolean
		 * next=endPageNum*pageNum_cnt>=count?false:true; List list=null; list
		 * =service.listPage(displayPost, postNum); model.addAttribute("list",list);
		 * model.addAttribute("pageNum",pageNum); //시작 및 끝 번호
		 * model.addAttribute("startPageNum",startPageNum);
		 * model.addAttribute("endPageNum",endPageNum); // 이전 및 다음
		 * model.addAttribute("prev",prev); model.addAttribute("next",next); //현재 페이지
		 * model.addAttribute("select", num);
		 */
	}

	// 게시물 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value="keyword", required = false,defaultValue = "") String keyword) throws Exception {
		Page page = new Page();
		page.setNum(num);
		//page.setCount(service.count());
		page.setCount(service.searchCount(searchType, keyword));
		//검색 타입과 검색어
		//page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		List<BoardVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);
	    //검색 항목, 키워드
		//model.addAttribute("searchType", searchType);
		//model.addAttribute("keyword",keyword);

	}

}