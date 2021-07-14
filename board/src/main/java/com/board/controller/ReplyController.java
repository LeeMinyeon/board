package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.ReplyVO;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	//댓글 조회
	//댓글 작성
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String postWrite(ReplyVO vo) throws Exception{
		replyService.write(vo);
		return "redirect:/board/view?bno="+vo.getBno();
	}
	//댓글 수정 Get

	@RequestMapping(value="/select", method=RequestMethod.GET)
	public String postSelect(@RequestParam("rno") int rno,Model model) throws Exception{
	
		ReplyVO vo= replyService.select(rno);
		model.addAttribute("replyView",vo);
		return "board/replyView.jsp?rno="+rno;
		
	}
	//댓글 수정 Post
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String postModify(ReplyVO vo) throws Exception{
		replyService.modify(vo);
		return "board/blank";
	}
	//댓글 삭제
		@RequestMapping(value="/delete", method=RequestMethod.GET)
		public String postDelete(@RequestParam int rno,@RequestParam int bno) throws Exception{
			replyService.delete(rno,bno);
			return "redirect:/board/view?bno="+bno;
		}
}
