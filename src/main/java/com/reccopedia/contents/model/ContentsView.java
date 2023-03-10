package com.reccopedia.contents.model;

import java.util.List;

import com.reccopedia.comment.model.CommentView;

public class ContentsView {
	
	private boolean filledPoint;
	
	private boolean filledWish;
	
	private boolean filledWatching;
	
	private List<CommentView> commentList;
	

	public boolean isFilledPoint() {
		return filledPoint;
	}

	public void setFilledPoint(boolean filledPoint) {
		this.filledPoint = filledPoint;
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

	public List<CommentView> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}

	

	
	
	
}
