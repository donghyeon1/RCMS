package donghyeon.rcms.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.review.dao.mapper.ReviewMapper;
import donghyeon.rcms.review.domain.Search;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMapper reviewMapper;

	@Override
	public List<Review> listAll()  {	
		return reviewMapper.listAll();
	}
	
	@Override
	public void create(Review rv)  {
		reviewMapper.create(rv);
	}

	@Override
	public void update(Review rv)  {
		reviewMapper.update(rv);
		
	}

	@Override
	public int delete(int revNum)  {
		return reviewMapper.delete(revNum);
		
	}

	@Override
	public Review read(int revNum){
		return reviewMapper.read(revNum);
	}

	public List<Review> searchReview(Search search){
		switch(search.getSearchOption()){
			case "rev_Title": return reviewMapper.searchReviewTitle(search);
			case "rev_Content": return reviewMapper.searchReviewContent(search);
			case "user_Id": return reviewMapper.searchReviewUserId(search);
			default: return null;
		}
	}
	
	public List<Review> getReviews(Page page){
		return reviewMapper.getReviews(page);
	}
}
