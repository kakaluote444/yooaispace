package com.yooai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.TypeMapper;
import com.yooai.modal.Type;

@Service
public class TypeService {
	@Autowired
	private TypeMapper typeDao;
	
	public List<Type> getAllSayType(){
		return typeDao.selectAll();
	}
	
	public List<String> getTypeNameBySayId(int sayId){
			return typeDao.selectTypeNameBySayId(sayId);
	}
}
