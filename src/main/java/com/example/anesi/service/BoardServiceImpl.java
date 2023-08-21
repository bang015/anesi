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
	public HashMap<String, Object> boardAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", boardMapper.boardAll(map));
		resultMap.put("cnt", boardMapper.selectCnt(map));
		return resultMap;
	}
	
	// 내 전체 게시글
	@Override
	public HashMap<String, Object> myBoardAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", boardMapper.myBoardAll(map));
		resultMap.put("cnt", boardMapper.mySelectCnt(map));
		return resultMap;
	}
	
	// 게시글 검색
	@Override
	public HashMap<String, Object> searchBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("sList", boardMapper.searchBoard(map));
		resultMap.put("cnt", boardMapper.searchCnt(map));
		return resultMap;
	}
	
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
		Board info = boardMapper.selectBoardView(map);
		resultMap.put("info", info);
		//작성자 no
		map.put("nick", info.getNick());
		resultMap.put("userInfo", boardMapper.selectBoardViewUser(map));
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
	public HashMap<String, Object> selectComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", boardMapper.selectComment(map));
		resultMap.put("cnt", boardMapper.commentCnt(map));
		return resultMap;
	}
	@Override
	public int deleteComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteComment(map);
	}
	
	@Override
	public int editComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.editComment(map);
	}

	
}
