package com.project.user.util;

import java.io.Reader;
import java.io.StringWriter;
import java.sql.Clob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;

import com.project.user.vo.StaticVO;




public class ComUtil {

	/*
	 * 사용용도 : 페이지 세팅을 해준다 ORACLE rownum 기준
	 * return : String
	 * staticCmd staticCmd = setPage(현재갯수,총갯수);
	*/
	public StaticVO setPage(String dbType, int nowPage, int totalCount) {
		StaticVO staticCmd = new StaticVO();

		if ("oracle".equals(dbType)) {
			if (nowPage <= 0)
				nowPage = 1; // 현재 페이지
			int pageCount = (int) (Math.ceil(totalCount/ staticCmd.getPageSize()) + 1);

			if (nowPage > pageCount)
				nowPage = 1; // 현재 페이지

			staticCmd.setNowPage(nowPage);
			staticCmd.setTotalCount(totalCount);

			if (staticCmd.getTotalCount() == 0) {
				staticCmd.setTotalPage(1);
				staticCmd.setFirstRecord(0);
			} else {
				staticCmd.setTotalPage(((staticCmd.getTotalCount() - 1) / staticCmd.getPageSize()) + 1);
				staticCmd.setFirstRecord(staticCmd.getPageSize() * (staticCmd.getNowPage() - 1) );
			}

			if (staticCmd.getFirstRecord() > 0) {
				staticCmd.setLastRecord(staticCmd.getFirstRecord()+ staticCmd.getPageSize() - 1);
			}

		} else if ("mysql".equals(dbType)) {
			if (nowPage <= 0)
				nowPage = 1; // 현재 페이지
			int pageCount = (int) (Math.ceil(totalCount/ staticCmd.getPageSize()) + 1);
			if (nowPage > pageCount)
				nowPage = 1; // 현재 페이지

			staticCmd.setNowPage(nowPage);
			staticCmd.setTotalCount(totalCount);

			if (staticCmd.getTotalCount() == 0) {
				staticCmd.setTotalPage(1);
				staticCmd.setFirstRecord(0);
			} else {
				staticCmd.setTotalPage(((staticCmd.getTotalCount() - 1) / staticCmd.getPageSize()) + 1);
				staticCmd.setFirstRecord(staticCmd.getPageSize()* (staticCmd.getNowPage() - 1));
			}

			if (staticCmd.getFirstRecord() > 0) {
				staticCmd.setLastRecord(staticCmd.getFirstRecord()+ staticCmd.getPageSize() - 1);
			}
		}

		return staticCmd;
	}

	/*
	 * setPage
	 */
	public StaticVO setPage(String dbType, StaticVO staticCmd) {
		int nowPage = staticCmd.getNowPage();
		int totalCount = staticCmd.getTotalCount();
		if ("oracle".equals(dbType)) {
			if (nowPage <= 0)
				nowPage = 1; // 현재 페이지
			int pageCount = (int) (Math.ceil(totalCount/ staticCmd.getPageSize()) + 1);

			if (nowPage > pageCount)
				nowPage = 1; // 현재 페이지

			staticCmd.setNowPage(nowPage);
			staticCmd.setTotalCount(totalCount);

			if (staticCmd.getTotalCount() == 0) {
				staticCmd.setTotalPage(1);
				staticCmd.setFirstRecord(0);
			} else {
				staticCmd.setTotalPage(((staticCmd.getTotalCount() - 1) / staticCmd.getPageSize()) + 1);
				staticCmd.setFirstRecord(staticCmd.getPageSize() * (staticCmd.getNowPage() - 1) + 1);
			}

			if (staticCmd.getFirstRecord() > 0) {
				staticCmd.setLastRecord(staticCmd.getFirstRecord()+ staticCmd.getPageSize() - 1);
			}

		} else if ("mysql".equals(dbType)) {

			if (nowPage <= 0)
				nowPage = 1; // 현재 페이지
			int pageCount = (int) (Math.ceil(totalCount/ staticCmd.getPageSize()) + 1);
			if (nowPage > pageCount)
				nowPage = 1; // 현재 페이지

			staticCmd.setNowPage(nowPage);
			staticCmd.setTotalCount(totalCount);

			if (staticCmd.getTotalCount() == 0) {
				staticCmd.setTotalPage(1);
				staticCmd.setFirstRecord(0);
			} else {
				staticCmd.setTotalPage(((staticCmd.getTotalCount() - 1) / staticCmd.getPageSize()) + 1);
				staticCmd.setFirstRecord(staticCmd.getPageSize()* (staticCmd.getNowPage() - 1));
			}

			if (staticCmd.getFirstRecord() > 0) {
				staticCmd.setLastRecord(staticCmd.getFirstRecord()+ staticCmd.getPageSize() - 1);
			}
		}

		return staticCmd;
	}


