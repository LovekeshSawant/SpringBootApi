package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.bookingDB;

public interface bookDone extends JpaRepository<bookingDB, Integer> {
	
	List<bookingDB> findByDnameAndDate(String dname, String date);

}
