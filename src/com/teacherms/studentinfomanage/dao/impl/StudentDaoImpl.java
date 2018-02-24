package com.teacherms.studentinfomanage.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.teacherms.studentinfomanage.dao.StudentDao;

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
}
