package com.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.bookDone;
import com.dao.ddetails;
import com.dao.detailDao;
import com.entity.PatientData;
import com.entity.bookingDB;
import com.entity.docdetails;

@Service
public class patientServiceImpl implements paitentService {
	
	@Autowired
	private detailDao detaildao;
	
	@Autowired
	private ddetails dlls;
	
	@Autowired
	private bookDone bookdone;

	@Override
	public int saveData(PatientData patientedata)
	{
		List<PatientData> p = userValid(patientedata.getPemail(), patientedata.getPassword());
		if(p.size()==0)
		{
			detaildao.save(patientedata);
			return 1;
		}
		return 0;
	}

	@Override
	public List<PatientData> userValid(String pemail, String password)
	{
		List<PatientData> p = detaildao.findBypemailAndPassword(pemail, password);
		return p;
	}

	
	//returns all available doctors
	@Override
	public List<docdetails> docList() {
		
		List<docdetails> dl = dlls.findAll(); 
		return dl;
	}

	//fetches doctod by id;
	@Override
	public docdetails getDoctorDetails(int id) {
		return this.dlls.getById(id);
	}

	//Checking for Available bookings
	@Override
	public int bookAppointment(bookingDB bookingdb) {
		
		try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date currDate = new Date();
				Date newDate = formatter.parse(bookingdb.getDate());
				String currentDate = formatter.format(currDate);
				List<bookingDB> bookdb = bookdone.findByDnameAndDate(bookingdb.getDname(), bookingdb.getDate());
				if(currentDate.equals(bookingdb.getDate())==true || newDate.after(currDate)==true)
				{
					if(bookdb.size()==0)
					{
						bookdone.save(bookingdb);
						return 1;
					} else if(bookdb.size() < 3)
					{
						int lsCount;
						for(lsCount=0; lsCount < bookdb.size(); lsCount++)
						{
							if(bookdb.get(lsCount).getTime().equalsIgnoreCase(bookingdb.getTime())==true)
							{
								break;
							}
						}
						
						if(lsCount == bookdb.size())
						{
							bookdone.save(bookingdb);
							return 1;
						}
						return 3;
					}
					return 2; 
				} else {
					return 0;
				}
			
			}catch(ParseException e) { 
				System.out.println(e.getMessage());
			}
		return 0;
	}
}
