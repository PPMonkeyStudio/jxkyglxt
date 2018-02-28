package com.teacherms.studentinfomanage.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.teacherms.studentinfomanage.dao.StudentDao;
import com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo;

public class StudentDaoImpl implements StudentDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public void test() {
		System.out.println("dao");
	}

	@Override
	public boolean setInfo(Object InfoObject) {
		try {
			getSession().save(InfoObject);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean updateInfo(Object InfoObject) {
		try {
			getSession().update(InfoObject);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Object getInfoById(String tableName, String idName, String idValue) {
		return getSession().createQuery("from " + tableName + " where " + idName + " = ?").setString(0, idValue)
				.uniqueResult();
	}

	@Override
	public boolean deleteInfo(Object obj) {
		try {
			getSession().delete(obj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public StudentInfoAndOtherInfo getStudentOneInfo(String tableName, String iDName, String iDValue,
			String studentIdValue) {
		String hql = "select new com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo(t,u) from " + tableName
				+ " t,StudentInfo u where u.studentId='" + studentIdValue + "' and t." + iDName + " = '" + iDValue
				+ "'";
		System.out.println(hql);
		return (StudentInfoAndOtherInfo) getSession().createQuery(hql).uniqueResult();
		/*
		 * return (StudentInfoAndOtherInfo)
		 * getSession().createCriteria(hql).setString(1, iDName).setString(2,
		 * iDValue) .uniqueResult();
		 */
	}

	@Override
	public List<StudentInfoAndOtherInfo> getStudentAllInfo(String tableName) {
		String hql = "select new com.teacherms.studentinfomanage.vo.StudentInfoAndOtherInfo(t,u) from " + tableName
				+ " t,StudentInfo u where t.studentId=u.studentId";
		return getSession().createQuery(hql).list();
	}
}
