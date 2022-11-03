package com.cafe24.kjh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class api {
	
	List<User_DTO> user1;
	
	@Inject
	User_Interface user;
	
	@RequestMapping("/api1") //전체조회 및 개별조회(id,name)
	public String select(Model m,User_DTO dto) {
		
			this.user1 = user.getsel(dto);
			m.addAttribute("user", user1);
		
		
		return "api";
	}
	
	@ResponseBody // 리턴값이 없어서 404 에러 발생, json값을 넘겨주거나 ResponseBody로 에러 방지
	@RequestMapping("/api2")//삭제
	public void delete(@RequestParam("id") String id) {

		user.del(id);
		
	
	}
	
	@ResponseBody // 리턴값이 없어서 404 에러 발생, json값을 넘겨주거나 ResponseBody로 에러 방지
	@RequestMapping("/api3")//등록
	public void registration(User_DTO dto) {
		
		user.registration(dto);
		
	
	}
	
	
	
}
