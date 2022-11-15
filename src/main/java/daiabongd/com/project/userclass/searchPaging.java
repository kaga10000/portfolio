package daiabongd.com.project.userclass;

import java.util.HashMap;

public class searchPaging {
	private int maxNum; 		// 전체 글의 개수
	private int pageNum; 		// 현재 페이지 번호
	private int listCount; //12		// 페이지당 나타낼 글의 갯수
	private int pageCount; //2		// 페이지그룹당 페이지 갯수
	private String refineUrl; 	// 게시판의 종류
	private HashMap<String, String> search_value;

	public searchPaging(int maxNum, int pageNum, int listCount, int pageCount, HashMap<String, String> search_value) {
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.search_value = search_value;
		
	}

	@SuppressWarnings("unused")
	public String makeHtmlPaging() {
		// 전체 페이지 갯수
		int totalPage = (maxNum % listCount > 0)
				?maxNum/listCount+1 : maxNum/listCount;
		// 전체 페이지 그룹 갯수
		int totalGroup = (totalPage % pageCount > 0)
				? totalPage/pageCount+1 : totalPage/pageCount;
		// 현재 페이지가 속해 있는 그룹 번호
		int currentGroup = (pageNum % pageCount > 0)
				? pageNum/pageCount+1 : pageNum/pageCount;
		return makeHtml(currentGroup, totalPage, search_value);
	}

	private String makeHtml(int currentGroup, int totalPage, HashMap<String, String> search_value) {
		StringBuffer sb = new StringBuffer();
		//현재그룹의 시작 페이지 번호
		int start = (currentGroup * pageCount) 
				    - (pageCount - 1);
		//현재그룹의 끝 페이지 번호
		int end = (currentGroup * pageCount >= totalPage)
				? totalPage
				: currentGroup * pageCount;

		if (start != 1) {
			sb.append("<a href='searchForm?search_goods="+search_value.get("search_goods")+"&search_type="+search_value.get("search_type")+"&search_name="+search_value.get("search_name")+"&search_money_1="+search_value.get("search_money_1")+"&search_money_2="+search_value.get("search_money_2")+"&search_order="+search_value.get("search_order")+"&pageNum=" + (start -1) + "'>");
			sb.append("[이전]");
			sb.append("</a>");
		}

		for (int i = start; i <= end; i++) {
			if (pageNum != i) { //현재 페이지가 아닌 경우 링크처리
				sb.append("<a id='nextpage' href='searchForm?search_goods="+search_value.get("search_goods")+"&search_type="+search_value.get("search_type")+"&search_name="+search_value.get("search_name")+"&search_money_1="+search_value.get("search_money_1")+"&search_money_2="+search_value.get("search_money_2")+"&search_order="+search_value.get("search_order")+"&pageNum=" + i + "'>");
				sb.append(" [ ");
				sb.append(i);
				sb.append(" ] ");
				sb.append("</a>");
			} else { //현재 페이지인 경우 링크 해제
				sb.append("<font id='realpage'style='color:red;'>");
				sb.append(" [ ");
				sb.append(i);
				sb.append(" ] ");
				sb.append("</font>");
			}
		}
		if (end != totalPage) {
			sb.append("<a href='searchForm?search_goods="+search_value.get("search_goods")+"&search_type="+search_value.get("search_type")+"&search_name="+search_value.get("search_name")+"&search_money_1="+search_value.get("search_money_1")+"&search_money_2="+search_value.get("search_money_2")+"&search_order="+search_value.get("search_order")+"&pageNum=" + (end + 1) + "'>");
			sb.append("[다음]");
			sb.append("</a>");
		}
		return sb.toString();
	}
}
