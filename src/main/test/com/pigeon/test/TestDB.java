package com.pigeon.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring-mybatis.xml")
public class TestDB {
    //@Test的函数必须void且没有参数
    //直接在函数名上右键运行即可测试单个函数的结果
    @Test
    public void testMethod(){
        System.out.println("test success");
    }

    //测试MyBatis的SqlSessionFactory是否成功
    @Resource
    SqlSessionFactory sqlSessionFactory;

    //测试连接
    @Test
    public void testGetConnection(){
        SqlSession sqlSession= sqlSessionFactory.openSession();
        //如果连接成功，isClosed()函数应该返回false
        try{
            System.out.println(sqlSession.getConnection().isClosed());
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
