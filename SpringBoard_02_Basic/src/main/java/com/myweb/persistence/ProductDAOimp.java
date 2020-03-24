package com.myweb.persistence;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductVO;

@Repository
public class ProductDAOimp implements ProductDAO {

	private static final Logger log = LoggerFactory.getLogger(ProductDAOimp.class);
	private static String ns = "ProductMapper.";
	
	@Inject
	private SqlSession sql;

	@Override
	public void insert(ProductVO pvo) {
		sql.insert(ns + "add", pvo);
	}

	@Override
	public List<ProductVO> selectList() {
		return sql.selectList(ns + "list");
	}

	@Override
	public ProductVO selectOne(Integer pno) {
		return sql.selectOne(ns+"detail");
	}

	@Override
	public void update(ProductVO pvo) {
		sql.update(ns+"modify", pvo);
	}

	@Override
	public void delete(Integer pno) {
		sql.delete(ns+"remove", pno);
	}
}

