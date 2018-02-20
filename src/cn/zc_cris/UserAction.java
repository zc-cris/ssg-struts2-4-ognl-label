package cn.zc_cris;

import java.util.List;

public class UserAction {
	
	private Integer id;
	private String name;
	private String password;
	private String desc;
	private Boolean married;
	private String gender;
	private List<String> city;
	private String age;
	
	
	public String save() {
		System.out.println(this);
		return "save";
	}
	
	public Boolean getMarried() {
		return married;
	}
	public void setMarried(Boolean married) {
		this.married = married;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public List<String> getCity() {
		return city;
	}
	public void setCity(List<String> city) {
		this.city = city;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	public UserAction(Integer id, String name, String password, String desc, Boolean married, String gender,
			List<String> city, String age) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.desc = desc;
		this.married = married;
		this.gender = gender;
		this.city = city;
		this.age = age;
	}
	public UserAction() {
		super();
	}

	@Override
	public String toString() {
		return "UserAction [id=" + id + ", name=" + name + ", password=" + password + ", desc=" + desc + ", married="
				+ married + ", gender=" + gender + ", city=" + city + ", age=" + age + "]";
	}
	
}
