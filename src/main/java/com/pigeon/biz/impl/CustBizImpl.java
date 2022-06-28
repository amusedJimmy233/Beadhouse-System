package com.pigeon.biz.impl;

import com.pigeon.biz.ICustBiz;
import com.pigeon.dao.ICustDao;
import com.pigeon.entity.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CustBizImpl implements ICustBiz {

    @Resource
    ICustDao custDao;

    @Override
    public Boolean addCust(Customer cust){
        int result = custDao.insertCustomer(cust);
        return result>0;
    }
}
