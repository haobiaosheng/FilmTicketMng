package lab.io.rush.pojo;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.type.FloatType;

/**
 * Film entity. @author MyEclipse Persistence Tools
 */

public class Film implements java.io.Serializable {

	// Fields
	private Integer id;
	private String filmName;
	private Kind kind;
	private float ticketPrice;
	private Integer ticketNum;
	private String icon;
	private String detail;
	private Set records = new HashSet(0);

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFilmName() {
		return filmName;
	}

	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}

	public Kind getKind() {
		return kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}

	public float getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(float ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public Integer getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(Integer ticketNum) {
		this.ticketNum = ticketNum;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Set getRecords() {
		return records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}
	
	// Constructors

	/** default constructor */
	public Film() {
	}

	/** minimal constructor */
	public Film(String filmName) {
		this.filmName = filmName;
	}

	/** full constructor */
	public Film(String filmName, Kind kind, float ticketPrice, 
			Integer ticketNum, String icon, String detail, Set records) {
		this.filmName = filmName;
		this.kind = kind;
		this.ticketPrice = ticketPrice;
		this.ticketNum = ticketNum;
		this.icon = icon;
		this.detail = detail;
		this.records = records;
	}

}