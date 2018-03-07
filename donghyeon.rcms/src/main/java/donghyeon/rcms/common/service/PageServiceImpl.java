package donghyeon.rcms.common.service;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.dao.PageDao;
import donghyeon.rcms.common.domain.Page;

@Service
public class PageServiceImpl implements PageService{
	@Autowired private PageDao pageDao;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totRowCnt;
	private int pageNumCnt;
	private Page page;
	
	public PageServiceImpl(){}
	public void setPageServiceImpl(int pageNumCnt, Page page){
		this.totRowCnt=getTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page=page;
		init();
	}
	
	public void setReservationPageServiceImpl(int pageNumCnt, Page page){
		this.totRowCnt=pageDao.getReservationTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page=page;
		init();
	}
	
	public void setQstPageServiceImpl(int pageNumCnt, Page page){
		this.totRowCnt=pageDao.getQstTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page=page;
		init();
	}
	
	public void setCarPageServiceImpl(int pageNumCnt, Page page){
		this.totRowCnt=pageDao.getCarTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page=page;
		init();
	}
	public void setUserPageServiceImpl(int pageNumCnt, Page page){
		this.totRowCnt=pageDao.getUserTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page=page;
		init();
	}
	
	private int getTotRowCnt(){
		return pageDao.getTotCnt();
	}
	
	private void init(){
		endPage=(int)(Math.ceil(page.getCurrentPage()/(double)pageNumCnt)*pageNumCnt);
		startPage=(endPage-pageNumCnt)+1;
		int lastEndPage=(int)(Math.ceil(totRowCnt/(double)page.getRowCnt()));
		
		if(endPage > lastEndPage) endPage = lastEndPage;
		
		prev=startPage==1 ? false:true;
		next=endPage*page.getRowCnt() >= totRowCnt?false:true;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public Page getPage() {
		return page;
	}
}
