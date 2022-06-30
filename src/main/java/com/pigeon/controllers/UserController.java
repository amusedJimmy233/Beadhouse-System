package com.pigeon.controllers;

import com.pigeon.biz.IUserBiz;
import com.pigeon.entity.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RestController
public class UserController {
    @Resource
    IUserBiz userBiz;

    @RequestMapping("login")
    public String login(User user) throws Exception{
        System.out.println("账户信息是"+user);
        String username=user.getUsername();
        String password=user.getPassword();
        String CorrectPassword=userBiz.getpswd(username);
        System.out.println("正确密码是"+CorrectPassword);
        if (password.equals(CorrectPassword)){
            System.out.println("登录成功");
            return "Success";
        }
        else{
            System.out.println("登录失败");
            return "Fail";
        }
    }

    @RequestMapping("LoginSuccess")
    public ModelAndView LoginSuccess()throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("index.jsp");
        return mv;
    }
}
