package edu.neu.nxist.continuingedu.basic;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BasicDAOImpl extends HibernateDaoSupport implements BasicDAO {

	// -----------------------------------------------------------------------
	public void addRecord(Object obj) {
		this.getHibernateTemplate().save(obj);
		// TODO Auto-generated method stub
	}

	public void deleteRecord(Object obj) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(obj);
	}

	public void deleteById(String className, String idName, String id) {
		// TODO Auto-generated method stub
		String query = "from " + className + " where " + idName + " = " + id;
		List list = this.listAllRecord(query);// 这个方法存在对空表查询错误的bug
		// String deleteHql = "from "+className +
		// " where "+idName+"id"+" = "+id;
		// System.out.println(deleteHql);
		if (list != null)
			this.getHibernateTemplate().deleteAll(list);
		else
			System.out.println("list is null in deleteById!");
	}

	public void updateRecord(Object obj) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(obj);
	}

	@SuppressWarnings("unchecked")
	public Object findById(Class clazz, int id) {
		// TODO Auto-generated method stub
		Object test = null;
		try {
			test = (Object) getHibernateTemplate().get(clazz, id);
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
		return test;
	}

	@SuppressWarnings("unchecked")
	public Object findById(Class clazz, String id) {
		// TODO Auto-generated method stub
		Object test = null;
		try {
			test = (Object) getHibernateTemplate().get(clazz, id);
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
		return test;
		// return (Object)this.getHibernateTemplate().get(Object.class,id);
	}

	public List listAllRecord(String hql) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find(hql);
	}

	// 分页
	public int getAllRowCount(String hql) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().find(hql).size();
	}

	public List queryForPage(final String hql, final int offset,
			final int length) {
		// TODO Auto-generated method stub
		List list = null;
		try{try {
			list = getHibernateTemplate().executeFind(new HibernateCallback() {
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createQuery(hql);
					query.setFirstResult(offset);
					query.setMaxResults(length);
					List list = query.list();
					return list;
				}
			});
		} catch (RuntimeException re) {
			re.printStackTrace();
		}}catch(Exception e){System.out.println("BasicDao异常");}
		return list;
	}

	public List queryBySql(final String sql) {
		return this.getHibernateTemplate().find(sql);
	}

}
