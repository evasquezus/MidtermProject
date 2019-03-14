package com.skilldistillery.midterm.entities;

public class EventAddressDTO {
	private String address;
	
	private String city;
	
	private String state;
	
	private int zipcode;
	
	private String name;

	private String description;
	
	private String imageUrl;
	
	private boolean rideShare;
	
	private String startTime;

	private String finishTime;
	
	public EventAddressDTO() {}
	
	public EventAddressDTO(String address, String city, String state, int zipcode, String name, String description,
			String imageUrl, boolean rideShare, String startTime, String finishTime) {
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.name = name;
		this.description = description;
		this.imageUrl = imageUrl;
		this.rideShare = rideShare;
		this.startTime = startTime;
		this.finishTime = finishTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public boolean isRideShare() {
		return rideShare;
	}

	public void setRideShare(boolean rideShare) {
		this.rideShare = rideShare;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}
	
}
