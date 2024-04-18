package com.project.user.service;

import java.util.ArrayList;

import com.project.user.vo.DiaryVO;
import com.project.user.vo.SportVO;

public interface MealService {
   
   void AddBreakfast(DiaryVO diaryVO);  //아침식사 추가
   
   
   void AddLunch(DiaryVO diaryVO);  //점심식사 추가
   
   
   void AddDinner(DiaryVO diaryVO);  //저녁식사 추가
   
   
   void AddSnack(DiaryVO diaryVO);  //간식 추가
   
   
   void AddSport(SportVO sportVO); //운동 추가
   
   
   ArrayList <DiaryVO> MealView(String id) throws Exception;  // 식사추가한거 조회
   
   ArrayList <DiaryVO> MealView1(String id) throws Exception;  // 식사추가한거 조회
   
   ArrayList <DiaryVO> MealView2(String id) throws Exception;  // 식사추가한거 조회
   
   ArrayList <DiaryVO> MealView3(String id) throws Exception;  // 식사추가한거 조회
   
   ArrayList <SportVO> SportView(String id) throws Exception;   // 운동추가한거 조회

   void SnackDel(String id, String kcal, String day);   //간식 삭제
   
   void BreakDel(String id, String kcal, String day);   // 아침 삭제
   
   void LunchDel(String id, String kcal, String day);   // 점심 삭제
   
   void DinnerDel(String id, String kcal, String day);  // 저녁 삭제
   
   void SportDel(String id, String kcal, String day);   //운동 삭제
   
   ArrayList <DiaryVO> Checkmorning(String id, String day);   // 아이디와 날짜를 가지고 먹은것들 체크
   
   ArrayList <DiaryVO> Checklunch(String id, String day);   // 아이디와 날짜를 가지고 먹은것들 체크
   
   ArrayList <DiaryVO> Checkdinner(String id, String day);   // 아이디와 날짜를 가지고 먹은것들 체크
   
   ArrayList <DiaryVO> Checksnack(String id, String day);   // 아이디와 날짜를 가지고 먹은것들 체크
   
   ArrayList <SportVO> Checksport(String id, String day);   // 아이디와 날짜를 가지고 운동 체크
   
   

   
}