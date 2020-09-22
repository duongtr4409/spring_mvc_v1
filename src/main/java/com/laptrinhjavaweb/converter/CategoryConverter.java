package com.laptrinhjavaweb.converter;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;

@Component
public class CategoryConverter {
	
	public CategoryDTO toDTO(CategoryEntity categoryEntity) {
		CategoryDTO categoryDTO = new CategoryDTO();
		BeanUtils.copyProperties(categoryEntity, categoryDTO);
		return categoryDTO;
	}
	
	public CategoryEntity toEntity(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = new CategoryEntity();
		BeanUtils.copyProperties(categoryDTO, categoryEntity);
		return categoryEntity;
	}
}
