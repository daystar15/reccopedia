package com.reccopedia.comment.model;

import com.reccopedia.user.model.User;

public class CommentView {

	
	private Comment comment;
	
	private User user;
	
	private double pointCount;
	
	private boolean filledWish;
	
	private boolean filledWatching;

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

	public boolean isFilledWish() {
		return filledWish;
	}

	public void setFilledWish(boolean filledWish) {
		this.filledWish = filledWish;
	}

	public boolean isFilledWatching() {
		return filledWatching;
	}

	public void setFilledWatching(boolean filledWatching) {
		this.filledWatching = filledWatching;
	}

	
	
}