	/*
	 * 페이징 처리
	 */
	public static String getPaging(StaticVO staticCmd, String page) {

		String pageingBuffer = "";
		pageingBuffer = "<div class='page_navi'>";

		if (staticCmd.getTotalCount() > 0) {
			int pagenext = ((staticCmd.getNowPage() - 1) / staticCmd.getBlockPage()) * staticCmd.getBlockPage() + 1;

			if (staticCmd.getNowPage() <= 1) {
				pageingBuffer += "<a class='first' href='javascript:void(0)' onclick='nextPage(1)'>처음</a>";
				pageingBuffer += "<a class='prev' href='javascript:void(0)' onclick='nextPage(1)'>이전</a>";
			} else {
				pageingBuffer += "<a class='first' href='javascript:void(0)' onclick='nextPage(1)'>처음</a>";
				pageingBuffer += " <a class='prev' href='javascript:void(0)' onclick='nextPage("+ (staticCmd.getNowPage() - 1)+ ")'>이전</a>";
			}
			int nowPageloop = 1;
			pageingBuffer += "<span>";
			while (!(nowPageloop > staticCmd.getBlockPage() || pagenext > staticCmd.getTotalPage())) {
				if (pagenext == staticCmd.getNowPage()) {
					pageingBuffer += "<a href='javascript:void(0)' onclick='nextPage("+ pagenext + ")' ><strong>" + pagenext + "</strong></a>";
				} else {
					pageingBuffer += "<a href='javascript:void(0)' onclick='nextPage("+ pagenext + ")' >" + pagenext + "</a>";
				}
				pagenext++;
				nowPageloop++;
			}
			pageingBuffer += "</span>";
		}
		if (staticCmd.getNowPage() >= staticCmd.getTotalPage()) {
			pageingBuffer += "<a class='next' href='javascript:void(0)' onclick='nextPage("+ (staticCmd.getNowPage()) + ")'>다음</a>";
			pageingBuffer += "<a class='last' href='javascript:void(0)' onclick='nextPage("+ (staticCmd.getNowPage()) + ")'>마지막</a>";
		} else {
			pageingBuffer += "<a class='next' href='javascript:void(0)' onclick='nextPage("+ (staticCmd.getNowPage() + 1)+ ")'>다음</a>";
			if(staticCmd.getTotalCount()%10 != 0){
				pageingBuffer += "<a class='last' href='javascript:void(0)' onclick='nextPage("+ ((int) Math.ceil(staticCmd.getTotalCount()/ staticCmd.getPageSize()) + 1) + ")'>마지막</a>";
			}else{
				pageingBuffer += "<a class='last' href='javascript:void(0)' onclick='nextPage("+ ((int) Math.ceil(staticCmd.getTotalCount()/ staticCmd.getPageSize())) + ")'>마지막</a>";
			}
		}
		pageingBuffer += "</div>";
		return pageingBuffer;
	}

	/*
	 * 문자열 처리
	 */

