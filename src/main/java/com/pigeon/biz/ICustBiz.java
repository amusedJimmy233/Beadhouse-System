package com.pigeon.biz;

import com.pigeon.entity.Customer;

import java.util.List;

public interface ICustBiz {
    //添加客户信息
    public Boolean addCust(Customer cust);
    //查询三种老人
    public List<Customer> showHUOLI();
    public List<Customer> showZILI();
    public List<Customer> showHULI();
    //删除客户信息
    public Boolean deleteCust(int Cid);
    //根据id获得数据
    public Customer getcustinfo(int Cid);
    //入住信息更新
    public Boolean updatecheckininfo(Customer cust);
    //显示所有用户信息
    public List<Customer> ShowAllCustomers();
    //隐藏信息
    public Boolean hideInfo(int Cid);
    //显示信息
    public Boolean showInfo(int Cid);
    //获取所有身份证号（用来判断是否在数据库中）
    public List<String> selectAllIDs();
    //通过身份证号获得Cid
    public int getIDbyIdentity(String Identity);
    //查询所有退院的
    public List<Customer> showCheckOut();
    //查询所有待审批的名单
    public List<Customer> showWaitPermission();
    //批准通过
    public Boolean AccerptPermission(Customer cust);
    //批准不通过
    public Boolean DenyPermission(Customer cust);
    //退住信息更新
    public Boolean updatecheckoutinfo(Customer cust);
    //获取所有姓名
    public List<String> showAllNames();
    //提交退住信息
    public Boolean addCheckOut(Customer cust);
}
