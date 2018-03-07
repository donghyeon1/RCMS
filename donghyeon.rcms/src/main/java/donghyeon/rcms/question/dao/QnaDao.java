package donghyeon.rcms.question.dao;

import java.util.List;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Question;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.question.domain.Qsearch;
import donghyeon.rcms.review.domain.Search;

public interface QnaDao {
	public List<Question> getQuestions(Page page);
	List<Question>getUsers();
	public int create(Question qa);
	public Question writeInfo(int qstNum);
	public void update(Question qa);
	public int delete(int qstNum);
	public int writeGetCount();
	public int updateAnswer(Question qst);
	public List<Question> searchQuestion(Qsearch qsearch);
}
