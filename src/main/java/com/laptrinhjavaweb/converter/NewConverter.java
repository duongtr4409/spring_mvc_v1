package com.laptrinhjavaweb.converter;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

@Component
public class NewConverter {
	
	public NewDTO toDTO(NewEntity newEntity) {
		NewDTO newDTO = new NewDTO();
		BeanUtils.copyProperties(newEntity, newDTO);
		newDTO.setCategoryCode(newEntity.getCategory().getCode());
		newDTO.setCategoryId(newEntity.getCategory().getId());
		return newDTO;
	}
	
	public NewEntity toEntity(NewDTO newDTO) {
		NewEntity newEntity = new NewEntity();
		BeanUtils.copyProperties(newDTO, newEntity);
		return newEntity;
	}
	
	public NewEntity toEntiTy(NewEntity oldEntity, NewDTO newDTO) {
		oldEntity.setTitle(newDTO.getTitle());
		oldEntity.setThumbnail(newDTO.getThumbnail());
		oldEntity.setShortDescription(newDTO.getShortDescription());
		oldEntity.setContent(newDTO.getContent());
		return oldEntity;
	}
}
