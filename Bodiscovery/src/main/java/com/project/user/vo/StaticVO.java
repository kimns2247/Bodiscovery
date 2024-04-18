package com.project.user.vo;

import java.io.Serializable;

/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


public class StaticVO implements Serializable {


	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	private static int pageSize		= 10;					//글 보여줄 갯수
	private static int blockPage    = 10;					//페이지수
	private int nowPage			    =	1;						//현재 페이지
	private int totalCount			= 0;						// 총 레코드 수
	private int firstRecord			= 0;						//처음 데이터
	private int lastRecord			= 20;					//마지막 테이터
	private int totalPage			= 0;						//블럭 마지막 체크

	public int getPageSize() {
		return pageSize;
	}

	@SuppressWarnings("static-access")
	public void setPageSize(int pageSize) {
		StaticVO.pageSize = pageSize;
	}

	public int getBlockPage() {
		return blockPage;
	}

	@SuppressWarnings("static-access")
	public void setBlockPage(int blockPage) {
		StaticVO.blockPage = blockPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getFirstRecord() {
		return firstRecord;
	}

	public void setFirstRecord(int firstRecord) {
		this.firstRecord = firstRecord;
	}

	public int getLastRecord() {
		return lastRecord;
	}

	public void setLastRecord(int lastRecord) {
		this.lastRecord = lastRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
