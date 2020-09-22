package com.laptrinhjavaweb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public Map<String, String> findAll() {
		List<CategoryEntity> listCategoryEntity = categoryRepository.findAll();
		Map<String, String> mapCategory = new HashMap<>();
		listCategoryEntity.stream().forEach( p -> {
			mapCategory.put(p.getCode(), p.getName());
		});
		return mapCategory;
	}
	
}
