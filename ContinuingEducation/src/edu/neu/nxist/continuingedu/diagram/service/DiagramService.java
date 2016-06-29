package edu.neu.nxist.continuingedu.diagram.service;


import edu.neu.nxist.continuingedu.diagram.model.Diagram;
import edu.neu.nxist.continuingedu.register.dto.PageBean;

public interface DiagramService {

	public Diagram findDiagramById(String id);

	public void updateDiagram(Diagram gram);

	public PageBean queryDiagramForPage(int pageSize, int page);
}
