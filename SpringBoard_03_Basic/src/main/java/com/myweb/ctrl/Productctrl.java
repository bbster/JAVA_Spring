package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.ProductVO;
import com.myweb.service.ProductService;

//product로 오는 모든 request처리
@Controller
@RequestMapping("/product/*")
public class Productctrl {
	private static final Logger log = LoggerFactory.getLogger(Productctrl.class);
	
	@Inject
	private ProductService psv;
	
	@GetMapping("/write")
	public void write() {
		log.info(">>> write 입력");
	}
	
	@PostMapping("/write")
	public String write(ProductVO pvo, @RequestParam("imgfile")String imgfile, RedirectAttributes reAttr) {
		log.info(">>> write 입력");
		psv.write(pvo);
		reAttr.addFlashAttribute("result", "write_okay");
		return "redirect:/product/list";
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info(">>> list 출력");
		model.addAttribute("list", psv.list());
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(@RequestParam("pno") int pno, Model model) {
		log.info(">>> detail 출력");
		model.addAttribute("pvo", psv.detail(pno));
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO pvo, RedirectAttributes reAttr) {
		log.info(">>> 상품 수정 요청");
		psv.modify(pvo);
		reAttr.addFlashAttribute("result", "modify_okay");
		return "redirect:/product/detail?pno=" + pvo.getPno();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pno") int pno, RedirectAttributes reAttr) {
		log.info(">>> 상품 삭제");
		psv.remove(pno);
		reAttr.addFlashAttribute("result", "remove_okay");
		return "redirect:/product/list";
	}
}

