package donghyeon.rcms.question.service;

import java.util.List;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Question;
import donghyeon.rcms.question.domain.Qsearch;

public interface QnaService {
	public List<Question> getQuestions(Page page);
	List<Question>qnalists();
	public int creates(Question qa);
	public Question writeInfo(int qstNum);
	public void fixupdate(Question qa);
	public boolean secede(int qstNum);
	//List<Question>qnalists(int offset, int noOfRecords)throws Exception;
	public int writeGetCount();
	public int updateAnswer(Question qst);
	public List<Question> searchQuestion(Qsearch qsearch);
}
