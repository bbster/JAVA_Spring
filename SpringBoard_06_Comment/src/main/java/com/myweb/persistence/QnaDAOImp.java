package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criteria;
import com.myweb.domain.QnaVO;

@Repository
public class QnaDAOImp implements QnaDAO{
	private static final Logger log = LoggerFactory.getLogger(QnaDAOImp.class);
	private static String ns = "QnaMapper.";
	
	@Inject
	private SqlSession sql;
	
	@Override
	public void insert(QnaVO qvo) {
		sql.insert(ns+"add",qvo);		
	}

	@Override
	public List<QnaVO> selectList(Criteria cri) {
		return sql.selectList(ns+"list", cri);
	}

	@Override
	public QnaVO selectOne(Integer qno) {
		return sql.selectOne(ns+"detail", qno);
	}

	@Override
	public void update(QnaVO qvo) {
		sql.update(ns+"modify", qvo);
	}

	@Override
	public void delete(Integer qno) {
		sql.delete(ns+"remove", qno);
	}
	
	@Override
	public int selectOne(Criteria cri) {
		return sql.selectOne(ns+"total",cri);
	}
}
