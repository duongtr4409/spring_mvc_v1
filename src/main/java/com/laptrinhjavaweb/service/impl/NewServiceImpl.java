package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.NewService;

@Service
public class NewServiceImpl implements NewService{

	@Autowired
	private NewRepository newRepository;
	
	@Override
	public List<NewModel> findAll() {
		List<NewModel> listNewModel = new ArrayList<>();
		List<NewEntity> listNewEntity = newRepository.findAll();
		
		
		
		
		return listNewModel;
	}
	
}
