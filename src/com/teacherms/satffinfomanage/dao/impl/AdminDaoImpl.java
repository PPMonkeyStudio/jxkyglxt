package com.teacherms.satffinfomanage.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.teacherms.all.domain.*;
import com.teacherms.satffinfomanage.dao.AdminDao;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;

public class AdminDaoImpl implements AdminDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Long getInformationCount(String tableName, String status) {
		String hql = "select count(*) from " + tableName + " where dataStatus= '" + status + "'";
		return (Long) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public List<Object> getAllStatusInfo(String table, String time, String status, String collegeName) {
		String hql = "select t,u from " + table
				+ " t,User u,Department d where u.userId=t.userId and u.departmentId=d.departmentId and d.departmentName='"
				+ collegeName + "' and t.dataStatus = '" + status + "'" + time;
		System.out.println(hql);
		return getSession().createQuery(hql).list();
	}

	@Override
	public User getUserById(String UserID) {
		String hql = "from User where userId = '" + UserID + "'";
		return (User) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public TableInfoAndUserVo getInfoById(String tableName, String IdName, String tableId) {
		String hql = "select new com.teacherms.satffinfomanage.vo.TableInfoAndUserVo(t,u) from " + tableName
				+ " t,User u where t.userId=u.userId and t." + IdName + " = '" + tableId + "'";
		return (TableInfoAndUserVo) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public Object getAInfomationByTableId(String tableName, String tableInfoIdName, String string) {
		String hql = " from " + tableName + " where " + tableInfoIdName + " = '" + string + "'";
		System.out.println(hql);
		return getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public boolean updateInfo(Object obj) {
		boolean flag = true;
		try {
			getSession().saveOrUpdate(obj);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Department getDepartmentById(String departmentId) {
		String hql = " from Department where departmentId = " + departmentId;
		return (Department) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public String addInfo(Object obj) {
		System.out.println(obj.toString());
		return getSession().save(obj).toString();
	}

}
