package donghyeon.rcms.user.find.dao;

import java.util.List;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.find.domain.FindInfo;

public interface FindDao {
	public List<User> getUserInfos();
	public User getUserId(FindInfo fInfo);
	public User getUserPw(FindInfo fInfo);
}
