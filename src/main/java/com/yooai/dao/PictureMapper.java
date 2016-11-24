package com.yooai.dao;

import java.util.List;

import com.yooai.modal.Picture;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer pictureId);
    
    List<String> selectImgesBySayId(int sayId);
    
    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer pictureId);

    int updateByPrimaryKeySelective(Picture record);

}