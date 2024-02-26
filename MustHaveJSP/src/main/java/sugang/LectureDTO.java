package sugang;



public class LectureDTO {
	
	private String lec_id;
	private String title;
	private int start_t;
	private int end_t;
	private int score;
	private String classroom;
	private String profe_name;
	private String ext;
	private String day;
	
	public LectureDTO () {}


	public String getLec_id() {
		return lec_id;
	}

	public String getTitle() {
		return title;
	}

	public int getStart_t() {
		return start_t;
	}

	public int getEnd_t() {
		return end_t;
	}

	public int getScore() {
		return score;
	}

	public String getClassroom() {
		return classroom;
	}

	public String getProfe_name() {
		return profe_name;
	}

	public String getExt() {
		return ext;
	}

	public String getDay() {
		return day;
	}
	
	public void setLec_id(String lec_id) {
		this.lec_id = lec_id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setStart_t(int start_t) {
		this.start_t = start_t;
	}

	public void setEnd_t(int end_t) {
		this.end_t = end_t;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public void setProfe_name(String profe_name) {
		this.profe_name = profe_name;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public void setDay(String day) {
		this.day = day;
	}

	
	

}