package com.pigeon.dao;

import com.pigeon.entity.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICustDao {
    //添加用户信息
    public int insertCustomer(Customer cust);
    //查询三种老人的信息
    public List<Customer> selectHUOLILAOREN();
    public List<Customer> selectZILILAOREN();
    public List<Customer> selectHULILAOREN();
    //删除客户信息
    public int deleteCustomer(int Cid);
    //根据id获得数据
    public Customer getcustinfo(int Cid);
    //入住信息更新
    public int updatecheckininfo(Customer cust);
    //显示所有用户信息
    public List<Customer> ShowAllCustomers();
    //隐藏信息
    public int hideInfo(int Cid);
    //显示信息
    public int showInfo(int Cid);
    //获取所有身份证号（用来判断是否在数据库中）
    public List<String> selectAllIDs();
    //通过身份证号获得Cid
    public int getIDbyIdentity(String Identity);
}
