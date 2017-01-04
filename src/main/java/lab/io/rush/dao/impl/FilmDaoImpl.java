package lab.io.rush.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import lab.io.rush.dao.FilmDao;
import lab.io.rush.pojo.Film;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("filmDao")
public class FilmDaoImpl extends HibernateDaoSupport implements FilmDao{
	
	private String hql;
	
	@Resource(name = "sessionFactory")  
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }

	@Override
	public List<Film> getFilms() {
		hql = "from Film";
		return (List<Film>) getHibernateTemplate().find(hql);
	}

	@Override
	public Film getFilmById(Integer filmId) {
		hql = "from Film f where f.id = " + filmId;
		return (Film) getHibernateTemplate().find(hql).get(0);
	}

	@Override
	public List<Film> getHotFilms() {
		hql = "from Film f where f.ticketNum > 0 order by f.ticketNum asc";
		return (List<Film>) getHibernateTemplate().find(hql);
	}

}
