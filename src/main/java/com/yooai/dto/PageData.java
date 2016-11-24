package com.yooai.dto;

import java.util.List;
/**
 * 分页封装类
 * @author asusasus
 *
 * @param <T>
 */
public class PageData<T> {
	private List<T> pageData;
	private int pageNo;
	private int pageSize;
	private int total;
	public PageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PageData(List<T> pageData, int pageNo, int pageSize, int total) {
		super();
		this.pageData = pageData;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.total = total;
	}

	public List<T> getData() {
		return pageData;
	}
	public void setData(List<T> data) {
		this.pageData = data;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	/**
	 * 下一页
	 * @return
	 */
	public int nextPage(){
		if(pageNo==total){
			return getTotal();
		}
		return pageNo+1;
	}
	/**
	 * 下一页
	 * @return
	 */
	public int prePage(){
		if(pageNo==0){
			return 0;
		}
		return pageNo-1;
	}
	
	@Override
	public String toString() {
		return "PageData [data=" + pageData + ", pageNo=" + pageNo + ", pageSize="
				+ pageSize + ", total=" + total + "]";
	}
	
}
