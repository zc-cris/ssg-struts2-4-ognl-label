package cn.zc_cris.user.register;

public class Dept {

	private Integer id;
	private String name;
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
	public Dept(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Dept() {
		super();
		
	}
	@Override
	public String toString() {
		return "Dept [id=" + id + ", name=" + name + "]";
	}
	
}
