package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Board;
import com.example.anesi.model.BoardComment;

public interface BoardService {
	// 게시글 작성
	HashMap<String, Object> insertBoard(HashMap<String, Object> map);
	// 전체 게시글
	HashMap<String, Object> boardAll(HashMap<String, Object> map);
	// 내 게시글
	HashMap<String, Object> myBoardAll(HashMap<String, Object> map);
	// 게시글 검색
	HashMap<String, Object> searchBoard(HashMap<String, Object> map);
	// 인기글
	List<Board> boardBest(HashMap<String, Object> map);
	// 게시글 보기
	HashMap<String, Object> selectBoardView(HashMap<String, Object> map);
	// 조회수 증가
	int updateViewCnt(HashMap<String, Object> map);
	// 게시글 삭제
	HashMap<String, Object> deleteBoard(HashMap<String, Object> map);
	// 게시글 이미지 삭제
	int deleteBoardImage(HashMap<String, Object> map);
	// 게시글 수정
	int updateBoard(HashMap<String, Object> map);
	// 댓글 입력
	int insertComment(HashMap<String, Object> map);
	// 댓글 리스트
	HashMap<String, Object> selectComment(HashMap<String, Object> map);
	// 댓글 삭제
	int deleteComment(HashMap<String, Object> map);
	// 댓글 수정
	int editComment(HashMap<String, Object> map);
	// 커뮤니티 썸네일 등록
	int communityUpload(HashMap<String, Object> map);
	// 커뮤니티 썸네일 수정
	int communityUpdate(HashMap<String, Object> map);
	// 글 좋아요 리스트
	List<Board> searchBoardGreatList(HashMap<String, Object> map);
	// 글 좋아요 수정
	int editGreat(HashMap<String, Object> map);
	
}
