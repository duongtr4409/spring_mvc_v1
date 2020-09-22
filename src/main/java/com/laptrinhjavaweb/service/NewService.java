package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.NewDTO;

public interface NewService {
	
	List<NewDTO> findAll(Pageable pageable);
	int getTotalItem();
	NewDTO findById(long id);
	NewDTO insert(NewDTO addNewDTO);
	NewDTO update(NewDTO updateNewDTO);
	NewDTO save(NewDTO saveDTO);
	void delete(long[] ids);
}
