package edu.neu.nxist.continuingedu.guestbook.service;

import edu.neu.nxist.continuingedu.guestbook.model.*;
import edu.neu.nxist.continuingedu.register.dto.PageBean;
import java.util.List;
public interface GuestbookService {
	public void saveGuestbook(Guestbook book);
	

	public Guestbook findGuestbookById(String CId); 

	public void updateGuestbook(Guestbook book);
	
	public void deleteGuestbook(Guestbook book);

	public PageBean queryGuestbookForPage(int pageSize, int page); 
	
	public PageBean checkGuestbookForPage(int pageSize, int page); 

	public List<Guestbook> listAllGuestbook();

}
