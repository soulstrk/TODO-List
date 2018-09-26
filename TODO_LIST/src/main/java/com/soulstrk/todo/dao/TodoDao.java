package com.soulstrk.todo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soulstrk.todo.vo.TodoVo;

@Repository
public class TodoDao {
	@Autowired
	private SqlSession session;
	private static final String NAMESPACE = "com.soulstrk.todo.Mappers.todoMapper.";
	
	public int insert(TodoVo vo) {
		return session.insert(NAMESPACE+"insert", vo);
	}
	
	public int update(TodoVo vo) {
		return session.update(NAMESPACE+"update", vo);
	}
	
	public List<TodoVo> getList(){
		return session.selectList(NAMESPACE+"getList");
	}
	
	public TodoVo getOne(int id) {
		return session.selectOne(NAMESPACE+"getOne", id);
	}
}
