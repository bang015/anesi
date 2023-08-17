package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Board;
import com.example.anesi.model.BoardComment;

public interface BoardService {
	// 게시글 작성
	int insertBoard(HashMap<String, Object> map);
	// 전체 게시글
	List<Board> boardAll(HashMap<String, Object> map);
	// 인기글
	List<Board> boardBest(HashMap<String, Object> map);
	// 게시글 보기
	HashMap<String, Object> selectBoardView(HashMap<String, Object> map);
	// 조회수 증가
	int updateViewCnt(HashMap<String, Object> map);
	// 게시글 삭제
	int deleteBoard(HashMap<String, Object> map);
	// 게시글 수정
	int updateBoard(HashMap<String, Object> map);
	// 댓글 입력
	int insertComment(HashMap<String, Object> map);
	// 댓글 리스트
	List<Board> selectComment(HashMap<String, Object> map);
	// 댓글 삭제
	int deleteComment(HashMap<String, Object> map);
	// 게시글 검색
	List<Board> searchBoard(HashMap<String, Object> map);
}
