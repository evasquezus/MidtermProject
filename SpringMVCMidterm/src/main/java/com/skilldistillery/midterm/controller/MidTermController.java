package com.skilldistillery.midterm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.MidtermMockDAO;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.User;

@Controller
public class MidTermController {

	@Autowired
	private MidtermMockDAO mockDao;

	@RequestMapping(path = { "/", "home.do" }, method = RequestMethod.GET)
	public String index() {
		return "WEB-INF/index.jsp";
	}

	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public ModelAndView registerUser(User user) {
		ModelAndView mv = new ModelAndView();
		mockDao.createUser(user);
		mv.addObject("userID", user);
		mv.setViewName("WEB-INF/registerUser.jsp");
		return mv;

	}

}
