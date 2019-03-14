package com.skilldistillery.midterm.controller;

import java.util.ArrayList;
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
import com.skilldistillery.midterm.entities.UserEvent;

@Controller
public class MidTermController {

	@Autowired
	private EventDAO eventDao;

	@RequestMapping(path = { "/", "home.do" }, method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Event> indexEvents = eventDao.findEventsForFrontPage();
		User currentUser = (User)session.getAttribute("user");
		if(currentUser != null) {
			List<Event> userevents = eventDao.findUserEvents(currentUser.getId());
			
			if(userevents != null) {
				if(userevents.size()>3) {
					List<Event> subItems = new ArrayList<Event>(userevents.subList(0, 3));
					mv.addObject("userevents", subItems);
				}else {
					mv.addObject("userevents", userevents);
				}
				
				mv.addObject("currentUser", currentUser);

			}
		}		
		mv.addObject("indexEvents", indexEvents);
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}
	
	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public ModelAndView registerUser(User user) {
		ModelAndView mv = new ModelAndView();
		eventDao.createUser(user);
		user.setActive(true);
		mv.addObject("userID", user);
		mv.setViewName("WEB-INF/userProfile.jsp");
		return mv;
	}

	@RequestMapping(path = "login.do", params = { "email", "password" }, method = RequestMethod.POST)
	public ModelAndView loginUser(HttpSession session, String email, String password) {
		ModelAndView mv = new ModelAndView();
		User user = eventDao.findUserByEmail(email);
		if (user != null && user.getPassword().equals(password)) {
			session.setAttribute("user", user);
			mv.setViewName("WEB-INF/userProfile.jsp");
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

	@RequestMapping(path = "allUserEvents.do", method = RequestMethod.POST)
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
		User currentUser = (User)session.getAttribute("user");

		Address address = new Address(location, city, state, zipcode);
		Event newCreatedEvent = eventDao.createEvent(currentUser.getId(), event, address, eventSubject);

		Boolean errorCreatedEvent = false;
		if (newCreatedEvent == null) {
			errorCreatedEvent = true;
			mv.addObject("newCreatedEvent", newCreatedEvent);
			mv.addObject("errorCreatedEvent", errorCreatedEvent);
			mv.setViewName("WEB-INF/error/error.jsp");
			return mv;
		} else {
//			mv.addObject("newCreatedEvent", newCreatedEvent);
			List<Event> userevents = eventDao.findUserEvents(event.getUser().getId());
			mv.addObject("userevents", userevents);
			mv.addObject("currentUser", currentUser);
			mv.setViewName("WEB-INF/event/result.jsp");
			return mv;
		}

	}

	@RequestMapping(path = "editUser.do", method = RequestMethod.POST)
	public ModelAndView editUser(Integer id, User editUser) {
		ModelAndView mv = new ModelAndView();
		User user = eventDao.updateUser(editUser, id);
		mv.addObject("userID", user);
		mv.setViewName("WEB-INF/userProfile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST)
	public ModelAndView deleteUser(Integer id) {
		ModelAndView mv = new ModelAndView();
		eventDao.destroyUser(id);
		mv.setViewName("WEB-INF/userProfile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public String deleteEvent(Integer id,Event eventID, Boolean indexpage) {
		ModelAndView mv = new ModelAndView();
		eventDao.destroyEvent(eventID, id);
		mv.addObject("event", eventID);
		if(indexpage) {
			return "redirect:/home.do";
		}else{
			// mv.setViewName("WEB-INF/userProfile.jsp");
			return "redirect:/userProfile.jsp";
		}	
	}
		
	@RequestMapping(path = "deleteEventByUser.do", method = RequestMethod.POST)
	public String deleteEvent(int eventId) {
		//ModelAndView mv = new ModelAndView();
		System.out.println(eventId + "$$$$$$$$$$$$$$$$$$$$$$$");
		boolean isSuccessful = eventDao.deleteEvent(eventId);
		System.out.println(isSuccessful + "@@@@@@@@@@@@@@@@$$$$$$$$$$$$");
		// mv.setViewName("WEB-INF/index.jsp");
		if (!isSuccessful) {
			//mv.setViewName("WEB-INF/error/error.jsp");
			return "WEB-INF/error/error.jsp";
		}
		return "redirect:/home.do";
	}
		
	@RequestMapping(path = "editEvent.do", method = RequestMethod.POST)
	public ModelAndView editEvent(Integer id,Event event) {
		ModelAndView mv = new ModelAndView();
		eventDao.editEvent(id, event);
		mv.addObject("event", event);
		mv.setViewName("WEB-INF/userProfile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "logout.do")
	public ModelAndView logoutUser(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("home.do");
		return mv;
	}
	
	@RequestMapping(path = "eventDetails.do" , method = RequestMethod.GET)
	public ModelAndView eventdetails(HttpSession session, Integer id) {
		ModelAndView mv = new ModelAndView();
		Event selectedEvent = eventDao.findEventById(id);
		if(selectedEvent == null) {
			mv.addObject("errorEventisNull", true);
			mv.setViewName("WEB-INF/event/eventDetails.jsp");
		}else {
			mv.addObject("selectedEvent", selectedEvent);
			mv.setViewName("WEB-INF/event/eventDetails.jsp");
		}
		return mv;
	}
	
	@RequestMapping(path = "joinEvent.do" , method = RequestMethod.POST)
	public String joinEvent(HttpSession session, Integer eventId) {
		ModelAndView mv = new ModelAndView();
		System.out.println(eventId +"eeeeeeeeeeeeeeeeeeeeeeeee");
		User currentUser = (User)session.getAttribute("user");
Boolean t=true;
		UserEvent addUserToEvent = eventDao.addUsertoEventUser(currentUser.getId(),eventId );
		if(addUserToEvent == null) {
			mv.addObject("addUserToEventSuccess", false);
			return "redirect:/home.do";
		}else {
			mv.addObject("addUserToEventSuccess", t);
			//System.out.println(addUserToEventSuccess + "###########################");
			mv.addObject("addUserToEvent", addUserToEvent);
			return "redirect:/home.do";
		}
	}
}
