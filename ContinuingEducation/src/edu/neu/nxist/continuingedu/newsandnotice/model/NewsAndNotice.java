package edu.neu.nxist.continuingedu.newsandnotice.model;

public class NewsAndNotice {
	private String Id;// 主键
	private String title;// 新闻标题
	private byte[] content;// 新闻内容
	private String time;// 新闻发布时间
	private NewsAndNoticeCategory category;// 新闻:1 or 通知:2
	private String author;// 新闻作者
	private String contentStr;// 在读取数据库中content时可以转成string方便jsp显示

	public void setId(String id) {
		Id = id;
	}

	public String getId() {
		return Id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public String getContentStr() {
		return new String(getContent());
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setCategory(NewsAndNoticeCategory category) {
		this.category = category;
	}

	public NewsAndNoticeCategory getCategory() {
		return category;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
