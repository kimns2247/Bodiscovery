package com.project.board.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.service.ReplyService;
import com.project.board.service.dao.ReplyDAO;
import com.project.board.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

   @Autowired
   private ReplyDAO replyDao;
   
   @Override
   @Transactional
   public ArrayList<ReplyVO> replyList(int bno){
      return replyDao.replyList(bno);
   }
   
   @Override
   @Transactional
   public ReplyVO select(int rno){
      return replyDao.select(rno);
   }
   
   
   @Override
   public void replyWrite(ReplyVO replyVO) {
      replyDao.replyWrite(replyVO);
   }
   
   
   @Override
   public void replyUpdate(ReplyVO replyVO) {
      replyDao.replyUpdate(replyVO);
   }
   
   @Override
   public void updelete(ReplyVO replyVO) {
      replyDao.updelete(replyVO);
   }
   
   
   @Override
   public void replyDelete(ReplyVO replyVO) {
      replyDao.replyDelete(replyVO);
   }
   
   
   @Override
   public int maxNum() {
      return replyDao.maxNum();
   }
   
   @Override
   public int maxOrder(int re_parent) {
      return replyDao.maxOrder(re_parent);
   }
   
   @Override
   public void updateOrder(ReplyVO replyVO) {
       replyDao.updateOrder(replyVO);
   }
   
   @Override
   public int replyCheck(int re_parent) {
      return replyDao.replyCheck(re_parent);
      
   }
}