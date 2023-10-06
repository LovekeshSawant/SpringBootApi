package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.PatientData;

@Repository
public interface detailDao extends JpaRepository<PatientData, Integer> {
	
	List<PatientData> findBypemailAndPassword(String pemail, String password);
	List<PatientData> findBypemail(String pemail);
}