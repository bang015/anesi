package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Board;

public interface BoardService {
	// 게시글 작성
	int insertBoard(HashMap<String, Object> map);
	// 전체 게시글
	List<Board> boardAll(HashMap<String, Object> map);
	// 인기글
	List<Board> boardBest(HashMap<String, Object> map);
	// 게시글 보기
	Board selectBoardView(HashMap<String, Object> map);
	// 조회수 증가
	int updateViewCnt(HashMap<String, Object> map);
	// 게시글 삭제
	int deleteBoard(HashMap<String, Object> map);
	// 게시글 수정
	int updateBoard(HashMap<String, Object> map);
}
