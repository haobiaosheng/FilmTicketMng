package lab.io.rush.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import lab.io.rush.dao.KindDao;
import lab.io.rush.pojo.Kind;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("kindDao")
public class KindDaoImpl extends HibernateDaoSupport implements KindDao{
	
	private String hql;
	
	@Resource(name = "sessionFactory")  
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }

	@Override
	public List<Kind> getKinds() {
		hql = "from Kind";
		return (List<Kind>) getHibernateTemplate().find(hql);
	}

}
