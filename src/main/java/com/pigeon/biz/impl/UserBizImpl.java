package com.pigeon.biz.impl;

import com.pigeon.biz.IUserBiz;
import com.pigeon.dao.IUserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserBizImpl implements IUserBiz {

    @Resource
    IUserDao userDao;

    @Override
    public String getpswd(String Username) {
        return userDao.getpswd(Username);
    }
}
