package com.project.user.vo;

//import java.util.Date;

public class PublicDataVO {
	private String id;
    private String type;
    private String typeName;
	private String name;
    private String addr;
    private String open;
    private String close;
	private String tel;
	private String registerDate;

	private String searchType;
	private String searchWord;

	private String nowPage;			  // 총 레코드 수
	private String firstRecord;  //처음 데이터
	private String lastRecord; //마지막 테이터
	private String pageSize;					//글 보여줄 갯수






    public String getNowPage() {
		return nowPage;
	}
	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}
	public String getFirstRecord() {
		return firstRecord;
	}
	public void setFirstRecord(String firstRecord) {
		this.firstRecord = firstRecord;
	}
	public String getLastRecord() {
		return lastRecord;
	}
	public void setLastRecord(String lastRecord) {
		this.lastRecord = lastRecord;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

    public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}


}



/*
 * memo
 * - 공공 데이터를 나타내는 객체를 정의 - type 필드는 공공 데이터의 유형을, name 필드는 이름을, addr 필드는 주소를 나타냄
 *   각 필드에 대한 getter 및 setter 메서드가 있어서 해당 필드의 값을 읽고 수정
 *
 * - 이 클래스는 공공 데이터의 정보를 담고 있으며, 서비스나 DAO 등에서 데이터를 주고받는 데 사용 예를 들어, 데이터베이스로부터 읽어온
 *   공공 데이터를 PublicDataVO 객체로 매핑하여 사용
 */