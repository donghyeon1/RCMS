package donghyeon.rcms.question.domain;

public class Qsearch {
	
	private String qsearchOption;
	private String qkeyword;
	
	public Qsearch(){}
	public Qsearch(String qsearchOption, String qkeyword) {
		super();
		this.qsearchOption = qsearchOption;
		this.qkeyword = qkeyword;
	}
	
	public String getQsearchOption() {
		return qsearchOption;
	}
	public void setQsearchOption(String qsearchOption) {
		this.qsearchOption = qsearchOption;
	}
	public String getQkeyword() {
		return qkeyword;
	}
	public void setQkeyword(String qkeyword) {
		this.qkeyword = qkeyword;
	}
	@Override
	public String toString() {
		return "Qsearch [qsearchOption=" + qsearchOption + ", qkeyword=" + qkeyword
				+ "]";
	}
}

