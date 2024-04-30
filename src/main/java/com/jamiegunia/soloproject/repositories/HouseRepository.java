package com.jamiegunia.soloproject.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.jamiegunia.soloproject.models.House;

public interface HouseRepository extends CrudRepository <House, Long>{
	public ArrayList<House> findAll();

}
