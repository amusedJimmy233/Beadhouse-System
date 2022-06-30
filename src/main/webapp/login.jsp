<%--
  Created by IntelliJ IDEA.
  User: Jimmy
  Date: 2022/6/30
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>@import url("//unpkg.com/element-ui@2.15.7/lib/theme-chalk/index.css");</style>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.7/lib/index.js"></script>
    <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="app">
    <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="用户名">
            <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="密码">
            <el-input v-model="form.password" show-password></el-input>
        </el-form-item>
        <el-button type="primary" @click="onSubmit">登录</el-button>
    </el-form>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                form:{
                    username:'',
                    password:''
                }
            }
        },
        created(){

        },
        methods: {
            onSubmit(){
                let params = new URLSearchParams();
                params.append("Username",this.form.username)
                params.append("Password",this.form.password)
                axios.post("http://localhost:8081/beadhouse/login",params).then(function (response){
                    console.log(response)
                    if(response.data==='Success'){
                        window.location.href="http://localhost:8081/beadhouse/LoginSuccess"
                    }
                    else {
                        alert("密码错误！")
                        location.reload()
                    }
                })
            }
        }
    })
</script>
</html>
