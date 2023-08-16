package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Board;

@Mapper
public interface BoardMapper {
	// 전체 게시글 
	List<Board> boardAll(HashMap<String, Object> map);
	// 인기글
	List<Board> boardBest(HashMap<String, Object> map);
	
	Board selectBoardView(HashMap<String, Object> map);
}
