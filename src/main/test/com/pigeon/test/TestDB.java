package com.pigeon.test;

import com.pigeon.dao.ICustDao;
import com.pigeon.entity.Customer;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

    @Test
    //添加信息
    public void testInsertCustomer() throws ParseException {
        //获取连接
        SqlSession sqlSession= sqlSessionFactory.openSession();

        //获取Dao对象
        ICustDao deptDao=sqlSession.getMapper(ICustDao.class);

        //要添加的部门信息
        Customer cust=new Customer();
        cust.setCName("张三");
        cust.setAge(80);
        cust.setSex("男");
        cust.setIdentity("110101193210011414");
        cust.setHealth("活力老人");
        cust.setFamily("张三的女儿");
        cust.setFamilyPhone("18971588962");
        cust.setState("住院");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = "2019-01-03";
        Date date = simpleDateFormat.parse(dateStr);

//        cust.setExpireTime("2022-06-28");


        int result=deptDao.insertCustomer(cust);

        //判断结果
        System.out.println(result>0?"添加成功":"添加失败");

        sqlSession.close();
    }

    @Test
    public void testSelectLAOREN(){
        //获取连接
        SqlSession sqlSession= sqlSessionFactory.openSession();

        //获取Dao对象
        ICustDao custDao=sqlSession.getMapper(ICustDao.class);

        //调用方法查询指定编号的部门信息集合
        List<Customer> depts = custDao.selectHUOLILAOREN();

        if (depts!=null){
            //找到信息，遍历输出(forEach写法)
            depts.forEach(System.out::println);
        }
        else{
            System.out.println("没有找到指定的部门");
        }

        sqlSession.close();
    }

    @Test
    //删除信息
    public void testDeleteCustomer() throws ParseException {
        //获取连接
        SqlSession sqlSession = sqlSessionFactory.openSession();

        //获取Dao对象
        ICustDao custDao = sqlSession.getMapper(ICustDao.class);

        int result = custDao.deleteCustomer(2);

        //判断结果
        System.out.println(result>0?"添加成功":"添加失败");

        sqlSession.close();
    }

    @Test
    //删除信息
    public void testselectCustomer() throws ParseException {
        //获取连接
        SqlSession sqlSession = sqlSessionFactory.openSession();

        //获取Dao对象
        ICustDao custDao = sqlSession.getMapper(ICustDao.class);

        Customer cust = custDao.getcustinfo(13);

        //判断结果
        System.out.println(cust);

        sqlSession.close();
    }

    @Test
    //获取所有身份证号
    public void testgetids() throws ParseException {
        //获取连接
        SqlSession sqlSession = sqlSessionFactory.openSession();

        //获取Dao对象
        ICustDao custDao = sqlSession.getMapper(ICustDao.class);

        List<String> ids=custDao.selectAllIDs();

        //判断结果
        System.out.println(ids);

        sqlSession.close();
    }

    @Test
    //获取当前时间（string）
    public void getnowtime(){
        String EndTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
        System.out.println(EndTime);
    }
}
