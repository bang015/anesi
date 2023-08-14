package com.example.anesi.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ImageMapper;

@Service
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	ImageMapper imageMapper;

	@Override
	public int addPorductImage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return imageMapper.insertPorductImage(map);
	}

}
