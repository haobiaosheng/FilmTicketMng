package lab.io.rush.dao.impl;

import javax.annotation.Resource;

import lab.io.rush.dao.RecordDao;
import lab.io.rush.pojo.Record;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("recordDao")
public class RecordDaoImpl extends HibernateDaoSupport implements RecordDao{
	
	private String hql;
	
	@Resource(name = "sessionFactory")  
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }

	@Override
	public boolean addRecord(Record record) {
		boolean result = true;
		try {
			getHibernateTemplate().save(record);
		}catch (Exception e) {
			result = false;
		}
		return result;
	}

}
