package fileupload;

public class MyFileDTO {
	//myfile 테이블의 객체를 담을 그릇역할

	private String idx;
	private String name; //작성자이름
	private String title;
	private String cate; //카테고리
	private String ofile; //원본파일명
	private String sfile; //저장된파일명
	private String postdate; //등록날짜
	
	public MyFileDTO() {
		
	}

	public String getIdx() {		return idx;	}
	public String getName() {		return name;	}
	public String getTitle() {		return title;	}
	public String getCate() {		return cate;	}
	public String getOfile() {		return ofile;	}
	public String getSfile() {		return sfile;	}
	public String getPostdate() {		return postdate;	}
	
	public void setIdx(String idx) {		this.idx = idx;	}
	public void setName(String name) {		this.name = name;	}
	public void setTitle(String title) {		this.title = title;	}
	public void setCate(String cate) {		this.cate = cate;	}
	public void setOfile(String ofile) {		this.ofile = ofile;	}
	public void setSfile(String sfile) {		this.sfile = sfile;	}
	public void setPostdate(String postdate) {		this.postdate = postdate;	}
	
}
