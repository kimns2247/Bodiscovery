package com.project.user.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.service.MealService;
import com.project.user.service.dao.MealDAO;
import com.project.user.vo.DiaryVO;
import com.project.user.vo.SportVO;

@Service("mealService")
public class MealServiceImpl implements MealService {   
   
   @Autowired
   private MealDAO mealdao;
   
     public void AddSport(SportVO sportVO) {
        mealdao.AddSport(sportVO);
     }
   
     public void AddBreakfast(DiaryVO diaryVO) {  // 아침식사 추가
     mealdao.AddBreakfast(diaryVO); 
     }
     
     public void AddLunch(DiaryVO diaryVO) {  //점심식사 추가
        mealdao.AddLunch(diaryVO); 
        }
     
     public void AddDinner(DiaryVO diaryVO) {  //저녁식사 추가
        mealdao.AddDinner(diaryVO);
        }
     
     public void AddSnack(DiaryVO diaryVO) {  // 간식 추가
        mealdao.AddSnack(diaryVO);
        }
    
   
   public ArrayList<DiaryVO> MealView(String id) throws Exception {      
      return mealdao.MealView(id);
   }
   
   public ArrayList<DiaryVO> MealView1(String id) throws Exception {      
      return mealdao.MealView1(id);
   }
   
   public ArrayList<DiaryVO> MealView2(String id) throws Exception {      
      return mealdao.MealView2(id);
   }
   
   public ArrayList<DiaryVO> MealView3(String id) throws Exception {      
      return mealdao.MealView3(id);
   }
   
   public ArrayList<SportVO> SportView(String id) throws Exception{
      return mealdao.SportView(id);
   }
   
   //운동 삭제
   public void SportDel(String id, String kcal, String day) {
      mealdao.SportDel(id, kcal, day);
   }
   
   //간식 삭제
   public void SnackDel(String id, String kcal, String day) {   
      mealdao.SnackDel(id, kcal, day);
   }
   
   // 아침 삭제
   public void BreakDel(String id, String kcal, String day) {
      mealdao.BreakDel(id, kcal, day);
   }
   
   // 점심 삭제
   public void LunchDel(String id, String kcal, String day) {
      mealdao.LunchDel(id, kcal, day);
   }
   
   // 저녁 삭제
   public void DinnerDel(String id, String kcal, String day) {
      mealdao.DinnerDel(id, kcal, day);
   }
   
   // 아이디와 날짜를 가지고 먹은것들 체크
   public ArrayList<DiaryVO> Checkmorning(String id, String day) {      
      return mealdao.Checkmorning(id, day);
   }
   
   // 아이디와 날짜를 가지고 먹은것들 체크
      public ArrayList<DiaryVO> Checklunch(String id, String day) {      
         return mealdao.Checklunch(id, day);
      }
   
      // 아이디와 날짜를 가지고 먹은것들 체크
      public ArrayList<DiaryVO> Checkdinner(String id, String day) {      
         return mealdao.Checkdinner(id, day);
      }
      
      // 아이디와 날짜를 가지고 먹은것들 체크
      public ArrayList<DiaryVO> Checksnack(String id, String day) {      
         return mealdao.Checksnack(id, day);
      }
      
      public ArrayList<SportVO> Checksport(String id, String day){
         return mealdao.Checksport(id, day);
      }
   
   
   
   
   
   

   

   
   
   
   
}





