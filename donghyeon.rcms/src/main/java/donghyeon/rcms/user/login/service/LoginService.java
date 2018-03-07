package donghyeon.rcms.user.login.service;

import donghyeon.rcms.common.domain.User;

public interface LoginService {
	User getUser(String userId, String userPw);
}
