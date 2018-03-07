package donghyeon.rcms.user.join.dao;

import java.util.List;

import donghyeon.rcms.common.domain.User;

public interface JoinDao {
	public boolean addUser(User user);
	public List<String> getUserIds();
}
