package com.soulstrk.todo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soulstrk.todo.dao.TodoDao;
import com.soulstrk.todo.vo.TodoVo;

@Service
public class TodoService {
	@Autowired
	private TodoDao dao;
	
	public int insert(TodoVo vo) {
		return dao.insert(vo);
	}
	
	public int update(int id) {
		TodoVo vo = dao.getOne(id);
		return dao.update(vo);
	}
	/*
	 * 모든 TODO-List를 가져온 후 서비스(비즈니스 로직)딴 에서 TODO,DOING,DONE 세 분류로 리스트를 나눈 후
	 * 각 type을 keyword로한 Map컬렉션에 담아서 리턴
	 * 처음 생각한 방법은 View딴에서 JSTL조건식을 이용해서 분배하는 거였지만,
	 * 최대한 View에서의 서버스크립트 언어를 줄이기위해 서비스에서 처리
	 * 더 좋은 방법이 있을까? 
	 */
	public Map<String, List<TodoVo>> getList(){
		Map<String, List<TodoVo>> map = new HashMap<String, List<TodoVo>>();
		List<TodoVo> list = dao.getList();
		map.put("TODO", getListToType(list, "TODO"));
		map.put("DOING", getListToType(list, "DOING"));
		map.put("DONE", getListToType(list, "DONE"));
		return map;
	}
	
	public List<TodoVo> getListToType(List<TodoVo> list, String type){
		List<TodoVo> newList = new ArrayList<TodoVo>();
		Iterator<TodoVo> iter = list.iterator();
		while(iter.hasNext()) {
			TodoVo vo = iter.next();
			if(vo.getType().equals(type)) {
				newList.add(vo);
			}
		}
		return newList;
	}
}
