package com.teacherms.satffinfomanage.vo;

import java.util.List;

import com.teacherms.all.domain.User;

public class TableInfoAndUserVo {
	private Object object;// 信息对象
	private User user;// 用户对象
	private List<String> attachmentName;

	public TableInfoAndUserVo() {
		super();
	}

	public TableInfoAndUserVo(Object object, User user) {
		super();
		this.object = object;
		this.user = user;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<String> getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(List<String> attachmentName) {
		this.attachmentName = attachmentName;
	}

}
