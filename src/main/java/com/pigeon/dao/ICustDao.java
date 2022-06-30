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
    //查询所有退院的
    public List<Customer> showCheckOut();
    //查询所有待审批的名单
    public List<Customer> showWaitPermission();
    //批准通过
    public int AccerptPermission(Customer cust);
    //批准不通过
    public int DenyPermission(Customer cust);
    //退住信息更新
    public int updatecheckoutinfo(Customer cust);
    //获取所有姓名
    public List<String> showAllNames();
    //提交退住信息
    public int addCheckOut(Customer cust);
    //查询所有外出待审批的名单
    public List<Customer> showGoOutWaitPermission();
    //查询所有外出的客户
    public List<Customer> showGoOut();
    //批准外出请求
    public int AccerptGoOutPermission(Customer cust);
    //批准不通过
    public int DenyGoOutPermission(Customer cust);
    //获取住院客户姓名
    public List<String> showAllNamesWithState();
    //提交外出请求
    public int addGoOut(Customer cust);
}
