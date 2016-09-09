package com.sosee.base.dao;

import java.io.Serializable;
import java.text.MessageFormat;

/**
 * Page is not a domain object but is used to store and fetch page information.
 * 
 * @author outworld date 2009-06-02
 * @param <T>
 *            Domain type.
 */
public class Page implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6040830773660944505L;

	public static final int DEFAULT_PAGE_SIZE = 20;

	private int pageIndex;
	private int pageSize;
	private int totalCount;
	private int pageCount;

	/**
	 * 
	 */
	public Page() {
		this(1);
	}

	public Page(int pageIndex) {
		this(pageIndex, DEFAULT_PAGE_SIZE);
	}

	public Page(int pageIndex, int pageSize) {
		if (pageSize < 1)
			pageSize = 1;
		if (pageIndex < 1)
			pageIndex = 1;
		if (pageIndex > pageSize)
			pageIndex = pageSize;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getFirstResult() {
		return (pageIndex - 1) * pageSize;
	}

	public boolean getHasPrevious() {
		return pageIndex > 1;
	}

	public boolean getHasNext() {
		return pageIndex < pageCount;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);
		// adjust pageIndex:
		if (totalCount == 0) {
			if (pageIndex != 1)
				throw new IndexOutOfBoundsException("Page index out of range.");
		} else {
			if (pageIndex > pageCount)
				throw new IndexOutOfBoundsException("Page index out of range.");
		}
	}

	public boolean isEmpty() {
		return totalCount == 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Page[pageIndex:" + this.pageIndex + ",pageCount:" + this.pageCount + ",pageSize:" + this.pageSize + "]";
	}

	public String getPageBar() {
		String js = "<a href=\"javascript:goPage({0})\">{1}</a>";
		StringBuffer pageBar = new StringBuffer();
		if (pageIndex > 1)
		{
			pageBar.append(MessageFormat.format(js, new Object[] { 1, "<font color=blue>首页</font>" }));
			pageBar.append(" | ");
			pageBar.append(MessageFormat.format(js, new Object[] { pageIndex-1, "<font color=blue>前页</font>" }));
		}
		else
		{
			pageBar.append("首页");
			pageBar.append(" | 前页");
		}
		if (pageIndex < pageCount)
		{
			pageBar.append(" | ");
			pageBar.append(MessageFormat.format(js, new Object[] { pageIndex+1, "<font color=blue>后页</font>" }));
			pageBar.append(" | ");
			pageBar.append(MessageFormat.format(js, new Object[] { pageCount, "<font color=blue>尾页</font>" }));
		}
		else
		{
			pageBar.append(" | 后页");
			pageBar.append(" | 尾页");
		}
		pageBar.append(" 第").append(pageIndex).append("/").append(pageCount).append("页");
		pageBar.append(" 总记录数：").append(totalCount);
		return pageBar.toString();
	}

	public static void main(String[] args) {
//		String js = "<a href=\"javascript:goPage({0})\">{1}</a>";
//		String format = MessageFormat.format(js, new Object[] { 2, "首页" });
//		System.out.println(format);
		Page page =new Page();
		page.setPageIndex(2);
		System.out.println(page.getPageBar());
	}
}
