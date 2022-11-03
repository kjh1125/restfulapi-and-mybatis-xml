package com.cafe24.kjh;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class User_DAO implements User_Interface{

	@Inject
	private SqlSessionTemplate sqlSession;
	
	private static String namespace="user123";
	
	List<User_DTO> user = null;
	
	@Override
	public List<User_DTO> getsel(User_DTO dto) {
		
		this.user = sqlSession.selectList(namespace+".getsel",dto);
		
		
		return this.user;
	}
	@Override
	
	public void del(String id) {
		
		sqlSession.delete(namespace+".del",id);
		
	}
	@Override
	public void registration(User_DTO dto) {
		
		sqlSession.insert(namespace+".regi",dto);
	}


	
}
