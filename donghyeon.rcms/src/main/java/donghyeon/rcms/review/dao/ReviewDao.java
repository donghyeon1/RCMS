package donghyeon.rcms.review.dao;

import java.util.List;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.review.domain.Search;

public interface ReviewDao {
	public List<Review> listAll();
	public void create(Review rv);
	public void update(Review rv);
	public int delete(int revNum);
	public Review read(int revNum);
	public List<Review> searchReview(Search search);
	public List<Review> getReviews(Page page);
}
