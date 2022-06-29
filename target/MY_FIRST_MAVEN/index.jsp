<%--
  Created by IntelliJ IDEA.
  User: Jimmy
  Date: 2022/6/27
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>@import url("//unpkg.com/element-ui@2.15.7/lib/theme-chalk/index.css");</style>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.7/lib/index.js"></script>
</head>
<body>
<div id="app">
    <el-button type="primary" round @click="to_checkin">入住登记</el-button>
    <el-button type="primary" round @click="to_customers">客户信息</el-button>
    <el-button type="primary" round @click="to_GoOut">外出登记</el-button>
    <el-button type="primary" round @click="to_CheckOut">退出登记</el-button>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        data(){
            return{

            }
        },
        methods: {
            to_checkin(){
                window.location.href="CheckIn.jsp"
            },
            to_customers(){
                window.location.href="customers.jsp"
            },
            to_GoOut(){
                window.location.href="GoOut.jsp"
            },
            to_CheckOut(){
                window.location.href="CheckOut.jsp"
            }
        }
    })
</script>
</html>

