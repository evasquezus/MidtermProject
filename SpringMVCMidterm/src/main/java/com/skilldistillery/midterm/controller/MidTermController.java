package com.skilldistillery.midterm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.EventDAO;
import com.skilldistillery.midterm.data.MidtermMockDAO;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.User;

@Controller
//@ResponseBody why do we have this?as far as i know this is used for returning json
public class MidTermController {

	@Autowired
	private MidtermMockDAO mockDao;
	
	@Autowired
	private EventDAO eventDao;

	@RequestMapping(path = { "/", "home.do"}, method = RequestMethod.GET)
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
		mv.setViewName("WEB-INF/registerUser.jsp");
		return mv;
	}

	// @RequestMapping(path = "loginUser.do", method = RequestMethod.POST)
	@RequestMapping(value = "/login", produces = MediaType.TEXT_PLAIN_VALUE)
	public String loginUser(HttpSession httpSession, @RequestParam("email") String email, @RequestParam("password") String password) {
		
		loginUser(httpSession, email, password);
		
		return null;
	}
	
	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public String displayCreateUserEvent() {
		return "WEB-INF/event/createEvent.jsp";
	}
	
	@RequestMapping(path = "saveEvent.do", method = RequestMethod.POST)
	public ModelAndView createFilm(Event event) {
		ModelAndView mv = new ModelAndView();
		Event newCreatedEvent = eventDao.createEvent(event);
		
		Boolean errorCreatedEvent = false;
		if (newCreatedEvent == null) {
			errorCreatedEvent = true;
			mv.addObject("newCreatedEvent", newCreatedEvent);
			mv.addObject("errorCreatedEvent", errorCreatedEvent);
			mv.setViewName("WEB-INF/error/errorPage.jsp");
			return mv;
		} else {
			mv.addObject("newCreatedEvent", newCreatedEvent);
			mv.setViewName("WEB-INF/event/result.jsp");
			return mv;
		}

	}

}
