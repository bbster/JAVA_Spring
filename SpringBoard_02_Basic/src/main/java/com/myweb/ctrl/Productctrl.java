package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write() {
		log.info(">>> write 입력");
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(ProductVO pvo, @RequestParam("imgfile")String imgfile, RedirectAttributes reAttr) {
		log.info(">>> write 입력");
		psv.write(pvo);
		reAttr.addFlashAttribute("result", "write_okay");
		return "/product/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET) // get방식으로 product/list 수행처리
	public void list(Model model) {
		log.info(">>> list 출력");
	}
}

