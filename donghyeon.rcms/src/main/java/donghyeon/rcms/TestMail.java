package donghyeon.rcms;

import donghyeon.rcms.user.find.domain.FindInfo;
import donghyeon.rcms.user.find.service.FindServiceImpl;

public class TestMail {
	public static void main(String[] args) {
		FindServiceImpl find=new FindServiceImpl();
		FindInfo fInfo=new FindInfo();
		fInfo.setUserId("user");
		fInfo.setUserEmail("iyoudie@nate.com");
		fInfo.setUserName("사용자");
		
		System.out.println(find.idCheck(fInfo));
	}
}