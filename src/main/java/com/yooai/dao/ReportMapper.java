package com.yooai.dao;

import com.yooai.modal.Report;
import com.yooai.modal.ReportKey;

public interface ReportMapper {
    int deleteByPrimaryKey(ReportKey key);

    int insertSelective(Report record);

    Report selectByPrimaryKey(ReportKey key);

    int updateByPrimaryKeySelective(Report record);
}