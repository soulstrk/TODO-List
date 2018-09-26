package com.soulstrk.todo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soulstrk.todo.service.TodoService;
import com.soulstrk.todo.vo.TodoVo;

@Controller
public class TodoController {
	@Autowired
	private TodoService service;
	
	@RequestMapping("/getList")
	public ModelAndView getList() {
		ModelAndView mv = new ModelAndView("main");
		Map<String, List<TodoVo>> map = service.getList();
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(TodoVo vo, RedirectAttributes ra) {
		int n = service.insert(vo);
		if(n>0) {
			ra.addFlashAttribute("msg", "등록 성공!");
		}else {
			ra.addFlashAttribute("msg", "등록 실패!");
		}
		return "redirect:/getList";
	}
	
	@RequestMapping("/update")
	public void update(int id,HttpServletResponse response) {
		int n = service.update(id);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> map = new HashMap<String, String>();
		if(n>0) {
			map.put("code", "success");
		}else {
			map.put("code", "success");
		}
		try {
			response.getWriter().println(mapper.writeValueAsString(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
