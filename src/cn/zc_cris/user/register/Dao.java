package cn.zc_cris.user.register;

import java.util.ArrayList;
import java.util.List;

public class Dao {

	private List<Dept> depts;
	public List<Dept> getDepts(){
		depts = new ArrayList<>();
		depts.add(new Dept(1001, "研发部"));
		depts.add(new Dept(1002, "人事部"));
		depts.add(new Dept(1003, "市场部"));
		depts.add(new Dept(1004, "宣传部"));
		return depts;
	}
	private List<Role> roles;
	public List<Role> getRoles(){
		roles = new ArrayList<>();
		roles.add(new Role(1, "管理员"));
		roles.add(new Role(2,"超级管理员"));
		roles.add(new Role(3, "用户"));
		return roles;
	}
	
}
