package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Board;
import com.example.anesi.model.User;

@Mapper
public interface BoardMapper {
	// 게시글 작성
	int insertBoard(HashMap<String, Object> map);
	// 전체 게시글 
	List<Board> boardAll(HashMap<String, Object> map);
	// 내 게시글
	List<Board> myBoardAll(HashMap<String, Object> map);
	// 게시글 검색
	List<Board> searchBoard(HashMap<String, Object> map);
	// 게시글 cnt
	int selectCnt(HashMap<String, Object> map);
	// 내 게시글 cnt
	int mySelectCnt(HashMap<String, Object> map);
	// 검색 게시글 cnt
	int searchCnt(HashMap<String, Object> map);
	// 인기글
	List<Board> boardBest(HashMap<String, Object> map);
	// 게시글 보기
	Board selectBoardView(HashMap<String, Object> map);
	// 작성자 info
	User selectBoardViewUser(HashMap<String, Object> map);
	// 조회수 증가
	int updateViewCnt(HashMap<String, Object> map);
	// 게시글 삭제
	int deleteBoard(HashMap<String, Object> map);
	// 게시글 이미지 삭제
	int deleteBoardImage(HashMap<String, Object> map);
	// 게시글 수정
	int updateBoard(HashMap<String, Object> map);
	// 댓글 입력
	int insertComment(HashMap<String, Object> map);
	// 댓글 리스트
	List<Board> selectComment(HashMap<String, Object> map);
	// 댓글 cnt
	int commentCnt(HashMap<String, Object> map);
	// 댓글 삭제
	int deleteComment(HashMap<String, Object> map);
	// 댓글 수정
	int editComment(HashMap<String, Object> map);
	// 커뮤니티 썸네일 등록
	int communityUpload(HashMap<String, Object> map);
	// 커뮤니티 썸네일 수정
	int communityUpdate(HashMap<String, Object> map);

}
