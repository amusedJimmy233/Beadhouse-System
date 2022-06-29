package com.pigeon.biz.impl;

import com.pigeon.biz.ICustBiz;
import com.pigeon.dao.ICustDao;
import com.pigeon.entity.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustBizImpl implements ICustBiz {

    @Resource
    ICustDao custDao;

    @Override
    public Boolean addCust(Customer cust){
        int result = custDao.insertCustomer(cust);
        return result>0;
    }

    @Override
    public List<Customer> showHUOLI() {
        return custDao.selectHUOLILAOREN();
    }

    @Override
    public List<Customer> showZILI() {
        return custDao.selectZILILAOREN();
    }

    @Override
    public List<Customer> showHULI() {
        return custDao.selectHULILAOREN();
    }

    @Override
    public Boolean deleteCust(int Cid) {
        int result=custDao.deleteCustomer(Cid);
        return result>0;
    }

    @Override
    public Customer getcustinfo(int Cid) {
        return custDao.getcustinfo(Cid);
    }

    @Override
    public Boolean updatecheckininfo(Customer cust) {
        int result=custDao.updatecheckininfo(cust);
        return result>0;
    }

    @Override
    public List<Customer> ShowAllCustomers() {
        return custDao.ShowAllCustomers();
    }

    @Override
    public Boolean hideInfo(int Cid) {
        int result=custDao.hideInfo(Cid);
        return result>0;
    }

    @Override
    public Boolean showInfo(int Cid) {
        int result=custDao.showInfo(Cid);
        return result>0;
    }

    @Override
    public List<String> selectAllIDs() {
        return custDao.selectAllIDs();
    }

    @Override
    public int getIDbyIdentity(String Identity) {
        return custDao.getIDbyIdentity(Identity);
    }
}
