package com.jamiegunia.soloproject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jamiegunia.soloproject.models.User;

@Repository
public interface AuthRepository extends CrudRepository <User, Long>{

	//this needs to be put in explicitly since findAll and findAllById are of the modifier and type iterable and need defined/declared
		public User findByEmail(String email);
}
