package com.board.domain;

public class Page {

	// 현재 페이지 번호
	private int num;

	// 게시물 총 갯수
	private int count;

	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 10;

	// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
	private int pageNum;

	// 출력할 게시물
	private int displayPost;

	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 10;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;

	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;

	
	public void setNum(int num) {
		 this.num = num;
		}

		public void setCount(int count) {
		 this.count = count;
		 dataCalc();
		}

		public int getCount() {
		 return count;
		}

		public int getPostNum() {
		 return postNum;
		}

		public int getPageNum() {
		 return pageNum;
		}

		public int getDisplayPost() {
		 return displayPost;
		}

		public int getPageNumCnt() {
		 return pageNumCnt;
		}

		public int getEndPageNum() {
		 return endPageNum;
		}

		public int getStartPageNum() {
		 return startPageNum;
		}

		public boolean getPrev() {
		 return prev;
		} 

		public boolean getNext() {
		 return next;
		}
	private void dataCalc() {
		//num은 페이지번호
		displayPost =(num-1)*postNum;
		
		// 표시되는 페이지 번호 중 마지막 번호
		endPageNum=(int)(Math.ceil((double)num/(double)pageNumCnt)*pageNumCnt);
		// 표시되는 페이지 번호 중 첫 번째 번호
		startPageNum=endPageNum-(pageNumCnt-1);
		//마지막 번호 재계산
		//위의 페이지로하면 빈 페이지 번호들이 생기므로 마지막 게시물을 기준으로 마지막 페이지번호를 구해준다.
		int endPageNum_tmp=(int)(Math.ceil((double)count/(double)pageNumCnt));
		if(endPageNum>endPageNum_tmp) {
			endPageNum=endPageNum_tmp;
		}
		//이전 다음조건
		//시작페이지가 1이면 표시안되고 1이외에는 표시된다
		prev=startPageNum==1?false:true;
		//넥스트페이지번호가 총 게시물 갯수보다 작으면 표시
		next=endPageNum*pageNumCnt>=count?false:true;
		
		
	}
	//검색 타입과 검색어
	/*

	 * 	private String searchTypeKeyword;
	 * public void setSearchTypeKeyword(String searchType, String keyword) {
	 * 
	 * if(searchType.equals("") || keyword.equals("")) { searchTypeKeyword = ""; }
	 * else { searchTypeKeyword = "&searchType=" + searchType + "&keyword=" +
	 * keyword; } }
	 * 
	 * public String getSearchTypeKeyword() { return searchTypeKeyword; }
	 */

	public String getSearchTypeKeyword() {
		 
		 if(searchType.equals("") || keyword.equals("")) {
		  return ""; 
		 } else {
		  return "&searchType=" + searchType + "&keyword=" + keyword; 
		 }
		}

		private String searchType;
		private String keyword; 

		public void setSearchType(String searchType) {
		 this.searchType = searchType;  
		}

		public String getSearchType() {
		 return searchType;
		} 

		public void setKeyword(String keyword) {
		 this.keyword = keyword;  
		} 

		public String getKeyword() {
		 return keyword;
		}
}
