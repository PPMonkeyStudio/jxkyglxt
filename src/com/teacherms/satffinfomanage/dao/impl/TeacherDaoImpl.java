package com.teacherms.satffinfomanage.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.teacherms.all.domain.TeacherInfo;
import com.teacherms.all.domain.User;
import com.teacherms.satffinfomanage.dao.TeacherDao;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;

@SuppressWarnings("unchecked")
public class TeacherDaoImpl implements TeacherDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public List<Object> getTableInfo(String time_interval, String tableName, String tableUserIds, String userid,
			int begin, int toindex) {
		String hql = "select t from " + tableName + " t,User u where t." + tableUserIds + " like '%" + userid
				+ "%' and u.userId =" + userid + time_interval + " order by t.createTime asc";
		System.out.println(hql);
		return getSession().createQuery(hql).setFirstResult(begin).setMaxResults(toindex).list();
	}

	@Override
	public List<Object> getAllStatusInfo(String table, String time, String status) {
		String hql = "select t from " + table + " t,User u where u.userId=t.userId and t.dataStatus = '" + status + "'"
				+ time + " order by t.createTime asc";
		return getSession().createQuery(hql).list();
	}

	@Override
	public Long getCountInOnetable(String userid, String tableUserIds, String tableName) {
		String hql = "select count(*) from " + tableName + " where " + tableUserIds + " like '%" + userid + "%'";
		System.out.println(hql);
		return (Long) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public TableInfoAndUserVo getTableInfoByTableId(String tableName, String tableInfoIdName, String tableId) {
		String hql = "select new com.teacherms.satffinfomanage.vo.TableInfoAndUserVo(t,u) from " + tableName
				+ " t,User u where t.userId=u.userId and t." + tableInfoIdName + " = '" + tableId + "'";
		// String hql = " from " + tableName + "where " + tableInfoIdName + " =
		// '" + tableId + "'";
		return (TableInfoAndUserVo) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public List<Object> export_getAInfomationByTableId(String tableName, String tableInfoIdName, String query_id) {
		String hql = "from " + tableName + " where " + tableInfoIdName + " in (" + query_id + ")";
		return getSession().createQuery(hql).list();
	}

	@Override
	public Object getTableObjectByTableId(String tableName, String tableInfoIdName, String tableId) {
		String hql = "from " + tableName + " where " + tableInfoIdName + "='" + tableId + "'";
		return getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public TableInfoAndUserVo getTeacherInfoByUserId(String userId) {
		String hql = "select new com.teacherms.satffinfomanage.vo.TableInfoAndUserVo(t,u) from TeacherInfo t,User u where t.userId=u.userId and t.userId = '"
				+ userId + "'";
		System.out.println(hql);
		return (TableInfoAndUserVo) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public User getUserByUserId(String userId) {
		String hql = "from User where userId = '" + userId + "'";
		return (User) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public String getTableInfoName(String tableName, String tableInfoName, String tableInfoIdName, String infoId) {
		// TODO Auto-generated method stub
		String hql = "select t." + tableInfoName + " from " + tableName + " t where t." + tableInfoIdName + "='"
				+ infoId + "'";
		return (String) getSession().createQuery(hql).uniqueResult();
	}

	@Override
	public String addTableInfo(Object obj) {
		try {
			getSession().saveOrUpdate(obj);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	/**
	 * 与addTableInfo方法一样，只在用户存用户信息时会报： 在hibernate中同一个session里面有了两个相同标识但是是不同实体。
	 * 的错误，为避免封装在一起使用时候merge(obj)会对其他（除用户信息）表存数据时发生影响,所以将起分开，
	 * 并且在存用户信息记录时，不能通过try catch 来判断失败与否，只能返回成功值
	 */
	@Override
	public String updateInfo(TeacherInfo teacherInfo) {
		try {
			getSession().merge(teacherInfo);
			getSession().update(teacherInfo);
		} catch (Exception e) {
		}
		return "success";
	}

	@Override
	public List<String> getUserIdByUserName(String name) {
		String hql = "select u.userId from User u where u.userName like '%" + name + "%'";
		return getSession().createQuery(hql).list();
	}
}
