package donghyeon.rcms.review.domain;

public class Search {
	private String searchOption;
	private String keyword;
	
	public Search(){}
	public Search(String searchOption, String keyword) {
		super();
		this.searchOption = searchOption;
		this.keyword = keyword;
	}
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "Search [searchOption=" + searchOption + ", keyword=" + keyword
				+ "]";
	}
}
