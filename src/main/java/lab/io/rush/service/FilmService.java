package lab.io.rush.service;

import java.util.List;

import lab.io.rush.model.FilmModel;
import lab.io.rush.pojo.Film;

public interface FilmService {
	
	public FilmModel getFilms(String baseUrl, String curPage);
	
	public Film getFilmById(Integer filmId);
	
	public List<Film> getHotFilms(Integer filmId);

}
