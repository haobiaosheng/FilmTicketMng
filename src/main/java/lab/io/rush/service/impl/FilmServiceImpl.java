package lab.io.rush.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import net.sf.ehcache.constructs.web.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lab.io.rush.dao.FilmDao;
import lab.io.rush.dao.KindDao;
import lab.io.rush.model.FilmModel;
import lab.io.rush.pojo.Film;
import lab.io.rush.pojo.Kind;
import lab.io.rush.service.FilmService;
import lab.io.rush.util.Paging;

@Repository("filmService")
public class FilmServiceImpl implements FilmService{
	
	@Autowired
	private FilmDao filmDao;
	
	@Autowired
	private KindDao kindDao;

	@Override
	public FilmModel getFilms(String baseUrl, String curPage) {
		
		FilmModel filmModel = new FilmModel();
		List<Film> firstFilms, secondFilms;
		List<Film> films = filmDao.getFilms();
		List<Kind> filmKinds = kindDao.getKinds();
		int page = curPage == null ? 1:Integer.parseInt(curPage);
		Paging paging = new Paging(films, page, 10);
		films = (List<Film>) paging.getData();
		
		firstFilms = new ArrayList<Film>();
		secondFilms = new ArrayList<Film>();
		
		for(int i = 0;i < films.size();i++) {
			if (firstFilms.size() <= 4) {
				firstFilms.add(films.get(i));
			}else {
				secondFilms.add(films.get(i));
			}
		}
		
		filmModel.setFirstFilms(firstFilms);
		filmModel.setSecondFilms(secondFilms);
		filmModel.setToolBar(paging.getToolBar(baseUrl + "?curPage="+curPage));
		filmModel.setFilmKinds(filmKinds);
		
		return filmModel;
	}

	@Override
	public Film getFilmById(Integer filmId) {
		return filmDao.getFilmById(filmId);
	}

	@Override
	public List<Film> getHotFilms(Integer filmId) {
		List<Film> hotFilms = new ArrayList<Film>();
		List<Film> films = filmDao.getHotFilms();
		
		for(int i = 0;i < films.size();i++) {
			if (films.get(i).getId() - filmId == 0) {
				continue;
			}else {
				if (hotFilms.size() <= 4) {
					hotFilms.add(films.get(i));
				}else {
					break;
				}
			}
		}
		return hotFilms;
	}

}
