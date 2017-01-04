package lab.io.rush.pojo;

/**
 * Record entity. @author MyEclipse Persistence Tools
 */

public class Record implements java.io.Serializable {

	// Fields

	private Integer id;
	private Film film;
	private User user;
	private String snapTime;
	private Integer ticketNum;

	// Constructors

	/** default constructor */
	public Record() {
	}

	/** full constructor */
	public Record(Film film, User user, String snapTime, Integer ticketNum) {
		this.film = film;
		this.user = user;
		this.snapTime = snapTime;
		this.ticketNum = ticketNum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSnapTime() {
		return this.snapTime;
	}

	public void setSnapTime(String snapTime) {
		this.snapTime = snapTime;
	}

	public Integer getTicketNum() {
		return this.ticketNum;
	}

	public void setTicketNum(Integer ticketNum) {
		this.ticketNum = ticketNum;
	}

}