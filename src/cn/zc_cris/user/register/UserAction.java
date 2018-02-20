package cn.zc_cris.user.register;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

public class UserAction implements RequestAware{
	
	private String name;
	private String password;
	private String gender;
	private String dept;
	private String desc;
	private List<String> roles;
	private Map<String, Object> requestMap;
	private Dao dao = new Dao();
	
	public String registerUI() {
		List<Dept> depts = dao.getDepts();
		List<Role> roles = dao.getRoles();
		requestMap.put("depts", depts);
		requestMap.put("roles", roles);
		return "registerUI";
	}
	
	public String register() {
		System.out.println(this);
		
		//由于需要回显数据，所以要在request域对象中放入depts和roles属性，使得jsp页面可以进行数据回显
		List<Dept> depts = dao.getDepts();
		List<Role> roles = dao.getRoles();
		requestMap.put("depts", depts);
		requestMap.put("roles", roles);
		return "register";
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Map<String, Object> getRequestMap() {
		return requestMap;
	}

	public void setRequestMap(Map<String, Object> requestMap) {
		this.requestMap = requestMap;
	}

	public Dao getDao() {
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.requestMap = arg0;
	}

	@Override
	public String toString() {
		return "UserAction [name=" + name + ", password=" + password + ", gender=" + gender + ", dept=" + dept
				+ ", desc=" + desc + ", roles=" + roles + "]";
	}
}
