package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.BoardMapper;
import com.example.anesi.model.Board;
import com.example.anesi.model.BoardComment;

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
	// 게시글 보기
	@Override
	public HashMap<String, Object> selectBoardView(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//조회수 증가
		boardMapper.updateViewCnt(map);
		//게시글 상세보기
		resultMap.put("info", boardMapper.selectBoardView(map));
		//댓글 목록
		resultMap.put("cList", boardMapper.selectComment(map));
		return resultMap;
	}
	@Override
	public int updateViewCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.updateViewCnt(map);
	}
	@Override
	public int insertBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.insertBoard(map);
	}
	@Override
	public int deleteBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteBoard(map);
	}
	@Override
	public int updateBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.updateBoard(map);
	}
	@Override
	public int insertComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.insertComment(map);
	}
	@Override
	public List<Board> selectComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.selectComment(map);
	}
	@Override
	public int deleteComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteComment(map);
	}
	
}
