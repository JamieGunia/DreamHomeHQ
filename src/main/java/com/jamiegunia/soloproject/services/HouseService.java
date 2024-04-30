package com.jamiegunia.soloproject.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamiegunia.soloproject.models.House;
import com.jamiegunia.soloproject.repositories.HouseRepository;

@Service
public class HouseService {
	
	@Autowired HouseRepository repo;
	
	//create
	public House create(House house) {
		return repo.save(house);
	}
	
	//getone
	public House get(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	
	//getall
		public ArrayList<House> all(){
			return repo.findAll();
	}
	
	//update
		public House update(House house) {
			return repo.save(house);
		}
		
		
	//delete
		public void destroy(Long id) {
			repo.deleteById(id);

		}
}
