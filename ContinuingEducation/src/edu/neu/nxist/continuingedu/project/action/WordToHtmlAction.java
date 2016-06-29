package edu.neu.nxist.continuingedu.project.action;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.opensymphony.xwork2.ActionSupport;

public class WordToHtmlAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String wordPath;
	private String savePath;

	// 将指定目录下面的指定doc文件转化为HTML并存储在savepaths目录下
	public void excute() {
		String fileType = "";
		System.out.println(wordPath);
		int point = wordPath.lastIndexOf('.');
		int length = wordPath.length();

		fileType = wordPath.substring(point + 1, length);
		System.out.println(fileType);
		if (fileType.equalsIgnoreCase("doc")
				|| fileType.equalsIgnoreCase("docx")) {
			System.out.println("word文件路径：" + wordPath);
			// word文件的完整路径
			int slash = wordPath.lastIndexOf('/');
			String htmlFile = savePath + "//"
					+ wordPath.substring(slash + 1, point) + ".htm";
			System.out.println("htm文件路径：" + htmlFile);
			// html文件的完整路径
			ActiveXComponent app = new ActiveXComponent("Word.Application");
			// 启动word
			try {
				System.out.println("正在转化......");
				app.setProperty("Visible", new Variant(false));
				// 设置word程序非可视化运行
				Dispatch docs = app.getProperty("Documents").toDispatch();
				Dispatch doc = Dispatch.invoke(
						docs,
						"Open",
						Dispatch.Method,
						new Object[] { wordPath, new Variant(false),
								new Variant(true) }, new int[1]).toDispatch();
				// 打开word文件
				/*
				 * new Variant(10)筛选过的网页 new Variant(9) 单个文件网页 new Variant(8)
				 * 另存为网页 new Variant(7) 另存为txt格式 new Variant(6) 另存为rtf格式 new
				 * Variant(0) 另存为doc格式
				 */
				Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {
						htmlFile, new Variant(8) }, new int[1]);
				// 作为htm格式保存文件
				Dispatch.call(doc, "Close", new Variant(false));
				// 关闭文件
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				app.invoke("Quit", new Variant[] {});
				// 退出word程序
			}
			// 转化完毕
			System.out.println("转化成功！");
		}
	}

	public String getWordPath() {
		return wordPath;
	}

	public void setWordPath(String wordPath) {
		this.wordPath = wordPath;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

}
