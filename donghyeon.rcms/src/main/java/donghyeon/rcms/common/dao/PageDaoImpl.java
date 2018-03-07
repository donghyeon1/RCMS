package donghyeon.rcms.common.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.dao.mapper.PageMapper;

@Repository
public class PageDaoImpl implements PageDao{
	@Autowired private PageMapper pageMapper;
	
	public int getTotCnt(){
		return pageMapper.getTotRowCnt();
	}
	
	public int getReservationTotRowCnt(){
		return pageMapper.getReservationTotRowCnt();
	}

	public int getQstTotRowCnt(){
		return pageMapper.getQstTotRowCnt();
	}
	
	public int getCarTotRowCnt(){
		return pageMapper.getCarTotRowCnt();
	}
	
	public int getUserTotRowCnt(){
		return pageMapper.getUserTotRowCnt();
	}
}
