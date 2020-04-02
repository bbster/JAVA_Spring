package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.Criteria;
import com.myweb.domain.QnaVO;
import com.myweb.persistence.QnaDAO;

@Service
public class QnaServiceImp implements QnaService {
	private static final Logger log = LoggerFactory.getLogger(QnaServiceImp.class);
	@Inject
	private QnaDAO qdao;

	@Override
	public void write(QnaVO qvo) {
		qdao.insert(qvo);
	}

	@Override
	public List<QnaVO> list(Criteria cri) {
		return qdao.selectList(cri);
	}

	@Override
	public QnaVO detail(Integer qno) {
		return qdao.selectOne(qno);
	}

	@Override
	public void modify(QnaVO qvo) {
		qdao.update(qvo);
	}

	@Override
	public void remove(Integer qno) {
		qdao.delete(qno);
	}

	@Override
	public int totalCount(Criteria cri) {
		return qdao.selectOne(cri);
	}
}
