package edu.neu.nxist.continuingedu.newsandnotice.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.newsandnotice.model.NewsAndNotice;

public interface NewsAndNoticeDAO {
	public void addNewsAndNotice(NewsAndNotice news);

	public void deleteNewsAndNotice(NewsAndNotice news);

	public void updateNewsAndNotice(NewsAndNotice news);

	public NewsAndNotice findNewsAndNoticeById(String id);

	public List listAllNewsAndNotice(String hql);

	public List queryNewsForPage(final String hql, final int offset,
			final int length);

	public int getAllRowCount(String hql);
}