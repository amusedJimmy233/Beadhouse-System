<%--
  Created by IntelliJ IDEA.
  User: Jimmy
  Date: 2022/6/28
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>@import url("//unpkg.com/element-ui@2.15.7/lib/theme-chalk/index.css");</style>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.7/lib/index.js"></script>
    <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div id="app">
    <el-page-header @back="goBack" content="入住登记">
    </el-page-header><br>
    <el-button type="primary" @click="dialogFormVisible = true">登记入住</el-button><br>
    <el-dialog title="入住信息" :visible.sync="dialogFormVisible">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="客户姓名" prop="name" placeholder="请输入客户姓名">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="客户年龄" prop="age" placeholder="请输入客户年龄">
                <el-input v-model.number="ruleForm.age"></el-input>
            </el-form-item>
            <el-form-item label="客户性别" prop="sex">
                <el-select v-model="ruleForm.sex" placeholder="请选择客户性别">
                    <el-option label="男" value="男"></el-option>
                    <el-option label="女" value="女"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="身份证号" prop="identity" placeholder="请输入客户身份证号">
                <el-input v-model="ruleForm.identity"></el-input>
            </el-form-item>
            <el-form-item label="房间号" prop="room" placeholder="请输入客户房间号">
                <el-input v-model.number="ruleForm.room"></el-input>
            </el-form-item>
            <el-form-item label="老人类型" prop="health">
                <el-select v-model="ruleForm.health" placeholder="请选择老人类型">
                    <el-option label="活力老人" value="活力老人"></el-option>
                    <el-option label="自理老人" value="自理老人"></el-option>
                    <el-option label="护理老人" value="护理老人"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="入住时间" required>
                <el-col :span="11">
                    <el-form-item prop="date1">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="ruleForm.date1" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="合同到期时间" required>
                <el-col :span="11">
                    <el-form-item prop="date2">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="ruleForm.date2" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="陪同人姓名" prop="family" placeholder="请输入陪同人姓名">
                <el-input v-model="ruleForm.family"></el-input>
            </el-form-item>

            <el-form-item label="陪同人电话" prop="familyphone" placeholder="请输入陪同人电话">
                <el-input v-model.number="ruleForm.familyphone"></el-input>
            </el-form-item>

            <el-form-item label="客户状态" prop="state">
                <el-select v-model="ruleForm.state" placeholder="请选择客户状态">
                    <el-option label="住院" value="住院"></el-option>
                    <el-option label="离院" value="离院"></el-option>
                    <el-option label="暂离" value="暂离"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="入住备注" prop="startremarks" placeholder="请输入入住备注">
                <el-input v-model="ruleForm.startremarks"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>
    <el-dialog title="修改档案" :visible.sync="dialogEditFormVisible">
        <el-form :model="editForm" :rules="rules"  ref="editForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="客户姓名" prop="name" placeholder="请输入客户姓名">
                <el-input v-model="editForm.name"></el-input>
            </el-form-item>
            <el-form-item label="客户年龄" prop="age" placeholder="请输入客户年龄">
                <el-input v-model.number="editForm.age"></el-input>
            </el-form-item>
            <el-form-item label="客户性别" prop="sex">
                <el-select v-model="editForm.sex" placeholder="请选择客户性别">
                    <el-option label="男" value="男"></el-option>
                    <el-option label="女" value="女"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="身份证号" prop="identity" placeholder="请输入客户身份证号">
                <el-input v-model="editForm.identity"></el-input>
            </el-form-item>
            <el-form-item label="房间号" prop="room" placeholder="请输入客户房间号">
                <el-input v-model.number="editForm.room"></el-input>
            </el-form-item>
            <el-form-item label="老人类型" prop="health">
                <el-select v-model="editForm.health" placeholder="请选择老人类型">
                    <el-option label="活力老人" value="活力老人"></el-option>
                    <el-option label="自理老人" value="自理老人"></el-option>
                    <el-option label="护理老人" value="护理老人"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="入住时间" required>
                <el-col :span="11">
                    <el-form-item prop="date1">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.date1" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="合同到期时间" required>
                <el-col :span="11">
                    <el-form-item prop="date2">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.date2" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="陪同人姓名" prop="family" placeholder="请输入陪同人姓名">
                <el-input v-model="editForm.family"></el-input>
            </el-form-item>

            <el-form-item label="陪同人电话" prop="familyphone" placeholder="请输入陪同人电话">
                <el-input v-model.number="editForm.familyphone"></el-input>
            </el-form-item>

            <el-form-item label="客户状态" prop="state">
                <el-select v-model="editForm.state" placeholder="请选择客户状态">
                    <el-option label="住院" value="住院"></el-option>
                    <el-option label="离院" value="离院"></el-option>
                    <el-option label="暂离" value="暂离"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="入住备注" prop="startremarks" placeholder="请输入入住备注">
                <el-input v-model="editForm.startremarks"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submiteditForm('editForm')">立即修改</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>

    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="活力老人" name="first">
            <el-table
                    :data="firsttableData"
                    style="width: 100%">
                <el-table-column
                        prop="Cid"
                        label="档案号"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="CName"
                        label="姓名"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Age"
                        label="年龄"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Sex"
                        label="性别"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Identity"
                        label="身份证"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="Health"
                        label="类型"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Family"
                        label="联系人"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="FamilyPhone"
                        label="联系人电话"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="State"
                        label="状态"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Room"
                        label="房间号"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="StartTime"
                        label="入住时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="ExpireTime"
                        label="合同到期时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="StartRemarks"
                        label="入住备注"
                        width="200">
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button
                                size="mini"
                                @click="handleEdit(scope.row)">修改</el-button>
                        <el-button
                                size="mini"
                                type="danger"
                                @click="handleHide(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-tab-pane>
        <el-tab-pane label="自理老人" name="second">
            <el-table
                    :data="secondtableData"
                    style="width: 100%">
                <el-table-column
                        prop="Cid"
                        label="档案号"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="CName"
                        label="姓名"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Age"
                        label="年龄"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Sex"
                        label="性别"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Identity"
                        label="身份证"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="Health"
                        label="类型"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Family"
                        label="联系人"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="FamilyPhone"
                        label="联系人电话"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="State"
                        label="状态"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Room"
                        label="房间号"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="StartTime"
                        label="入住时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="ExpireTime"
                        label="合同到期时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="StartRemarks"
                        label="入住备注"
                        width="200">
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button
                                size="mini"
                                @click="handleEdit(scope.row)">修改</el-button>
                        <el-button
                                size="mini"
                                type="danger"
                                @click="handleHide(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-tab-pane>
        <el-tab-pane label="护理老人" name="third">
            <el-table
                    :data="thirdtableData"
                    style="width: 100%">
                <el-table-column
                        prop="Cid"
                        label="档案号"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="CName"
                        label="姓名"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Age"
                        label="年龄"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Sex"
                        label="性别"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Identity"
                        label="身份证"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="Health"
                        label="类型"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Family"
                        label="联系人"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="FamilyPhone"
                        label="联系人电话"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="State"
                        label="状态"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="Room"
                        label="房间号"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="StartTime"
                        label="入住时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="ExpireTime"
                        label="合同到期时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="StartRemarks"
                        label="入住备注"
                        width="200">
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button
                                size="mini"
                                @click="handleEdit(scope.row)">修改</el-button>
                        <el-button
                                size="mini"
                                type="danger"
                                @click="handleHide(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-tab-pane>
    </el-tabs>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                nowid:'',
                dialogFormVisible: false,
                dialogEditFormVisible: false,
                ruleForm: {
                    name: '',
                    age:'',
                    sex:'',
                    identity: '',
                    room:'',
                    health: '',
                    date1: '',
                    date2:'',
                    family:'',
                    familyphone:'',
                    state:'',
                    startremarks:''
                },
                editForm: {
                    name: '',
                    age:'',
                    identity: '',
                    room:'',
                    health: '',
                    date1: '',
                    date2:'',
                    family:'',
                    familyphone:'',
                    state:'',
                    startremarks:''
                },
                rules: {
                    name: [
                        { required: true, message: '请输入名字', trigger: 'blur' },
                    ],
                    age: [
                        { required: true, message: '年龄不能为空'},
                        { type: 'number', message: '年龄必须为数字值'}
                    ],
                    sex: [
                        { required: true, message: '请选择性别', trigger: 'change' }
                    ],
                    identity:[
                        {required:true,message:'输入身份证号'},
                        {min:18,max:18,message: '18位数字'}
                    ],
                    room:[
                        { required: true,message: '请输入房间号' },
                        { type: 'number', message: '房间号必须为数字值'}
                    ],
                    health: [
                        { required: true, message: '请选择类型', trigger: 'change' }
                    ],
                    date1: [
                        {  required: true, message: '请选择日期', trigger: 'change' }
                    ],
                    date2: [
                        {  required: true, message: '请选择日期', trigger: 'change' }
                    ],
                    family: [

                    ],
                    familyphone: [

                    ],
                    state:[
                        { required: true, message: '请选择状态', trigger: 'change' }
                    ],
                    startremarks:[

                    ]
                },
                formLabelWidth: '120px',
                activeName: 'first',
                firsttableData: [{}],
                secondtableData: [{}],
                thirdtableData: [{}],
            };
        },
        created(){
            this.showHUOLI()
            this.showZILI()
            this.showHULI()
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let params = new URLSearchParams();
                        params.append("CName",this.ruleForm.name)
                        params.append("Sex",this.ruleForm.sex)
                        params.append("Age",this.ruleForm.age)
                        params.append("Identity",this.ruleForm.identity)
                        params.append("Health",this.ruleForm.health)
                        params.append("Family",this.ruleForm.family)
                        params.append("FamilyPhone",this.ruleForm.familyphone)
                        params.append("State",this.ruleForm.state)
                        params.append("Room",this.ruleForm.room)
                        params.append("StartTime",this.ruleForm.date1)
                        params.append("ExpireTime",this.ruleForm.date2)
                        params.append("StartRemarks",this.ruleForm.startremarks)
                        console.log(this.ruleForm)
                        axios.post("http://localhost:8081/beadhouse/addCustomer",params).then(function (response){
                            location.reload()
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            handleClick(tab, event) {
                console.log(tab, event);
            },
            showHUOLI(){
                axios.post("http://localhost:8081/beadhouse/showHUOLI").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.firsttableData=content;
                    console.log(this.firsttableData)
                    this.loading=false;
                })
            },
            showZILI(){
                axios.post("http://localhost:8081/beadhouse/showZILI").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.secondtableData=content;
                    this.loading=false;
                })
            },
            showHULI(){
                axios.post("http://localhost:8081/beadhouse/showHULI").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.thirdtableData=content;
                    this.loading=false;
                })
            },
            handleHide(row){
                console.log(row.Cid)
                let params = new URLSearchParams();
                params.append("Cid",row.Cid)
                axios.post("http://localhost:8081/beadhouse/HideInfo",params).then(function (response){
                    location.reload()
                })
            },
            submiteditForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let params = new URLSearchParams();
                        params.append("CName",this.editForm.name)
                        params.append("Sex",this.editForm.sex)
                        params.append("Age",this.editForm.age)
                        params.append("Identity",this.editForm.identity)
                        params.append("Health",this.editForm.health)
                        params.append("Family",this.editForm.family)
                        params.append("FamilyPhone",this.editForm.familyphone)
                        params.append("State",this.editForm.state)
                        params.append("Room",this.editForm.room)
                        params.append("StartTime",this.editForm.date1)
                        params.append("ExpireTime",this.editForm.date2)
                        params.append("StartRemarks",this.editForm.startremarks)
                        params.append("Cid",this.nowid)
                        console.log(this.editForm)
                        axios.post("http://localhost:8081/beadhouse/updatecheckin",params).then(function (response){
                            location.reload()
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            handleEdit(row){
                this.dialogEditFormVisible = true
                this.nowid=row.Cid

                this.editForm.age=row.Age
                this.editForm.name=row.CName
                this.editForm.sex=row.Sex
                this.editForm.identity=row.Identity
                this.editForm.room=row.Room
                this.editForm.health=row.Health
                this.editForm.date1=row.StartTime
                this.editForm.date2=row.ExpireTime
                this.editForm.family=row.Family
                this.editForm.familyphone=row.FamilyPhone
                this.editForm.state=row.State
                this.editForm.startremarks=row.StartRemarks
                console.log(this.editForm.name)
            },
            goBack(){
                console.log('go back')
                window.history.go(-1)
            }
        }
    })
</script>
</html>

