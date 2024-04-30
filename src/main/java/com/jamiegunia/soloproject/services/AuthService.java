package com.jamiegunia.soloproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamiegunia.soloproject.models.User;
import com.jamiegunia.soloproject.repositories.AuthRepository;

@Service
public class AuthService {
	
	@Autowired
	private AuthRepository repo;
	
	//get one
		public User get (Long id) {
			return repo.findById(id).orElse(null);
		}
			
		
		//create
		public User create (User user) {
			return repo.save(user);
		}
		
		//find by email
		public User get (String email) {
			return repo.findByEmail(email);
		}

}
