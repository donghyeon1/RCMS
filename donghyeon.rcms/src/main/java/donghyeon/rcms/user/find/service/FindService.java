package donghyeon.rcms.user.find.service;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.find.domain.FindInfo;

public interface FindService {
	public User idCheck(FindInfo fInfo);
	public User pwCheck(FindInfo fInfo);
}
