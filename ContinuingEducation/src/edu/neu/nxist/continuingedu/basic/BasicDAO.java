package edu.neu.nxist.continuingedu.basic;

import java.util.List;

public interface BasicDAO {
	// 声明一些常用的查找方法

	// 添加记录
	public void addRecord(Object obj);

	// 删除记录
	public void deleteRecord(Object obj);

	// 修改记录
	public void updateRecord(Object obj);

	// 显示表中所有记录
	public List listAllRecord(String hql);

	public Object findById(Class clazz, int id);

	public Object findById(Class clazz, String id);

	public int getAllRowCount(String hql);

	// 分页
	public List queryForPage(final String hql, final int offset,
			final int length);

	public void deleteById(String className, String idName, String id);

	public List queryBySql(final String sql);

}