package edu.neu.nxist.continuingedu.courseware.model;

public class Courseware {
	
	private String id;
	private String title;
	private String path;
	private String time;
	private String category;
	private String author;
	private String authortype;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getAuthortype() {
		return authortype;
	}
	public void setAuthortype(String authortype) {
		this.authortype = authortype;
	}
}
