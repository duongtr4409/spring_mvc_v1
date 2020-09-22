package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.NewService;

@Service
public class NewServiceImpl implements NewService {

	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private NewConverter newConverter;
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<NewDTO> findAll(Pageable pageable) {
		List<NewDTO> listNewDTO = new ArrayList<>();
		List<NewEntity> listNewEntity = newRepository.findAll(pageable).getContent();
//		List<NewEntity> listNewEntity = newRepository.findAll();
		listNewEntity.stream().forEach( p -> {
			NewDTO newDTO = new NewDTO();
//			newDTO.setTitle(p.getTitle());
//			newDTO.setCategoryCode(p.getCategory().getCode());
//			newDTO.setCategoryId(p.getCategory().getId());
//			newDTO.setShortDescription(p.getShortDescription());
//			listNewDTO.add(newDTO);
			newDTO = newConverter.toDTO(p);
			listNewDTO.add(newDTO);
		});
		return listNewDTO;
	}

	@Override
	public int getTotalItem() {
		return (int) newRepository.count();
	}

	@Override
	public NewDTO findById(long id) {
		NewDTO newDTO = new NewDTO();
		NewEntity newEntity = newRepository.findOne(id);
		newDTO = newConverter.toDTO(newEntity);
		newDTO.setCategoryCode(newEntity.getCategory().getCode());
		return newDTO;
	}

	@Override
	@Transactional
	public NewDTO insert(NewDTO addNewDTO) {
		NewEntity newEntity= newConverter.toEntity(addNewDTO);
		CategoryEntity categoryEntity = categoryRepository.findOneByCode(addNewDTO.getCategoryCode());
		newEntity.setCategory(categoryEntity);
		return newConverter.toDTO(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public NewDTO update(NewDTO updateNewDTO) {
		NewEntity oldNewEntity = newRepository.findOne(updateNewDTO.getId());
		oldNewEntity = newConverter.toEntiTy(oldNewEntity, updateNewDTO);
		CategoryEntity categoryEntity = categoryRepository.findOneByCode(updateNewDTO.getCategoryCode());
		oldNewEntity.setCategory(categoryEntity);
		return newConverter.toDTO(newRepository.save(oldNewEntity));
	}

	@Override
	@Transactional
	public NewDTO save(NewDTO saveNewDTO) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCode(saveNewDTO.getCategoryCode());
		NewEntity newEntity;
		if( null == saveNewDTO.getId()) {
			newEntity = newConverter.toEntity(saveNewDTO);
		}else {
			NewEntity oldNewEntity = newRepository.findOne(saveNewDTO.getId());
			newEntity = newConverter.toEntiTy(oldNewEntity, saveNewDTO);
		}
		newEntity.setCategory(categoryEntity);
		return newConverter.toDTO(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id : ids) {
			newRepository.delete(id);
		}
	}

}
