package com.example.anesi.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.ImageMapper;
import com.example.anesi.model.Image;

@Service
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	ImageMapper imageMapper;

	@Override
	public int addPorductImage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return imageMapper.insertPorductImage(map);
	}

	@Override
	public Image searchProfileImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return imageMapper.selectProfileImg(map);
	}

	@Override
	public int editProfileImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return imageMapper.updateProfileImg(map);
	}

}
