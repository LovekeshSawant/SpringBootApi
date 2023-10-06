package com.MyController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.PatientData;
import com.entity.bookingDB;
import com.entity.docdetails;
import com.services.paitentService;

@Controller
public class Login_Controller {
	
	private int pid;
	private int did;
	private String dname;
	private String username;
	
	@Autowired
	private paitentService paitentservice;
	
	
	//Main page login
	@RequestMapping("/")
	public String home()
	{
		return "Login";
	}
	
	//redirecting to patientsugnup
	@RequestMapping("/paitentsignup")
	public String paitentSignup() {
		return "paitentSign";
	}
	
	//redirecting to soctorsugnup page
	@RequestMapping("/docSignup")
	public String docSignup()
	{
		return "/docSignup";
	}
	
	@RequestMapping("/welcome")
	public String finalPage(Model model)
	{
		List<docdetails> dlls = paitentservice.docList();
		model.addAttribute("userName", username);
		model.addAttribute("tableData", dlls);
		return "welcome";
	}
	
	//Saving patientdata in database
	@PostMapping("/paitentdata")
	public String register(@ModelAttribute PatientData patientdata, HttpSession session) {
		
		int temp = paitentservice.saveData(patientdata);	
		if(temp==1)
		{
			session.setAttribute("message", "Registeration successful please login! ");
		}else {
			session.setAttribute("message", "User already exist with this emal!");
		}
		return "redirect:/paitentsignup";
	}

	//Login Validation and redirecting to welcome page 
	@PostMapping("/loginDetails")
	public String userLogin(@ModelAttribute PatientData patientdata, Model model)
	{
		List<PatientData> p = paitentservice.userValid(patientdata.getPemail(), patientdata.getPassword());
		List<docdetails> dl = paitentservice.docList();
		if(p.size()!=0)
		{ 
			username = p.get(0).getPname();
			model.addAttribute("userName", username);
			model.addAttribute("tableData", dl);
			pid = p.get(0).getPid();
			return "welcome";
		}else {
			model.addAttribute("message", "Invalid username or password !");
			return "Login";
		}
	}
	
	//redirecting to bookings page
	@PostMapping("/bookAppointment")
	public String bookAppointment(@RequestParam("doctorId") String dname, Model model)
	{
		model.addAttribute("doctorname", dname);
		this.dname = dname;
		return "booking";
	}
	
	//after clicking on details button showing specific doctors details
	@GetMapping("/details")
	public String doctordetails(@RequestParam("doctorId") int id, Model model)
	{
		docdetails dlls = paitentservice.getDoctorDetails(id);
		model.addAttribute("doctorData", dlls);
		did = dlls.getId();
		return "doctorsDetails";
	}
	
	// for final page Appointment booked 
	@PostMapping("/successful")
	public String checkAvail(@ModelAttribute bookingDB bookingdb, Model model)
	{
		System.out.println(bookingdb);
		int temp = paitentservice.bookAppointment(bookingdb);
		if(temp==1)
		{	
			return "finalPage";
		} else if(temp==2) 
		{
			sendMessages("All bookings done for the day", model);
		}else if(temp==3) 
		{
				sendMessages("Slot already booked check for another time", model);
		}else {
		sendMessages("Please Choose valid date", model);
		}
		return "booking";
	}
	
	public String sendMessages(String Message, Model model)
	{
		model.addAttribute("message", Message);
		model.addAttribute("doctorname", dname);
		return "booking";
	}
}