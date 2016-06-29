package edu.neu.nxist.continuingedu.guestbook.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.guestbook.model.*;

public interface GuestbookDAO {
	public void addGuestbook(Guestbook book);

	public void deleteGuestbook(Guestbook book);

	public void updateGuestbook(Guestbook book);

	public Guestbook findGuestbookById(String CId);

	public List listAllGuestbook(String hql);

	public List queryGuestbookForPage(final String hql, final int offset,
			final int length);
	
	public List checkGuestbookForPage(final String hql, final int offset,
			final int length);

	public int getAllRowCount(String hql);
}