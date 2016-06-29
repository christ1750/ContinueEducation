package edu.neu.nxist.continuingedu.diagram.dao;

import java.util.List;

import edu.neu.nxist.continuingedu.courseware.model.Courseware;
import edu.neu.nxist.continuingedu.diagram.model.Diagram;

public interface DiagramDAO {
	public void addDiagram(Diagram gram);

	public void deleteDiagram(Diagram gram);

	public void updateDiagram(Diagram gram);

	public Diagram findDiagramById(String id);

	public List listAllDiagram(String hql);

	public List queryDiagramForPage(final String hql, final int offset,
			final int length);

	public int getAllRowCount(String hql);
}