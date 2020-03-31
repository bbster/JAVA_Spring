package com.myweb.ctrl;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.service.CommentService;

@RestController
@RequestMapping("/comment/*")
public class CommentCtrl {
	private static final Logger log = LoggerFactory.getLogger(CommentCtrl.class);
	
	@Inject
	private CommentService csv;
}

