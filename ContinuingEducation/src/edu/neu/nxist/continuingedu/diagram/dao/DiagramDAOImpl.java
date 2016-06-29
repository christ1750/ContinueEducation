package edu.neu.nxist.continuingedu.diagram.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.basic.BasicDAO;
import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.diagram.model.Diagram;

public class DiagramDAOImpl implements DiagramDAO {
	private BasicDAO myBasicDao;

	public void addDiagram(Diagram gram) {
		// TODO Auto-generated method stub
		this.myBasicDao.addRecord(gram);
	}

	public void deleteDiagram(Diagram gram) {
		// TODO Auto-generated method stub
		this.myBasicDao.deleteRecord(gram);
	}

	public void updateDiagram(Diagram gram) {
		// TODO Auto-generated method stub
		this.myBasicDao.updateRecord(gram);
	}

	public Diagram findDiagramById(String id) {
		// TODO Auto-generated method stub
		return (Diagram)this.myBasicDao.findById(Diagram.class, id);
	}

	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return this.myBasicDao.getAllRowCount(hql);
	}

	public List queryDiagramForPage(String hql, int offset, int length) {
		// TODO Auto-generated method stub
		return this.myBasicDao.queryForPage(hql, offset, length);
	}

	public List listAllDiagram(String hql) {
		return this.myBasicDao.listAllRecord(hql);
	}

	public BasicDAO getmyBasicDao() {
		return myBasicDao;
	}

	public void setmyBasicDao(BasicDAO myBasicDao) {
		this.myBasicDao = myBasicDao;
	}
}