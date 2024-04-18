package com.project.board.service.dao;

import java.util.ArrayList;

import com.project.board.vo.ReplyVO;

public interface ReplyDAO {

   ArrayList<ReplyVO> replyList(int bno);
   
   ReplyVO select(int rno);
   
   void replyWrite(ReplyVO replyVO);
   
   void replyUpdate(ReplyVO replyVO);
   
   void replyDelete(ReplyVO replyVO);
   
   void updelete(ReplyVO replyVO);
   
   int maxNum();
   
   int maxOrder(int re_parent);
   
   void updateOrder(ReplyVO replyVO);
   
   int replyCheck(int re_parent);
}