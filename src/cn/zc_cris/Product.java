package cn.zc_cris;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;

public class Product implements SessionAware,RequestAware{

	private Integer id;
	private String name;
	private String desc;
	private BigDecimal price;
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", desc=" + desc + ", price=" + price + "]";
	}
	
	public String save() {
		System.out.println("save: "+this);
		//1. 获取值栈
		ValueStack valueStack = ActionContext.getContext().getValueStack();
		//2. 创建Test对象，为其属性赋值，和product的name属性和desc属性相同
		Test test = new Test("cris", "你好");
		//3. 将Test对象压入值栈栈顶
		valueStack.push(test);
		requestMap.put("product", this);
		sessionMap.put("test", test);
		//int i = 1/0;
		return "save";
	}
	
	private List<Person> lists = new ArrayList<>();
	public List<Person> getLists() {
		return lists;
	}
	//测试标签
	public String property() {
		this.desc = "the chosen one";
		this.id = 1;
		this.price = BigDecimal.valueOf(100000.0);
		this.name = "curry";
		lists.add(new Person("bb",22));
		lists.add(new Person("aa",11));
		lists.add(new Person("dd",44));
		lists.add(new Person("cc",33));
		return "property";
		
	}
	
	
	
	private Map<String, Object> requestMap;
	private Map<String, Object> sessionMap;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.requestMap = arg0;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.sessionMap = arg0;
	}
}
