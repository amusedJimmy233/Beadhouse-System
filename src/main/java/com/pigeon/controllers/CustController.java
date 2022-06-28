package com.pigeon.controllers;

import com.pigeon.biz.ICustBiz;
import com.pigeon.entity.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class CustController {
    @Resource
    private ICustBiz custBiz;

    @RequestMapping("/addCustomer")
    public void addCustomer(Customer cust) throws Exception{
        System.out.println("要添加的用户信息"+cust);

        Boolean isAddSuccess=custBiz.addCust(cust);

    }
}
