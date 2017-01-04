package lab.io.rush.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Kind entity. @author MyEclipse Persistence Tools
 */

public class Kind implements java.io.Serializable {

	// Fields

	private Integer id;
	private String kindName;
	private Set films = new HashSet(0);

	// Constructors

	/** default constructor */
	public Kind() {
	}

	/** minimal constructor */
	public Kind(String kindName) {
		this.kindName = kindName;
	}

	/** full constructor */
	public Kind(String kindName, Set films) {
		this.kindName = kindName;
		this.films = films;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKindName() {
		return this.kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public Set getFilms() {
		return this.films;
	}

	public void setFilms(Set films) {
		this.films = films;
	}

}