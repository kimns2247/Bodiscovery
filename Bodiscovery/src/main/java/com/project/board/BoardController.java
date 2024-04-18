package com.project.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.board.service.BoardService;
import com.project.board.service.ReplyService;
import com.project.board.vo.BoardVO;
import com.project.board.vo.Criteria;
import com.project.board.vo.PageMaker;
import com.project.board.vo.ReplyVO;
import com.project.file.UploadFile;

@Controller
public class BoardController {

   @Resource(name="boardService")
   private BoardService boardService;
   
   @Resource(name="replyService")
   private ReplyService replyService;

   @Resource(name="uploadPath")
   private String uploadPath;
   
   @RequestMapping(value = "/boardList.do")
   public String boardList(Model model) {
      
       ArrayList<BoardVO> blist = boardService.boardList();
        
        model.addAttribute("blist",blist);
      
      return "/board/boardList";
   }
   
   @RequestMapping(value = "/boardListpage")
   public String boardListpage(Model model, Criteria cri) {
      
      model.addAttribute("blist", boardService.boardListpage(cri));
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(boardService.listCount());
      
      model.addAttribute("pageMaker", pageMaker);
      
      return "board/boardListpage";
   }

   
   
   @RequestMapping(value="/toBoardWrite.do")
   public String toBoardWrite(BoardVO boardVO, Model model) {
      
      return "/board/boardWrite";
   }
   
   @RequestMapping(value="/boardWrite.do")
   public String boardWrite(@ModelAttribute("boardVO") BoardVO boardVO, Model model, MultipartFile file) throws IOException, Exception {
      
      String imgUploadPath = uploadPath + File.separator + "imgUpload";
      /* String ymdPath = UploadFile.calcPath(imgUploadPath); */
      String fileName = null;
      
      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
         fileName = UploadFile.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());   
      
      
         boardVO.setFilename(File.separator + "imgUpload" + File.separator + fileName);
         
      }
      

      boardService.boardWrite(boardVO);
      
      return "redirect:/boardListpage";
   }
   
   @RequestMapping(value="/getBoard", method = RequestMethod.GET)
   public String getBoard(BoardVO boardVO, Model model) {
      
      
      model.addAttribute("board",boardService.getBoard(boardVO.getBno()));
   
      ArrayList<ReplyVO> reply = null;
      reply = replyService.replyList(boardVO.getBno());
      model.addAttribute("reply",reply);

      
      return "/board/getBoard";
   }
   
   @RequestMapping(value="/toBoardUpdate")
   public String toBoardUpdate(BoardVO boardVO, Model model, HttpServletRequest req) {
   
      model.addAttribute("board", boardService.toBoardUpdate(boardVO.getBno()));
      
      return "/board/boardUpdate";
   }
   
   @RequestMapping(value="/boardUpdate.do")
   public String boardUpdate(@ModelAttribute("boardVO")BoardVO boardVO, Model model, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
      
      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
         new File(uploadPath + req.getParameter("filename")).delete();
         
         String imgUploadPath = uploadPath + File.separator + "imgUpload";
         String fileName = UploadFile.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes());
         
         boardVO.setFilename(File.separator + "imgUpload" + File.separator + fileName);
      }
      
      boardService.boardUpdate(boardVO);
      
      return "redirect:/boardListpage";
   }
   
   @RequestMapping(value="/boardDelete.do")
   public String boardDelete(@ModelAttribute("boardVO")BoardVO boardVO, Model model) {
      boardService.boardDelete(boardVO);
      
      return "redirect:/boardListpage";
   }
   

   
   @RequestMapping(value = "replyWrite.do")
   public String replyWrite(ReplyVO replyVO, HttpSession session) {
        int number = replyService.maxNum();
        int re_order = 0 , re_depth = 0;
        int bno = replyVO.getBno(); 
        int rno = replyVO.getRno();
        String re_content = replyVO.getRe_content();

        if(rno != 0) {//댓글에 댓글을 달 때
          ReplyVO rvo1 = replyService.select(rno); // 댓글의 order와 depth를 파악하기 위함
          if(rvo1.getRe_order() == 0 && rvo1.getRe_depth() == 0) {
             
             replyVO.setRe_parent(rno); //같은 계열의 대댓글끼리 모으기 위해 부모의 번호로 세팅
             int maxOrder = replyService.maxOrder(rvo1.getRe_parent());
             replyVO.setRe_order(maxOrder);
             replyVO.setRe_depth(rvo1.getRe_depth() + 1);
             
          }else { //대댓글에 댓글을  달 때
             replyVO.setRe_parent(rvo1.getRe_parent()); 
             replyVO.setRe_order(rvo1.getRe_order());
             replyService.updateOrder(replyVO); //re_parent가 같고 읽은 글의 re_order가 읽어온 글의 re_order보다 크면 그 글의 re_order + 1 
             
             replyVO.setRe_parent(rvo1.getRe_parent());   
             replyVO.setRe_order(rvo1.getRe_order() + 1);
             replyVO.setRe_depth(rvo1.getRe_depth() + 1);
          }
          
        }else {//기본 댓글의 경우
           replyVO.setRe_parent(number);
           replyVO.setRe_order(re_order);
           replyVO.setRe_depth(re_depth);
           
        }
      
       replyVO.setRe_content(re_content);
       replyVO.setBno(bno);
       replyVO.setRno(number);
       
       System.out.println("컨트롤러rno" + rno);
       System.out.println("컨트롤러number" + number);
       System.out.println("컨트롤러bno" + bno);
       System.out.println("컨트롤러content" + re_content);
       System.out.println("컨트롤러 세트" + replyVO.getRe_parent()+ replyVO.getRe_order() + replyVO.getRe_depth());
      
       
      replyService.replyWrite(replyVO);

      return "redirect:/getBoard?bno=" + replyVO.getBno();
   }
   
   @RequestMapping(value = "replyUpdate.do")
   public String replyUpdate(@ModelAttribute("ReplyVO") ReplyVO replyVO, Model model, HttpSession session)   {
      System.out.println("여까진 왔니?");
      replyService.replyUpdate(replyVO);
      
      return "redirect:/getBoard?bno=" + replyVO.getBno();
   }
   
   @RequestMapping(value = "replyDelete.do")
   public String replyDelete(ReplyVO replyVO, HttpSession session) {
      int rno = replyVO.getRno();
      ReplyVO rvo1 = replyService.select(rno);
      int re_check = replyService.replyCheck(rvo1.getRe_parent());
      System.out.println("체크값: " + re_check);
      
      if(re_check == 1) {
      replyService.replyDelete(replyVO);   
      
      } else {
          
      String upd_content = "삭제된 댓글입니다";
      replyVO.setRe_content(upd_content);
      replyService.updelete(replyVO);
      }
      
      return "redirect:/getBoard?bno=" + replyVO.getBno();
   }

}