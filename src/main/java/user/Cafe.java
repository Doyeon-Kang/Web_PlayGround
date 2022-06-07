package user;

public class Cafe {
	private String cafe_name;
	private String cafe_desc;
	private String cafe_address;
	private String cafe_image_url;
	
	public Cafe(String cafe_name, String cafe_desc, String cafe_address, String cafe_image_url) {
		this.cafe_name = cafe_name;
		this.cafe_desc = cafe_desc;
		this.cafe_address = cafe_address;
		this.cafe_image_url = cafe_image_url;
	}

	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_desc() {
		return cafe_desc;
	}
	public void setCafe_desc(String cafe_desc) {
		this.cafe_desc = cafe_desc;
	}
	public String getCafe_address() {
		return cafe_address;
	}
	public void setCafe_address(String cafe_address) {
		this.cafe_address = cafe_address;
	}
	public String getCafe_image_url() {
		return cafe_image_url;
	}
	public void setCafe_image_url(String cafe_image_url) {
		this.cafe_image_url = cafe_image_url;
	}
	
}
