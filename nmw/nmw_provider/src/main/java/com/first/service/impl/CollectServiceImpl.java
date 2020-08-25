package com.first.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.first.dao.CollectMapper;
import com.first.service.CollectService;

import javax.annotation.Resource;

@Service
public class CollectServiceImpl implements CollectService {
    @Resource
    private CollectMapper collectMapper;

    @Override
    public Integer addCollect() {
        return collectMapper.addCollect();
    }

    @Override
    public Integer delCollectByuserId(Integer user_id) {
        return collectMapper.delCollectByuserId(user_id);
    }

    @Override
    public Integer modifyCollectBysheetId(Integer sheet_id) {
        return collectMapper.modifyCollectBysheetId(sheet_id);
    }
}
