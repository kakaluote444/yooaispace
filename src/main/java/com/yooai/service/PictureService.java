package com.yooai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.PictureMapper;

@Service
public class PictureService {
	@Autowired
	private PictureMapper pictureDao;
	
	/**
	 * 查询说说下的所有照片url地址
	 * @param sayId
	 * @return
	 */
	public List<String> getSayImages(int sayId){
		return pictureDao.selectImgesBySayId(sayId);
	}
}
