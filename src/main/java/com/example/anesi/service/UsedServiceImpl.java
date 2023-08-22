package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.UsedMapper;
import com.example.anesi.model.UsedPurchase;


@Service
public class UsedServiceImpl implements UsedService{

	@Autowired
	UsedMapper usedMapper;

	@Override
	public List<UsedPurchase> purchaseList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usedMapper.purchaseList(map);
	}
	
}
