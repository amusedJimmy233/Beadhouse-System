<%--
  Created by IntelliJ IDEA.
  User: Jimmy
  Date: 2022/6/28
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="addCustomer" method="post">
    客户名：<input name="cName" required><br>
    客户性别：<input type="radio" name="Sex" value="男">男<input type="radio" name="Sex" value="女">女<br>
    客户年龄：<input name="Age" required><br>
    客户身份证：<input name="identity" required><br>
    客户类型：
                <input type="radio" name="Health" value="活力老人">活力老人</input>
                <input type="radio" name="Health" value="自理老人">自理老人</input>
                <input type="radio" name="Health" value="护理老人">护理老人</input><br>
    客户陪同人：<input name="Family"><br>
    陪同人电话：<input name="FamilyPhone"><br>
    客户状态：
                <input type="radio" name="State" value="住院">住院</option>
                <input type="radio" name="State" value="离院">离院</option><br>
    客户入住时间:<input type="date" name="StartTime"><br>
    合同到期时间：<input type="date" name="ExpireTime"><br>
    入住房间号：<input name="Room"><br>
    入住备注：<input name="StartRemarks"><br>
    <button>点击添加</button>&nbsp;<button type="reset">重置</button>
</form>
</body>
</html>
