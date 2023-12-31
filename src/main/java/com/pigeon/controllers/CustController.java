package com.pigeon.controllers;

import com.alibaba.fastjson.JSONObject;
import com.pigeon.biz.ICustBiz;
import com.pigeon.entity.Customer;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustController {
    @Resource
    private ICustBiz custBiz;

    @RequestMapping("/addCustomer")
    public void addCustomer(Customer cust) throws Exception{
        System.out.println("要添加的用户信息"+cust);
        List<String> ids=custBiz.selectAllIDs();
        String CIdentity=cust.getIdentity();
        Boolean isAddSuccess;
        if (ids.contains(CIdentity)){
            //已经存在该用户，更新数据
            int Cid=custBiz.getIDbyIdentity(CIdentity);
            cust.setCid(Cid);
            isAddSuccess=custBiz.updatecheckininfo(cust);
            System.out.println("数据更新");
            System.out.println(cust);
        }
        else {
            //不存在该用户，添加用户信息
            isAddSuccess=custBiz.addCust(cust);
        }
        System.out.println(isAddSuccess?"success":"fail");
    }


    @RequestMapping("showHUOLI")
    public String showHUOLI() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showHUOLI();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("Health",cust.getHealth());
            json.put("State",cust.getState());
            json.put("Family",cust.getFamily());
            json.put("FamilyPhone",cust.getFamilyPhone());
            json.put("Room",cust.getRoom());
            json.put("StartTime",cust.getStartTime());
            json.put("ExpireTime",cust.getExpireTime());
            json.put("StartRemarks",cust.getStartRemarks());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("showZILI")
    public String showZILI() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showZILI();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("Health",cust.getHealth());
            json.put("State",cust.getState());
            json.put("Family",cust.getFamily());
            json.put("FamilyPhone",cust.getFamilyPhone());
            json.put("Room",cust.getRoom());
            json.put("StartTime",cust.getStartTime());
            json.put("ExpireTime",cust.getExpireTime());
            json.put("StartRemarks",cust.getStartRemarks());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("showHULI")
    public String showHULI() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showHULI();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("Health",cust.getHealth());
            json.put("State",cust.getState());
            json.put("Family",cust.getFamily());
            json.put("FamilyPhone",cust.getFamilyPhone());
            json.put("Room",cust.getRoom());
            json.put("StartTime",cust.getStartTime());
            json.put("ExpireTime",cust.getExpireTime());
            json.put("StartRemarks",cust.getStartRemarks());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("deleteCustomer")
    public void deleteCustomer(Customer cust) throws Exception{
        int Cid=cust.getCid();
        System.out.println(Cid);
        Boolean isAddSuccess=custBiz.deleteCust(Cid);
        System.out.println(isAddSuccess?"success":"fail");
    }

    @RequestMapping("getCustomerinfo")
    public String getCustomerinfo(Customer cust) throws Exception{
        int Cid=cust.getCid();
        System.out.println(Cid);
        Customer custinfo=custBiz.getcustinfo(Cid);
        JSONArray jsonarray=new JSONArray();
        JSONObject json=new JSONObject();
        json.put("Cid",custinfo.getCid());
        json.put("CName",custinfo.getCName());
        json.put("Sex",custinfo.getSex());
        json.put("Age",custinfo.getAge());
        json.put("Identity",custinfo.getIdentity());
        json.put("Health",custinfo.getHealth());
        json.put("Family",custinfo.getFamily());
        json.put("FamilyPhone",custinfo.getFamilyPhone());
        json.put("Room",custinfo.getRoom());
        json.put("StartTime",custinfo.getStartTime());
        json.put("ExpireTime",custinfo.getExpireTime());
        json.put("StartRemarks",custinfo.getStartRemarks());
        return json.toString();
    }

    @RequestMapping("updatecheckin")
    public void updatecheckin(Customer cust) throws Exception{
        System.out.println("要修改的用户信息"+cust);
        Boolean isAddSuccess=custBiz.updatecheckininfo(cust);
        System.out.println(isAddSuccess?"success":"fail");
    }

    @RequestMapping("showAllCustomers")
    public String showAllCustomers()throws Exception{
        List<Customer> custs=custBiz.ShowAllCustomers();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("Health",cust.getHealth());
            json.put("State",cust.getState());
            json.put("Family",cust.getFamily());
            json.put("FamilyPhone",cust.getFamilyPhone());
            json.put("Room",cust.getRoom());
            json.put("StartTime",cust.getStartTime());
            json.put("ExpireTime",cust.getExpireTime());
            json.put("StartRemarks",cust.getStartRemarks());
            json.put("EndTime",cust.getEndTime());
            json.put("EndSort",cust.getEndSort());
            json.put("EndState",cust.getEndState());
            json.put("EndReason",cust.getEndReason());
            json.put("EndRemarks",cust.getEndRemarks());
            json.put("OutTime",cust.getOutTime());
            json.put("ExpectBackTime",cust.getExpectBackTime());
            json.put("Companion",cust.getCompanion());
            json.put("CompanionPhone",cust.getCompanionPhone());
            json.put("CompanionRelationship",cust.getCompanionRelationship());
            json.put("OutState",cust.getOutState());
            json.put("OutSort",cust.getOutSort());
            json.put("OutRemarks",cust.getOutRemarks());
            json.put("OutAppTime",cust.getOutAppTime());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("HideInfo")
    public void HideInfo(Customer cust) throws Exception{
        int Cid=cust.getCid();
        Boolean isAddSuccess=custBiz.hideInfo(Cid);
        System.out.println(isAddSuccess?"success":"fail");
    }

    @RequestMapping("ShowInfo")
    public void ShowInfo(Customer cust) throws Exception{
        int Cid=cust.getCid();
        Boolean isAddSuccess=custBiz.showInfo(Cid);
        System.out.println(isAddSuccess?"success":"fail");
    }

    @RequestMapping("ShowCheckOut")
    public String ShowCheckOut() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showCheckOut();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("State",cust.getState());
            json.put("StartTime",cust.getStartTime());
            json.put("EndTime",cust.getEndTime());
            json.put("EndSort",cust.getEndSort());
            json.put("EndReason",cust.getEndReason());
            json.put("EndAppTime",cust.getEndAppTime());
            json.put("EndState",cust.getEndState());
            json.put("EndRemarks",cust.getEndRemarks());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("ShowWaitPermission")
    public String ShowWaitPermission() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showWaitPermission();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("State",cust.getState());
            json.put("StartTime",cust.getStartTime());
            json.put("EndSort",cust.getEndSort());
            json.put("EndReason",cust.getEndReason());
            json.put("EndAppTime",cust.getEndAppTime());
            json.put("EndState",cust.getEndSort());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("handlePermission")
    public void handlePermission(Customer cust) throws Exception{
        System.out.println("处理审核意见"+cust);
        String EndState=cust.getEndState();
        if(EndState.equals("通过"))
        {
            custBiz.AccerptPermission(cust);
            System.out.println("审核通过");
        }
        else
        {
            custBiz.DenyPermission(cust);
            System.out.println("审核不通过");
        }
    }

    @RequestMapping("updatecheckout")
    public void updatecheckout(Customer cust) throws Exception{
        System.out.println("要修改的用户信息"+cust);
        Boolean isAddSuccess=custBiz.updatecheckoutinfo(cust);
        System.out.println(isAddSuccess?"success":"fail");
    }

    @RequestMapping("getAllNames")
    public String getAllNames() throws Exception{
        List<String> names=custBiz.showAllNames();
        System.out.println("所有名字是："+names);
        JSONArray jsonarray=new JSONArray();
        for (String name:names)
        {
            JSONObject json=new JSONObject();
            json.put("Name",name);
            jsonarray.add(json);
        }
        return jsonarray.toString();
    }

    @RequestMapping("addcheckout")
    public void addCheckOut(Customer cust) throws Exception{
        String EndAppTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
        cust.setEndAppTime(EndAppTime);
        Boolean isSuccess=custBiz.addCheckOut(cust);
        System.out.println(isSuccess?"success":"fail");
    }

    @RequestMapping("ShowGoOutWaitPermission")
    public String ShowGoOutWaitPermission() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showGoOutWaitPermission();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("OutTime",cust.getOutTime());
            json.put("ExpectBackTime",cust.getExpectBackTime());
            json.put("Companion",cust.getCompanion());
            json.put("CompanionPhone",cust.getCompanionPhone());
            json.put("CompanionRelationship",cust.getCompanionRelationship());
            json.put("OutState",cust.getOutState());
            json.put("OutSort",cust.getOutSort());
            json.put("OutRemarks",cust.getOutRemarks());
            json.put("OutAppTime",cust.getOutAppTime());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("ShowGoOut")
    public String ShowGoOut() throws Exception{
        System.out.println("访问成功");
        List<Customer> custs=custBiz.showGoOut();
        JSONArray jsonarray=new JSONArray();
        for (Customer cust:custs)
        {
            JSONObject json=new JSONObject();
            json.put("Cid",cust.getCid());
            json.put("CName",cust.getCName());
            json.put("Sex",cust.getSex());
            json.put("Age",cust.getAge());
            json.put("Identity",cust.getIdentity());
            json.put("State",cust.getState());
            json.put("OutTime",cust.getOutTime());
            json.put("ExpectBackTime",cust.getExpectBackTime());
            json.put("Companion",cust.getCompanion());
            json.put("CompanionPhone",cust.getCompanionPhone());
            json.put("CompanionRelationship",cust.getCompanionRelationship());
            json.put("OutState",cust.getOutState());
            json.put("OutSort",cust.getOutSort());
            json.put("OutRemarks",cust.getOutRemarks());
            json.put("OutAppTime",cust.getOutAppTime());
            jsonarray.add(json);
        }
        System.out.println(jsonarray);
        return jsonarray.toString();
    }

    @RequestMapping("handleGoOutPermission")
    public void handleGoOutPermission(Customer cust) throws Exception{
        System.out.println("处理审核意见"+cust);
        String OutState=cust.getOutState();
        if(OutState.equals("通过"))
        {
            Boolean isSuccess=custBiz.AccerptGoOutPermission(cust);
            System.out.println("审核通过");
        }
        else
        {
            Boolean isSuccess=custBiz.DenyGoOutPermission(cust);
            System.out.println("审核不通过");
        }
    }

    @RequestMapping("getAllNamesWithState")
    public String getAllNamesWithState() throws Exception{
        List<String> names=custBiz.showAllNamesWithState();
        System.out.println("所有名字是："+names);
        JSONArray jsonarray=new JSONArray();
        for (String name:names)
        {
            JSONObject json=new JSONObject();
            json.put("Name",name);
            jsonarray.add(json);
        }
        return jsonarray.toString();
    }

    @RequestMapping("addgoout")
    public void addGoOut(Customer cust) throws Exception{
        String OutAppTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
        cust.setOutAppTime(OutAppTime);
        Boolean isSuccess=custBiz.addGoOut(cust);
        System.out.println(isSuccess?"success":"fail");
    }
}
