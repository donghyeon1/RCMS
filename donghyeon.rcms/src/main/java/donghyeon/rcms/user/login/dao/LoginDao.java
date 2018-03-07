package donghyeon.rcms.user.login.dao;

import donghyeon.rcms.common.domain.User;

public interface LoginDao {
	User getUser(String userId);
}
