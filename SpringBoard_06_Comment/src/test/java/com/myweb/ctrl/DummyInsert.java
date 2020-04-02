package com.myweb.ctrl;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.CommentVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.QnaVO;
import com.myweb.persistence.CommentDAO;
import com.myweb.persistence.ProductDAO;
import com.myweb.persistence.QnaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DummyInsert {
	private static final Logger log = LoggerFactory.getLogger(DummyInsert.class);
	
	@Inject
	private ProductDAO pdao;
	
	@Inject
	private CommentDAO cdao;
	
	@Inject
	private QnaDAO qdao;
	
	@Test
	public void dummyQNATest() throws Exception{
		for (int i = 0; i < 234; i++) {
			QnaVO qvo = new QnaVO();
			qvo.setTitle(i+"번째 문의내용");
			qvo.setWriter("더미 작성자" +i);
			qvo.setContent("더미 상세 내용");
			qdao.insert(qvo);
		}
	}
	
	@Test
	public void dummyCMTTest() throws Exception{
		for (int i = 1; i <= 256; i++) {
			CommentVO cvo = new CommentVO();
			cvo.setPno(248);
			cvo.setContent(i+"번째 댓글 테스트");
			cvo.setWriter(i+"번째 댓글 작성자");
			cdao.insert(cvo);
		}
	}
	
	@Test
	public void dummyTest() throws Exception{
		for (int i = 0; i < 234; i++) {
			ProductVO pvo = new ProductVO();
			pvo.setTitle(i+"번째 상품명");
			pvo.setWriter("더미 작성자" +i);
			pvo.setContent("더미 상세 내용");
			pvo.setImgfile("NONE");
			pdao.insert(pvo);
		}
	}
}
