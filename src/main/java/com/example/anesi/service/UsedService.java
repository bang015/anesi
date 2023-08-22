package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Board;
import com.example.anesi.model.BoardComment;
import com.example.anesi.model.UsedPurchase;

public interface UsedService {
	//매입게시판 리스트
	List<UsedPurchase> purchaseList(HashMap<String, Object> map);
}
