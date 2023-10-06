package com.services;

import java.util.Date;
import java.util.List;

import com.entity.PatientData;
import com.entity.bookingDB;
import com.entity.docdetails;

public interface paitentService {
	
	public int saveData(PatientData paitentdata, String confirm_password);
	public List<PatientData> userValid(String pemail, String password);
	public List<docdetails> docList();
	public docdetails getDoctorDetails(int id);
	public int bookAppointment(bookingDB bookingdb);
}
