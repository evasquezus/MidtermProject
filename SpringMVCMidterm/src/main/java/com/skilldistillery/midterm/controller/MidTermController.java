package com.skilldistillery.midterm.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.standard.DateTimeContext;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.EventDAO;
import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventSubject;
import com.skilldistillery.midterm.entities.User;

@Controller
public class MidTermController {

	@Autowired
	private EventDAO eventDao;

	@RequestMapping(path = { "/", "home.do" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}

	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public ModelAndView registerUser(User user) {
		ModelAndView mv = new ModelAndView();
		eventDao.createUser(user);
		mv.addObject("userID", user);
		mv.setViewName("registerUser.jsp");
		return mv;
	}

	// @RequestMapping(path = "loginUser.do", method = RequestMethod.POST)
	@RequestMapping(value = "/login", produces = MediaType.TEXT_PLAIN_VALUE)
	public String loginUser(HttpSession httpSession, @RequestParam("email") String email,
			@RequestParam("password") String password) {

		loginUser(httpSession, email, password);

		return null;
	}

	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public ModelAndView displayCreateUserEvent() {
		ModelAndView mv = new ModelAndView();
		List<EventSubject> eventsubjects = eventDao.findAllEventSubjects();

		Boolean errorNoSubjects = false;
		if (eventsubjects.size() == 0) {
			errorNoSubjects = true;
			mv.addObject("errorNoSubjects", errorNoSubjects);
			mv.setViewName("WEB-INF/error/errorPage.jsp");
			return mv;
		} else {
			mv.addObject("eventsubjects", eventsubjects);
			mv.setViewName("WEB-INF/event/createEvent.jsp");
			return mv;
		}

	}

	@RequestMapping(path = "saveEvent.do", method = RequestMethod.POST)
	public ModelAndView createFilm(Event event, int userId, String location,
			String city, String state, int zipcode,
			String eventName, String imgEventSubject,
			String startTime2, String finishTime2) {

		event.setStartTime(startTime2.toString());
		event.setFinishTime(finishTime2.toString());
		ModelAndView mv = new ModelAndView();

		StringBuilder startTime = new StringBuilder(event.getStartTime().toString());

		EventSubject eventSubject = new EventSubject(eventName, imgEventSubject, true);
		Address address = new Address(location, city, state, zipcode);
		Event newCreatedEvent = eventDao.createEvent(userId, event, address, eventSubject);

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
