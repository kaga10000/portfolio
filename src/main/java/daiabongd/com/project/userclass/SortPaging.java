package daiabongd.com.project.userclass;

public class SortPaging {
	private int maxNum; 		// 전체 글의 개수
	private int pageNum; 		// 현재 페이지 번호
	private int listCount; //12		// 페이지당 나타낼 글의 갯수
	private int pageCount; //2		// 페이지그룹당 페이지 갯수
	private String Sort; 	// 게시판의 종류
	private String method; // 정렬 기준

	public SortPaging(int maxNum, int pageNum, int listCount, int pageCount, String Sort , String method) {
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCount = listCount;
		this.pageCount = pageCount;
		this.Sort = Sort;
		this.method = method;
		
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
		return makeHtml(currentGroup, totalPage, Sort, method);
	}

	private String makeHtml(int currentGroup, int totalPage, String Sort , String method) {
		StringBuffer sb = new StringBuffer();
		//현재그룹의 시작 페이지 번호
		int start = (currentGroup * pageCount) 
				    - (pageCount - 1);
		//현재그룹의 끝 페이지 번호
		int end = (currentGroup * pageCount >= totalPage)
				? totalPage
				: currentGroup * pageCount;

		if (start != 1) {
			sb.append("<a href='goods_Sort?method="+method+"&Sort="+Sort+"&pageNum=" + (start -1) + "'>");
			sb.append("[이전]");
			sb.append("</a>");
		}

		for (int i = start; i <= end; i++) {
			if (pageNum != i) { //현재 페이지가 아닌 경우 링크처리
				sb.append("<a id='nextpage' href='goods_Sort?method="+method+"&Sort="+Sort+"&pageNum=" + i + "'>");
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
			sb.append("<a href='goods_Sort?method="+method+"&Sort="+Sort+"&pageNum=" + (end + 1) + "'>");
			sb.append("[다음]");
			sb.append("</a>");
		}
		return sb.toString();
	}
}
