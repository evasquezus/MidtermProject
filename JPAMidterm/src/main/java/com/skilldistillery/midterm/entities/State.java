package com.skilldistillery.midterm.entities;

public enum State {

	Alabama("Alabama"),
	Alaska("Alaska"),
	Arizona("Arizona"),
	Arkansas("Arkansas"),
	California("California"),
	Colorado("Colorado"),
	Connecticut("Connecticut"),
	Delaware("Delaware"),
	District_of_Columbia("District_of_Columbia"),
	Florida("Florida"),
	Georgia("Georgia"),
	Hawaii("Hawaii"),
	Idaho("Idaho"),
	Illinois("Illinois"),
	Indiana("Indiana"),
	Iowa("Iowa"),
	Kansas("Kansas"),
	Kentucky("Kentucky"),
	Louisiana("Louisiana"),
	Maine("Maine"),
	Montana("Montana"),
	Nebraska("Nebraska"),
	Nevada("Nebraska"),
	New_Hampshire("New_Hampshire"),
	New_Jersey("New_Jersey"),
	New_Mexico("New_Mexico"),
	New_York("New_York"),
	North_Carolina("North_Carolina"),
	North_Dakota("North_Dakota"),
	Ohio("Ohio"),
	Oklahoma("Oklahoma"),
	Oregon("Oregon"),
	Maryland("Maryland"),
	Massachusetts("Massachusetts"),
	Michigan("Michigan"),
	Minnesota("Minnesota"),
	Mississippi("Mississippi"),
	Missouri("Missouri"),
	Pennsylvania("Pennsylvania"),
	Rhode_Island("Rhode_Island"),
	South_Carolina("South_Carolina"),
	South_Dakota("South_Dakota"),
	Tennessee("Tennessee"),
	Texas("Texas"),
	Utah("Texas"),
	Vermont("Vermont"),
	Virginia("Virginia"),
	Washington("Washington"),
	West_Virginia("West_Virginia"),
	Wisconsin("Wisconsin"),
	Wyoming("Wyoming");
	
	private String fullState;
	
	 private State( String s )
	    {
	        fullState = s;
	    }
	
	 public String getState()
	    {
	        return fullState;
	    }

}