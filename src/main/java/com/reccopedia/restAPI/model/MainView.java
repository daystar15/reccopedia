package com.reccopedia.restAPI.model;

import java.util.List;

import com.reccopedia.contents.model.ContentsView;

public class MainView {

	private List<ContentsView> contents;

	public List<ContentsView> getContents() {
		return contents;
	}

	public void setContents(List<ContentsView> contents) {
		this.contents = contents;
	}

}
