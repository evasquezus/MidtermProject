package com.skilldistillery.midtermproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.midtermproject.data.MidtermMockDAO;

@Controller
public class MidTermController {

	
	@Autowired
	private MidtermMockDAO mockDao;
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String index() {
		return "WEB-INF/index.jsp";
	}
}
