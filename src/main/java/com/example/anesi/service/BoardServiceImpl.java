package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.BoardMapper;
import com.example.anesi.model.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	// 전체 게시글
	@Override
	public List<Board> boardAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.boardAll(map);
	}
	// 인기글
	@Override
	public List<Board> boardBest(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.boardBest(map);
	}
	@Override
	public Board selectBoardView(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardView(map);
	}
	
	
}
