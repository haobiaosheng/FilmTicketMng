package lab.io.rush.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String email;
	private Set records = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String email) {
		this.email = email;
	}

	/** full constructor */
	public User(String email, Set records) {
		this.email = email;
		this.records = records;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getRecords() {
		return this.records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}

}