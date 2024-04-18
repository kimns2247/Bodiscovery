package com.project.board.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.service.BoardService;
import com.project.board.service.dao.BoardDAO;
import com.project.board.vo.BoardVO;
import com.project.board.vo.Criteria;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDao;
	
	@Override
	@Transactional
	public ArrayList<BoardVO> boardList(){
		
		return boardDao.boardList();
	}

	
	@Override
	public void boardWrite(BoardVO boardVO) {
		boardDao.boardWrite(boardVO);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO getBoard(int bno) {
		boardDao.viewCount(bno);
		
		return boardDao.getBoard(bno);
		
	}
	
	@Override
	public void viewCount(int bno) {
		boardDao.viewCount(bno);
	}
	
	
	@Override
	public void boardUpdate(BoardVO boardVO) {
		boardDao.boardUpdate(boardVO);
	}
	
	@Override
	public BoardVO toBoardUpdate(int bno) {
		return boardDao.toBoardUpdate(bno);
	}
	
	@Override
	public void boardDelete(BoardVO boardVO) {
		boardDao.boardDelete(boardVO);
	}
	
	
	@Override
	public ArrayList<BoardVO> boardListpage(Criteria cri){
		
		return boardDao.boardListpage(cri);
	}
	
	@Override
	public int listCount() {
		return boardDao.listCount();
	}

//	@Override
//	public int count() {
//		return boardDao.count();
//	}
//	
//	@Override
//	public ArrayList<BoardVO> boardListpage(int displayPost, int postNum) {
//		/*
//		 * HashMap data = new HashMap(); data.put("displayPost", displayPost);
//		 * data.put("postNum", postNum);
//		 */
//		
//		HashMap<Integer, Integer> data = new HashMap<Integer, Integer>(displayPost, postNum);
//		System.out.println("서비스의"+"디플포" + data.get(displayPost) + "포스트넘" + data.get(postNum));
//		return boardDao.boardListpage(data.get(displayPost),data.get(postNum));
//	}
	
	//@Override
	//@Transactional
	//public ArrayList<ReplyVO> replyList(int bno){
	//	return boardDao.replyList(bno);
	//}
	
	
	
	
}