	/*
	 * Object To String 변환
	 */
	public String getStr(Object obj) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		return str;
	}
	/*
	 * Object To String 변환
	 */
	public String getStr(Object obj, String deStr) {
		String str = "";
		if (obj == null) {
			str = deStr;
		} else {
			if (((String) obj).length() == 0) {
				str = deStr;
			}else {
				str = String.valueOf(obj).trim();
			}
		}
		return str;
	}
	/*
	 * Object To String 변환
	 */
	public String getStr(String str) {
		if (str == null) {
			str = "";
		}
		return str.trim();
	}
	/*
	 * Object To String 변환
	 */
	public String getStr(String str, String deStr) {
		if (str == null || "".equals(str)) {
			str = deStr;
		}
		return str.trim();
	}

	/*
	 * Object To Integer
	 */
	public Integer getInt(Object obj) {
		int num = 0;

		//임수현 20161006 if문에 obj == "" 추가
		if (obj == null || obj == "") {
			num = 0;
		} else {
			num = Integer.parseInt(obj.toString());
		}
		return num;
	}
	/*
	 * Object To Integer
	 */
	public Integer getInt(String str) {
		int num = 0;
		if ("".equals(getStr(str))) {
			num = 0;
		} else {
			num = Integer.parseInt(str);
		}
		return num;
	}
	/*
	 * Object To Integer
	 */
	public Integer getInt(Object obj,int deNum) {
		int num = 0;
		if (obj == null) {
			num = deNum;
		} else {
			if(obj.toString() == ""){
				obj = "0";
			}
			num = Integer.parseInt(obj.toString());
		}
		return num;
	}
	/*
	 * Object To Integer
	 */
	public Integer getInt(String str,int deNum) {
		int num = 0;
		if ("".equals(getStr(str))) {
			num = deNum;
		} else {
			num = Integer.parseInt(str);
		}
		return num;
	}

	/*
	 * Float 변환
	 */
	public Float getFloat(Object obj) {
		return obj == null || "".equals(obj.toString()) ? 0.0f : Float.parseFloat(obj.toString());
	}
	public Float getFloat(String str) {
		return "".equals(getStr(str)) ? 0.0f : Float.parseFloat(str);
	}

	/*
	 * String > TEXTAREA
	 */
	public String enText(String str) {
		if (str == null) {
			str = "";
		}
		return str.trim().replaceAll("&", "&amp;").replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;").replaceAll("\n", "<br/>");
	}
	/*
	 * String > TEXTAREA
	 */
	public String enText(Object obj) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		return str.trim().replaceAll("&", "&amp;").replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;").replaceAll("\n", "<br/>");
	}
	/*
	 * String > TEXTAREA
	 */
	public String enText(String str, String deStr) {
		if (str == null || "".equals(str)) {
			str = deStr;
		}
		return str.trim().replaceAll("&", "&amp;").replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;").replaceAll("\n", "<br/>");
	}
	/*
	 * String > TEXTAREA
	 */
	public String enText(Object obj, String deStr) {
		String str = "";
		if (obj == null) {
			str = deStr;
		} else {
			str = String.valueOf(obj).trim();
		}
		return str.trim().replaceAll("&", "&amp;").replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;").replaceAll("\n", "<br/>");
	}
	/*
	 * TEXTAREA > String
	 */
	public String deText(String str) {
		if (str == null) {
			str = "";
		}

		return str.trim().replaceAll("<br/>", "\n").replaceAll("&nbsp;", " ").replaceAll("&gt;", ">").replaceAll("&lt;", "<").replaceAll("&#34;", "\"").replaceAll("&#39;", "'").replaceAll("&", "&amp;");
	}
	/*
	 * TEXTAREA > String
	 */
	public String deText(Object obj) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		return str.trim().replaceAll("<br/>", "\n").replaceAll("&nbsp;", " ").replaceAll("&gt;", ">").replaceAll("&lt;", "<").replaceAll("&#34;", "\"").replaceAll("&#39;", "'").replaceAll("&", "&amp;");
	}
	/*
	 * TEXTAREA > String
	 */
	public String deText(String str, String deStr) {
		if (str == null || "".equals(str)) {
			str = deStr;
		}
		return str.trim().replaceAll("<br/>", "\n").replaceAll("&nbsp;", " ").replaceAll("&gt;", ">").replaceAll("&lt;", "<").replaceAll("&#34;", "\"").replaceAll("&#39;", "'").replaceAll("&", "&amp;");
	}
	/*
	 * TEXTAREA > String
	 */
	public String deText(Object obj, String deStr) {
		String str = "";
		if (obj == null) {
			str = deStr;
		} else {
			str = String.valueOf(obj).trim();
		}
		return str.trim().replaceAll("<br/>", "\n").replaceAll("&nbsp;", " ").replaceAll("&gt;", ">").replaceAll("&lt;", "<").replaceAll("&#34;", "\"").replaceAll("&#39;", "'").replaceAll("&", "&amp;");
	}
	/*
	 * String > HTML
	 */
	public String enHtml(String str) {
		if (str == null) {
			str = "";
		}
		str = str.trim().replaceAll("&#39;", "'").replaceAll("&#34;", "\"").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		str = str.replaceAll("<br>", "<br/>");

		return str;
	}
	/*
	 * String > HTML
	 */
	public String enHtml(Object obj) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		str = str.replaceAll("&#39;", "'").replaceAll("&#34;", "\"").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}
	/*
	 * String > HTML
	 */
	public String enHtml(String str, String deStr) {
		if (str == null || "".equals(str)) {
			str = deStr;
		}
		str = str.trim().replaceAll("&#39;", "'").replaceAll("&#34;", "\"").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}
	/*
	 * String > HTML
	 */
	public String enHtml(Object obj, String deStr) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		str = str.replaceAll("&#39;", "'").replaceAll("&#34;", "\"").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}


	/*
	 * String > HTML
	 */
	public String deHtml(String str) {
		if (str == null) {
			str = "";
		}
		str = str.trim().replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}
	/*
	 * String > HTML
	 */
	public String deHtml(Object obj) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		str = str.replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}
	/*
	 * String > HTML
	 */
	public String deHtml(String str, String deStr) {
		if (str == null || "".equals(str)) {
			str = deStr;
		}
		str = str.trim().replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}
	/*
	 * String > HTML
	 */
	public String deHtml(Object obj, String deStr) {
		String str = "";
		if (obj == null) {
			str = "";
		} else {
			str = String.valueOf(obj).trim();
		}
		str = str.replaceAll("'", "&#39;").replaceAll("\"", "&#34;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		str = str.replaceAll("<br>", "<br/>").replaceAll("\r\n", "\n").replaceAll("\n", "\r\n");

		return str;
	}

	/*
	 * Clob을 String 변환 오라클 사용
	 */
	public String getClob(Clob clob) {
		String result = "";
		try {
			if (clob != null) {
				Reader rdrClob = clob.getCharacterStream();

				StringWriter strwtrClob = new StringWriter();
				int intClob = -1;

				while ((intClob = rdrClob.read()) != -1) {
					strwtrClob.write(intClob);
				}

				result = strwtrClob.toString();
			} else {
				result = "";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/*
	 * 사용용도 : 마지막 URL 페이지명 리턴받기
	 * return : String
	 * < %=getUrlPage(getStr(request.getRequestURL()))."")% >
	 */
	public String getUrlPage(String url) {
		String str = "";
		if (url != "") {
			if (url.indexOf("/") >= 0) {
				String[] arrurl = url.split("/");
				// str = arrurl[arrurl.length-1];
				str = arrurl[arrurl.length - 1];
			}
		}
		return str;
	}
	/*
	 *
	 * OJBECT > MAP
	 */
	public HashMap<String,Object> getMap(Object obj) {
		HashMap<String,Object> map = new HashMap<>();
		if (obj == null) {
			map = new HashMap<>();
		}else{
			map = (HashMap<String,Object>)obj;

		}
		return map;
	}
	/**
	 * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
	 *
	 * @param
	 * @return Timestamp 값
	 * @exception MyException
	 * @see
	 */
	public static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		rtnStr = sdfCurrent.format(ts.getTime());

		return rtnStr;
	}
}