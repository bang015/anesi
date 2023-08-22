package com.example.anesi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.UsedMapper;


@Service
public class UsedServiceImpl implements UsedService{

	@Autowired
	UsedMapper usedMapper;
	
}
