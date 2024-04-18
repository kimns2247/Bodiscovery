package com.project.board.service.dao;

import java.util.ArrayList;

import com.project.board.vo.BoardVO;
import com.project.board.vo.Criteria;


public interface BoardDAO {
	
	//1) 게시글목록 보기
	ArrayList<BoardVO> boardList();

	//2) 게시글 작성
	void boardWrite(BoardVO boardVO);
	
	//3) 게시글 보기
	BoardVO getBoard(int bno);
	
	//4-1) 게시글 수정페이지로
	BoardVO toBoardUpdate(int bno);
	
	//4-2) 게시글 수정
	void boardUpdate(BoardVO boardVO);
	
	//5) 게시글 삭제
	
	void boardDelete(BoardVO boardVO);
	
	//6) 조회수 증가
	
	void viewCount(int bno);
	
	//7) 페이징
	ArrayList<BoardVO> boardListpage(Criteria cri);
	
	//8) 게시물 총 갯수
	int listCount();
	
	/*
	 * //7) 페이징 처리 카운트
	 * 
	 * int count();
	 * 
	 * //8) 페이징 처리 ArrayList<BoardVO> boardListpage(int displayPost, int postNum);
	 */


}
