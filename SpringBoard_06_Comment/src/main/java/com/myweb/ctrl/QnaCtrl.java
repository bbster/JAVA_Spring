package com.myweb.ctrl;

import java.io.IOException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CommentVO;
import com.myweb.domain.Criteria;
import com.myweb.domain.PagingVO;
import com.myweb.domain.QnaVO;
import com.myweb.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaCtrl {
	private static final Logger log = LoggerFactory.getLogger(QnaCtrl.class);
	
	@Inject
	private QnaService qsv;
	
	@PostMapping("/modify")
	public String modify(MultipartHttpServletRequest req, RedirectAttributes reAttr, QnaVO qvo,
			@ModelAttribute("cri")Criteria cri) throws IllegalStateException, IOException {
		qsv.modify(qvo);
		reAttr.addAttribute("pageNum", cri.getPageNum());
		reAttr.addAttribute("amount", cri.getAmount());
		reAttr.addAttribute("type", cri.getType());
		reAttr.addAttribute("keyword", cri.getKeyword());
		reAttr.addFlashAttribute("result", "modify_ok");
		return "redirect:/qna/detail?qno="+req.getParameter("qno");
	}

	
	@GetMapping({"/detail", "/modify"})
	public void detail(@RequestParam("qno") int qno, Model model,@ModelAttribute("cri")Criteria cri) {
		model.addAttribute("qvo", qsv.detail(qno));
	}
	
	@GetMapping("/write")
	public void write() {
		log.info(">>> QnA 페이지 출력 - GET");
	}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest req, RedirectAttributes reAttr, QnaVO qvo) throws IllegalStateException, IOException {
		qsv.write(qvo);
		reAttr.addFlashAttribute("result", "write_ok");
		return "redirect:/qna/list";
	}
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", qsv.list(cri));
		int totalCnt = qsv.totalCount(cri);
		model.addAttribute("qgvo", new PagingVO(totalCnt,cri));
	}	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("qno") int qno, RedirectAttributes reAttr, Criteria cri) {
		qsv.remove(qno);
		reAttr.addAttribute("pageNum", cri.getPageNum());
		reAttr.addAttribute("amount", cri.getAmount());
		reAttr.addAttribute("type", cri.getType());
		reAttr.addAttribute("keyword", cri.getKeyword());
		reAttr.addFlashAttribute("result", "remove_ok");
		return "redirect:/qna/list";
	}
}