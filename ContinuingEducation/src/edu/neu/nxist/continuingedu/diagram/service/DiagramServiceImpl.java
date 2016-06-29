package edu.neu.nxist.continuingedu.diagram.service;

import java.util.Iterator;
import java.util.List;

import edu.neu.nxist.continuingedu.courseware.dao.CoursewareDAO;
import edu.neu.nxist.continuingedu.diagram.dao.DiagramDAO;
import edu.neu.nxist.continuingedu.diagram.model.Diagram;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public class DiagramServiceImpl implements DiagramService{
	private DiagramDAO diagramDao;
	public Diagram findDiagramById(String id)
	{
		return this.diagramDao.findDiagramById(id);
	}
	
	public void updateDiagram(Diagram gram)
	{
		this.diagramDao.updateDiagram(gram);
	}
	
	public PageBean queryDiagramForPage(int pageSize, int page)
	{
		String hql = "from Diagram order by id asc";
		
		int allRow = diagramDao.getAllRowCount(hql);// 
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//
		final int offset = PageBean.countOffset(pageSize, page);//
		final int length = pageSize;// 
		final int currentPage = PageBean.countCurrentPage(page,totalPage);
		List list = diagramDao.queryDiagramForPage(hql, offset, length);// 

		//
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		Iterator it = pageBean.getList().iterator();
		while (it.hasNext()) {
			System.out.println("***********************" + it.next().toString());
		}
		pageBean.init();
		return pageBean;
		
	}
	public DiagramDAO getDiagramDao() {
		return diagramDao;
	}

	public void setDiagramDao(DiagramDAO diagramDao) {
		this.diagramDao = diagramDao;
	}
}
