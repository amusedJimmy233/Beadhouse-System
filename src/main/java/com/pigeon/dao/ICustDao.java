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
}
