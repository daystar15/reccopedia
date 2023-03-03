package com.reccopedia.comment.model;

import com.reccopedia.user.model.User;

public class CommentView {

	private Comment comment;
	
	private User user;
	
	private double pointCount;
	
	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public double getPointCount() {
		return pointCount;
	}

	public void setPointCount(double pointCount) {
		this.pointCount = pointCount;
	}

	
	
}
