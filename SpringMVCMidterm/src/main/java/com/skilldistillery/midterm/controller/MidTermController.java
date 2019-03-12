package com.skilldistillery.midterm.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}

	@RequestMapping(path = "login.do", params = { "email", "password" }, method = RequestMethod.POST)
	public ModelAndView loginUser(HttpSession session, String email, String password) {
		ModelAndView mv = new ModelAndView();
		User user = eventDao.findUserByEmail(email);
		if (user != null && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			mv.setViewName("WEB-INF/loginUser.jsp");
		} else {
			mv.setViewName("WEB-INF/index.jsp");
		}

		return mv;
	}

	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public ModelAndView displayCreateUserEvent() {
		ModelAndView mv = new ModelAndView();
		
		List<EventSubject> eventsubjectsList = eventDao.findAllEventSubjects();
		Set<EventSubject> eventsubjects = new HashSet<EventSubject>(eventsubjectsList);		
		HashSet<Object> seen=new HashSet<>();
		eventsubjects.removeIf(e->!seen.add(e.getEventName()));
		
		
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
	public ModelAndView createEvent(HttpSession session, Event event,  String location, String city, String state, int zipcode,
			String eventName, String imgEventSubject, String startTime2, String finishTime2, boolean chooseDropdown,
			String eventNameNew, String eventNameDropDown) {

		EventSubject eventSubject =null;
		if(chooseDropdown){
			 eventSubject = new EventSubject(eventNameDropDown, imgEventSubject, true);
		}else {
			 eventSubject = new EventSubject(eventNameNew, imgEventSubject, true);
		}
		
		event.setActive(true);
		event.setOpen(true);
		event.setStartTime(startTime2.toString());
		event.setFinishTime(finishTime2.toString());
		ModelAndView mv = new ModelAndView();
		
		Address address = new Address(location, city, state, zipcode);
		Event newCreatedEvent = eventDao.createEvent(1, event, address, eventSubject);

		Boolean errorCreatedEvent = false;
		if (newCreatedEvent == null) {
			errorCreatedEvent = true;
			mv.addObject("newCreatedEvent", newCreatedEvent);
			mv.addObject("errorCreatedEvent", errorCreatedEvent);
			mv.setViewName("WEB-INF/error/error.jsp");
			return mv;
		} else {
			mv.addObject("newCreatedEvent", newCreatedEvent);
			mv.setViewName("WEB-INF/event/result.jsp");
			return mv;
		}

	}

}
