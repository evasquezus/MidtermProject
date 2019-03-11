package com.skilldistillery.midterm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.MidtermMockDAO;
import com.skilldistillery.midterm.entities.User;

@Controller
@ResponseBody
public class MidTermController {

	@Autowired
	private MidtermMockDAO mockDao;

	@RequestMapping(path = { "/", "home.do" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}

	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public ModelAndView registerUser(User user) {
		ModelAndView mv = new ModelAndView();
		mockDao.createUser(user);
		mv.addObject("userID", user);
		mv.setViewName("registerUser.jsp");
		return mv;

	}

	@RequestMapping(path = "login.do", params = { "email", "password" }, method = RequestMethod.POST)
	public ModelAndView loginUser(HttpSession session, String email, String password) {
		ModelAndView mv = new ModelAndView();
		User user = mockDao.findUserByEmail(email);
		if (user != null && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			mv.setViewName("WEB-INF/loginUser.jsp");
		} else {
			mv.setViewName("WEB-INF/index.jsp");
		}

		return mv;
	}

}
