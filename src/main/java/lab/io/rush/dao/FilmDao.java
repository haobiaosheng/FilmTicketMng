package lab.io.rush.dao;

import java.util.List;
import lab.io.rush.pojo.Film;


public interface FilmDao {
	
	public List<Film> getFilms();
	
	public Film getFilmById(Integer filmId);
	
	public List<Film> getHotFilms();

}
