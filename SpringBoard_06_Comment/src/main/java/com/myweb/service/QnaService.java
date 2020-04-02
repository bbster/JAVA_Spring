package com.myweb.service;

import java.util.List;

import com.myweb.domain.Criteria;
import com.myweb.domain.QnaVO;

public interface QnaService {
	public void write(QnaVO qvo);
	public List<QnaVO> list(Criteria cri);
	public QnaVO detail(Integer qno);
	public void modify(QnaVO qvo);
	public void remove(Integer qno);
	public int totalCount(Criteria cri);
}
