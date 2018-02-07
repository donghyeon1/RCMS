package donghyeon.rcms.user.mypage.dao;

import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.User;

@Repository
public interface MyPageDao {
	boolean modifyPw(User user);
	boolean modifyEmail(User user);
	boolean modifyHp(User user);
	
	

}
