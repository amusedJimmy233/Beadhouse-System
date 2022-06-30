package com.pigeon.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface IUserDao {
    //根据用户名获得密码
    public String getpswd(String Username);
}
