package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.Criteria;
import com.myweb.domain.QnaVO;

public interface QnaDAO {
	public void insert(QnaVO qvo);
	public List<QnaVO> selectList(Criteria cri);
	public QnaVO selectOne(Integer qno);
	public void update(QnaVO qvo);
	public void delete(Integer qno);
	public int selectOne(Criteria cri);
}
