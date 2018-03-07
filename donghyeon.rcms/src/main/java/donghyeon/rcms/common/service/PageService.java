package donghyeon.rcms.common.service;

import donghyeon.rcms.common.domain.Page;

public interface PageService {
	Page getPage();
	boolean isPrev();
	boolean isNext();
	int getStartPage();
	int getEndPage();
	public void setPageServiceImpl(int pageNumCnt, Page page);
	public void setReservationPageServiceImpl(int pageNumCnt, Page page);
	public void setQstPageServiceImpl(int pageNumCnt, Page page);
	public void setCarPageServiceImpl(int pageNumCnt, Page page);
	public void setUserPageServiceImpl(int pageNumCnt, Page page);
}
