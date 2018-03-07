package donghyeon.rcms.user.join.service;

import donghyeon.rcms.user.join.domain.UserForm;

public interface JoinService {
	public boolean doubleCheck(String userId);
	public String signupCheck(UserForm uForm);
}
