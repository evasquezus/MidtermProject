package com.skilldistillery.midterm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.midterm.data.MidtermMockDAO;

@Controller
public class MidTermController {

	
//	@Autowired
//	private MidtermMockDAO mockDao;
	
	@RequestMapping(path= {"/", "home.do"}, method = RequestMethod.GET)
	public String index() {
		return "WEB-INF/index.jsp";
	}
}
