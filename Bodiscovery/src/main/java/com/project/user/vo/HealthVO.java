package com.project.user.vo;

public class HealthVO {
	
	//========== 회원정보 ==========
	private String id;			//아이디
	private String pw;			//패스워드
	private String name;		//이름
	private String sex;			//성별
	private int age;			//나이
	private String address;		//주소
	private String email;		//이메일
	private String height;		//키
	private String weight;		//몸무게
	private String wishWeigth;	//목표 몸무게
	
	//========== 상품정보 ==========
	private int item_No;		//상품번호
	private String item_Name;	//상품이름
	private int item_Qty;		//재고수량
	private int item_Price;		//가격
	
	//========== 장바구니 ==========
	private int cnt;			//구매수량
	
	
	//=== 페이징 ===
	private int page;			//페이지
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private String catemain;
	private String catesub;
	private String sort;
	
	
	//========== 영양소 ===========
	private String foodName;	//식품이름
	private int foodcode;		//식품코드
	private int calorie;		//칼로리
	private int carbohydrate;	//탄수화물
	private int protein;		//단백질
	private int fat;			//지방
	
	//========== 운동장소 ==========
	private int areaNumber;		//장소번호
	private String areaName;	//장소명
	private String areaAddress;	//주소
	
	
	//========== 결재 ==========
	private String imp_uid;
	private String merchant_uid;
	private String buyer_email;
//	private String buyer_tel;
	private String amount;
	private String buyer_name;
	
	
	//========== getter , setter ==========
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getWishWeigth() {
		return wishWeigth;
	}
	public void setWishWeigth(String wishWeigth) {
		this.wishWeigth = wishWeigth;
	}
	public int getItem_No() {
		return item_No;
	}
	public void setItem_No(int item_No) {
		this.item_No = item_No;
	}
	public String getItem_Name() {
		return item_Name;
	}
	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}
	public int getItem_Qty() {
		return item_Qty;
	}
	public void setItem_Qty(int item_Qty) {
		this.item_Qty = item_Qty;
	}
	public int getItem_Price() {
		return item_Price;
	}
	public void setItem_Price(int item_Price) {
		this.item_Price = item_Price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodcode() {
		return foodcode;
	}
	public void setFoodcode(int foodcode) {
		this.foodcode = foodcode;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public int getCarbohydrate() {
		return carbohydrate;
	}
	public void setCarbohydrate(int carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getAreaNumber() {
		return areaNumber;
	}
	public void setAreaNumber(int areaNumber) {
		this.areaNumber = areaNumber;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaAddress() {
		return areaAddress;
	}
	public void setAreaAddress(String areaAddress) {
		this.areaAddress = areaAddress;
	}
	
	//==========
	
	public int getPage() {
		return page;
	}//
	public void setPage(int page) {
		if (page < 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}//
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}//
	public int getRowStart() {
		this.rowStart = ((this.page - 1) * this.perPageNum) + 1;
		return this.rowStart;
	}//
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		this.rowEnd = this.rowStart + this.perPageNum - 1;
		return this.rowEnd;
	}//
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	public String getCatemain() {
		return catemain;
	}//
	public void setCatemain(String catemain) {
		this.catemain = catemain;
	}//
	public String getCatesub() {
		return catesub;
	}//
	public void setCatesub(String catesub) {
		this.catesub = catesub;
	}//
	public String getSort() {
		return sort;
	}//
	public void setSort(String sort) {
		this.sort = sort;
	}//
	
	public String toString() {
		return "Criteria [page=" + this.page + ", perPageNum=" + this.perPageNum +
				", rowStart=" + this.rowStart + ", rowEnd=" + this.rowEnd + "]";
		
	}
	
	

}
