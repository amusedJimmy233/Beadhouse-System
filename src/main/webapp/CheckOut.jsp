<%--
  Created by IntelliJ IDEA.
  User: Jimmy
  Date: 2022/6/29
  Time: 20:17
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
    <el-page-header @back="goBack" content="退住登记">
    </el-page-header><br>
    <el-button type="primary" @click="dialogFormVisible = true">退住登记</el-button><br>
    <el-dialog title="添加信息" :visible.sync="dialogFormVisible">
        <el-form :model="checkoutForm" ref="checkoutForm" label-width="100px" class="demo-ruleForm">

            <el-form-item label="客户" prop="name">
                <el-select v-model="checkoutForm.name" placeholder="请选择客户" required>
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.Name"
                            :value="item.Name">
                    </el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="退住类型" prop="endsort" required>
                <el-select v-model="checkoutForm.endsort" placeholder="请选择退住类型">
                    <el-option label="正常退住" value="正常退住"></el-option>
                    <el-option label="死亡退住" value="死亡退住"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="退住时间" required>
                <el-col :span="11">
                    <el-form-item prop="endtime">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="checkoutForm.endtime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="退住理由" prop="endreason" placeholder="请输入退住理由" required>
                <el-input v-model="checkoutForm.endreason"></el-input>
            </el-form-item>

            <el-form-item label="退住备注" prop="endremarks" placeholder="请输入退住备注" >
                <el-input v-model="checkoutForm.endremarks"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submitcheckoutForm()">立即添加</el-button>
            </el-form-item>

        </el-form>
    </el-dialog>
    <el-dialog title="修改档案" :visible.sync="dialogEditFormVisible">
        <el-form :model="editForm" :rules="rules"  ref="editForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="客户姓名" prop="name" placeholder="请输入客户姓名" required>
                <el-input v-model="editForm.name"></el-input>
            </el-form-item>
            <el-form-item label="客户年龄" prop="age" placeholder="请输入客户年龄" required>
                <el-input v-model.number="editForm.age"></el-input>
            </el-form-item>
            <el-form-item label="客户性别" prop="sex">
                <el-select v-model="editForm.sex" placeholder="请选择客户性别" required>
                    <el-option label="男" value="男"></el-option>
                    <el-option label="女" value="女"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="身份证号" prop="identity" placeholder="请输入客户身份证号" required>
                <el-input v-model="editForm.identity"></el-input>
            </el-form-item>

            <el-form-item label="客户状态" prop="state" required>
                <el-select v-model="editForm.state" placeholder="请选择客户状态">
                    <el-option label="住院" value="住院"></el-option>
                    <el-option label="离院" value="离院"></el-option>
                    <el-option label="暂离" value="暂离"></el-option>
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

            <el-form-item label="退住时间" required>
                <el-col :span="11">
                    <el-form-item prop="date2">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.date2" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="退住类型" prop="endsort" required>
                <el-select v-model="editForm.endsort" placeholder="请选择退住类型">
                    <el-option label="正常退住" value="正常退住"></el-option>
                    <el-option label="死亡退住" value="死亡退住"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="退住理由" prop="endreason" placeholder="请输入退住理由">
                <el-input v-model="editForm.endreason"></el-input>
            </el-form-item>

            <el-form-item label="退住申请时间" required>
                <el-col :span="11">
                    <el-form-item prop="date3">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.date3" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="退住情况" prop="endstate" required>
                <el-select v-model="editForm.endstate" placeholder="请选择退住情况">
                    <el-option label="通过" value="通过"></el-option>
                    <el-option label="不通过" value="不通过"></el-option>
                    <el-option label="待审批" value="待审批"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="退住备注" prop="endremarks" placeholder="请输入退住备注">
                <el-input v-model="editForm.endremarks"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submiteditForm()">立即修改</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>
    <el-dialog title="审核" :visible.sync="dialogPermissionFormVisible">
        <el-form :model="permissionForm" ref="permissionForm" label-width="100px" class="demo-ruleForm">

            <el-form-item label="审核状态" prop="endstate" required>
                <el-select v-model="permissionForm.endstate" placeholder="请选择审核状态">
                    <el-option label="通过" value="通过"></el-option>
                    <el-option label="不通过" value="不通过"></el-option>
                    <el-option label="撤销" value="无"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="审核备注" prop="endremarks" placeholder="请输入审核意见">
                <el-input v-model="permissionForm.endremarks"></el-input>
            </el-form-item>


            <el-form-item>
                <el-button type="primary" @click="submitpermisssionForm()">立即修改</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>

    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="退住情况" name="first">
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
                        prop="State"
                        label="状态"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="StartTime"
                        label="入住时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="EndTime"
                        label="退住时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="EndSort"
                        label="退住类型"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="EndReason"
                        label="退住理由"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="EndAppTime"
                        label="退住申请时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="EndState"
                        label="退住情况"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="EndRemarks"
                        label="退住备注"
                        width="180">
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
        <el-tab-pane label="待审核" name="second">
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
                        prop="State"
                        label="状态"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="StartTime"
                        label="入住时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="EndSort"
                        label="退住类型"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="EndReason"
                        label="退住理由"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="EndAppTime"
                        label="退住申请时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="EndState"
                        label="退住情况"
                        width="100">
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button
                                size="mini"
                                type="success"
                                @click="handlePermission(scope.row)">审核</el-button>
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
                options: [{}],
                nowid:'',
                dialogFormVisible: false,
                dialogPermissionFormVisible: false,
                dialogEditFormVisible:false,
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
                checkoutForm:{
                    name:'',
                    endsort:'',
                    endreason:'',
                    endtime:'',
                    endremarks:'',
                },
                editForm: {
                    name: '',
                    age:'',
                    identity: '',
                    state:'',
                    date1: '',
                    date2:'',
                    endsort:'',
                    endreason:'',
                    date3:'',
                    endstate: '',
                    endremarks:''
                },
                permissionForm:{
                    endstate:'',
                    endremarks:''
                },
                formLabelWidth: '120px',
                activeName: 'first',
                firsttableData: [{}],
                secondtableData: [{}],
            };
        },
        created(){
            this.ShowCheckOut()
            this.ShowWaitPermission()
            this.ShowNames()
        },
        methods: {
            ShowCheckOut(){
                axios.post("http://localhost:8081/beadhouse/ShowCheckOut").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.firsttableData=content;
                    this.loading=false;
                })
            },
            ShowNames(){
                axios.post("http://localhost:8081/beadhouse/getAllNames").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.options=content;
                    this.loading=false;
                    console.log(this.options)
                })
            },
            ShowWaitPermission(){
                axios.post("http://localhost:8081/beadhouse/ShowWaitPermission").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.secondtableData=content;
                    this.loading=false;
                })
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            handleClick(tab, event) {
                console.log(tab, event);
            },
            handleHide(row){
                console.log(row.Cid)
                let params = new URLSearchParams();
                params.append("Cid",row.Cid)
                axios.post("http://localhost:8081/beadhouse/HideInfo",params).then(function (response){
                    location.reload()
                })
            },
            handleEdit(row){
                this.dialogEditFormVisible = true
                this.nowid=row.Cid

                this.editForm.age=row.Age
                this.editForm.name=row.CName
                this.editForm.sex=row.Sex
                this.editForm.identity=row.Identity
                this.editForm.date1=row.StartTime
                this.editForm.date2=row.EndTime
                this.editForm.state=row.State
                this.editForm.endsort=row.EndSort
                this.editForm.endreason=row.EndReason
                this.editForm.date3=row.EndAppTime
                this.editForm.endstate=row.EndState
                this.editForm.endremarks=row.EndRemarks
                console.log(this.editForm.date3)
            },
            goBack(){
                console.log('go back')
                window.history.go(-1)
            },
            handlePermission(row){
                this.dialogPermissionFormVisible = true
                this.nowid=row.Cid
            },
            submitpermisssionForm(){
                let params = new URLSearchParams();
                params.append("EndState",this.permissionForm.endstate)
                params.append("EndRemarks",this.permissionForm.endremarks)
                params.append("Cid",this.nowid)
                axios.post("http://localhost:8081/beadhouse/handlePermission",params).then(function (response){
                    location.reload()
                })
            },
            submitcheckoutForm(){
                let params = new URLSearchParams();
                params.append("CName",this.checkoutForm.name)
                params.append("EndTime",this.checkoutForm.endtime)
                params.append("EndSort",this.checkoutForm.endsort)
                params.append("EndReason",this.checkoutForm.endreason)
                params.append("EndRemarks",this.checkoutForm.endremarks)
                console.log(params)
                axios.post("http://localhost:8081/beadhouse/addcheckout",params).then(function (response){
                    location.reload()
                })
            }
        }
    })
</script>
</html>
