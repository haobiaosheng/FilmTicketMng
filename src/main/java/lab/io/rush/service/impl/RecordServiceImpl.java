package lab.io.rush.service.impl;

import lab.io.rush.dao.RecordDao;
import lab.io.rush.pojo.Record;
import lab.io.rush.service.RecordService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("recordService")
public class RecordServiceImpl implements RecordService{
	
	@Autowired
	private RecordDao recordDao;

	@Override
	public boolean addRecord(Record record) {
		return recordDao.addRecord(record);
	}

}
