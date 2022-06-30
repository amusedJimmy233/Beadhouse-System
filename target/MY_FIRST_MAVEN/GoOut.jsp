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
    <el-page-header @back="goBack" content="外出登记">
    </el-page-header><br>
    <el-button type="primary" @click="dialogFormVisible = true">登记外出</el-button><br>
    <el-dialog title="添加信息" :visible.sync="dialogFormVisible">
        <el-form :model="gooutForm" ref="gooutForm" label-width="100px" class="demo-ruleForm">

            <el-form-item label="客户" prop="name">
                <el-select v-model="gooutForm.name" placeholder="请选择客户" required>
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.Name"
                            :value="item.Name">
                    </el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="外出类型" prop="outsort" required>
                <el-select v-model="gooutForm.outsort" placeholder="请选择外出类型" allow-create filterable clearable>
                    <el-option label="有事外出" value="有事外出"></el-option>
                    <el-option label="外出散心" value="外出散心"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="外出时间" required>
                <el-col :span="11">
                    <el-form-item prop="outtime">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="gooutForm.outtime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="预计回来时间" required>
                <el-col :span="11">
                    <el-form-item prop="expectbacktime">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="gooutForm.expectbacktime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="陪同人员" prop="companion" placeholder="请输入陪同人姓名" required>
                <el-input v-model="gooutForm.companion"></el-input>
            </el-form-item>

            <el-form-item label="陪同人员与老人关系" prop="companionrelationship" placeholder="请输入陪同人与老人关系" required>
                <el-input v-model="gooutForm.companionrelationship"></el-input>
            </el-form-item>

            <el-form-item label="陪同人员电话" prop="companionphone" placeholder="请输入陪同人电话" required>
                <el-input v-model.number="gooutForm.companionphone"></el-input>
            </el-form-item>

            <el-form-item label="外出备注" prop="outremarks" placeholder="请输入外出备注" >
                <el-input v-model="gooutForm.outremarks"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submitgooutForm()">立即添加</el-button>
            </el-form-item>

        </el-form>
    </el-dialog>
    <el-dialog title="修改档案" :visible.sync="dialogEditFormVisible">
        <el-form :model="editForm" ref="editForm" label-width="100px" class="demo-ruleForm">
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

            <el-form-item label="外出类型" prop="outsort" required>
                <el-select v-model="editForm.outsort" placeholder="请选择外出类型" allow-create filterable clearable>
                    <el-option label="有事外出" value="有事外出"></el-option>
                    <el-option label="外出散心" value="外出散心"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="外出时间" required>
                <el-col :span="11">
                    <el-form-item prop="outtime">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.outtime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="预计回来时间" required>
                <el-col :span="11">
                    <el-form-item prop="expectbacktime">
                        <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                        value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.expectbacktime" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                </el-col>
            </el-form-item>

            <el-form-item label="陪同人员" prop="companion" placeholder="请输入陪同人姓名" required>
                <el-input v-model="editForm.companion"></el-input>
            </el-form-item>

            <el-form-item label="陪同人员与老人关系" prop="companionrelationship" placeholder="请输入陪同人与老人关系" required>
                <el-input v-model="editForm.companionrelationship"></el-input>
            </el-form-item>

            <el-form-item label="陪同人员电话" prop="companionphone" placeholder="请输入陪同人电话" required>
                <el-input v-model.number="editForm.companionphone"></el-input>
            </el-form-item>

            <el-form-item label="外出备注" prop="outremarks" placeholder="请输入外出备注" >
                <el-input v-model="editForm.outremarks"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submiteditForm()">立即修改</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>
    <el-dialog title="审核" :visible.sync="dialogPermissionFormVisible">
        <el-form :model="permissionForm" ref="permissionForm" label-width="100px" class="demo-ruleForm">

            <el-form-item label="审核状态" prop="outstate" required>
                <el-select v-model="permissionForm.outstate" placeholder="请选择审核状态">
                    <el-option label="通过" value="通过"></el-option>
                    <el-option label="不通过" value="不通过"></el-option>
                    <el-option label="撤销" value="无"></el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="审核备注" prop="outremarks" placeholder="请输入审核意见">
                <el-input v-model="permissionForm.outremarks"></el-input>
            </el-form-item>


            <el-form-item>
                <el-button type="primary" @click="submitpermisssionForm()">立即修改</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>

    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="外出情况" name="first">
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
                        prop="OutSort"
                        label="外出原因"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="OutTime"
                        label="外出时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="ExpectBackTime"
                        label="预计回来时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="Companion"
                        label="陪同人姓名"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="CompanionPhone"
                        label="陪同人电话"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="OutState"
                        label="外出审批情况"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="OutRemarks"
                        label="外出备注"
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
                        prop="OutTime"
                        label="入住时间"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="OutSort"
                        label="外出理由"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="ExpectBackTime"
                        label="预计回来时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="OutAppTime"
                        label="外出申请时间"
                        width="130">
                </el-table-column>
                <el-table-column
                        prop="Companion"
                        label="陪同人姓名"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="CompanionRelationship"
                        label="陪同人与老人关系"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="CompanionPhone"
                        label="陪同人电话"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="OutState"
                        label="外出情况"
                        width="100">
                </el-table-column>
                <el-table-column
                        prop="OutRemarks"
                        label="外出备注"
                        width="180">
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
                gooutForm:{
                    name:'',
                    outsort:'',
                    outtime:'',
                    expectbacktime:'',
                    companion:'',
                    companionphone:'',
                    companionrelationship:'',
                    outremarks:'',
                },
                editForm: {
                    name: '',
                    age:'',
                    sex:'',
                    identity: '',
                    outsort:'',
                    outtime:'',
                    expectbacktime:'',
                    companion:'',
                    companionphone:'',
                    companionrelationship:'',
                    outremarks:'',
                },
                permissionForm:{
                    outstate:'',
                    outremarks:''
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
                axios.post("http://localhost:8081/beadhouse/ShowGoOut").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.firsttableData=content;
                    this.loading=false;
                })
            },
            ShowNames(){
                axios.post("http://localhost:8081/beadhouse/getAllNamesWithState").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.options=content;
                    this.loading=false;
                    console.log(this.options)
                })
            },
            ShowWaitPermission(){
                axios.post("http://localhost:8081/beadhouse/ShowGoOutWaitPermission").then(function (response){
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

                this.editForm.name=row.CName
                this.editForm.age=row.Age
                this.editForm.sex=row.Sex
                this.editForm.identity=row.Identity
                this.editForm.outsort=row.OutSort
                this.editForm.outtime=row.OutTime
                this.editForm.expectbacktime=row.ExpectBackTime
                this.editForm.companion=row.Companion
                this.editForm.companionphone=row.CompanionPhone
                this.editForm.companionrelationship=row.CompanionRelationship
                this.editForm.outremarks=row.OutRemarks
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
                console.log(this.permissionForm)
                params.append("OutState",this.permissionForm.outstate)
                params.append("OutRemarks",this.permissionForm.outremarks)
                params.append("Cid",this.nowid)
                axios.post("http://localhost:8081/beadhouse/handleGoOutPermission",params).then(function (response){
                    location.reload()
                })
            },
            submitgooutForm(){
                let params = new URLSearchParams();
                params.append("CName",this.gooutForm.name)
                params.append("OutTime",this.gooutForm.outtime)
                params.append("ExpectBackTime",this.gooutForm.expectbacktime)
                params.append("OutSort",this.gooutForm.outsort)
                params.append("Companion",this.gooutForm.companion)
                params.append("CompanionPhone",this.gooutForm.companionphone)
                params.append("CompanionRelationship",this.gooutForm.companionrelationship)
                params.append("OutRemarks",this.gooutForm.outremarks)
                console.log(params)
                axios.post("http://localhost:8081/beadhouse/addgoout",params).then(function (response){
                    location.reload()
                })
            }
        }
    })
</script>
</html>
