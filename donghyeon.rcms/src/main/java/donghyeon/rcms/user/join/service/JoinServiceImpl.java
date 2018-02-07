package donghyeon.rcms.user.join.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.join.dao.JoinDao;
import donghyeon.rcms.user.join.domain.UserForm;

@Service
public class JoinServiceImpl implements JoinService{
	@Autowired private JoinDao joinDao;
	
	public boolean doubleCheck(String userId){
		List<String> userIds = joinDao.getUserIds();
		//아이디 중복확인
		for(String id:userIds){
			if(id.equals(userId)) return false;
		}
		return true;
	}
	
	public String signupCheck(UserForm uForm){
		//폼의 입력란이 빈칸이 하나도없고
		if(uForm.getUserI()!=null || uForm.getUserPw() != null ||
		   uForm.getUserPwCheck() != null || uForm.getUserName() != null ||
		   uForm.getUserHp2() != null || uForm.getUserHp3() != null ||
		   uForm.getUserEmail() != null){
			//비번과 비번확인란이 같고
			if(uForm.getUserPw().equals(uForm.getUserPwCheck())){
				//비번이 8자리 이상이면 
				if(uForm.getUserPw().length()>=8){
					String userHp=uForm.getUserHp1()+"-"+uForm.getUserHp2()+"-"+uForm.getUserHp3();
					User user=new User();
					user.setUserId(uForm.getUserI());
					user.setUserPw(uForm.getUserPw());
					user.setUserName(uForm.getUserName());
					user.setUserHp(userHp);
					user.setUserEmail(uForm.getUserEmail());
					joinDao.addUser(user);
					return "success";
				}else{
					return "pw8";
				}
			}else{
				return "pw";
			}
		}
		return "empty";
	}
}
