package lab.io.rush.model;

import java.util.List;

import lab.io.rush.pojo.Film;
import lab.io.rush.pojo.Kind;

public class FilmModel {
	
	private List<Film> firstFilms;
	
	private List<Film> secondFilms;
	
	private List<Kind> filmKinds;
	
	private String toolBar;

	public List<Film> getFirstFilms() {
		return firstFilms;
	}

	public void setFirstFilms(List<Film> firstFilms) {
		this.firstFilms = firstFilms;
	}

	public List<Film> getSecondFilms() {
		return secondFilms;
	}

	public void setSecondFilms(List<Film> secondFilms) {
		this.secondFilms = secondFilms;
	}
	
	public List<Kind> getFilmKinds() {
		return filmKinds;
	}
	
	public void setFilmKinds(List<Kind> filmKinds) {
		this.filmKinds = filmKinds;
	}

	public String getToolBar() {
		return toolBar;
	}

	public void setToolBar(String toolBar) {
		this.toolBar = toolBar;
	}

}
