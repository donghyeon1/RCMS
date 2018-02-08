package donghyeon.rcms.user.mypage.service;

import donghyeon.rcms.common.domain.User;

public interface MyPageService {
	boolean modifyPw(User user);
	boolean modifyEmail(User user);
	boolean modifyHp(User user);
	boolean secedeUser(String userId);
	
}
