<%--
  Created by IntelliJ IDEA.
  User: Jimmy
  Date: 2022/6/29
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <style>@import url("//unpkg.com/element-ui@2.15.7/lib/theme-chalk/index.css");</style>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
        <script src="//unpkg.com/element-ui@2.15.7/lib/index.js"></script>
        <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
    </head>
</head>
<body>
    <div id="app">
        <el-page-header @back="goBack" content="客户信息">
        </el-page-header>
        <br>
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

                <el-form-item label="退住时间" required>
                    <el-col :span="11">
                        <el-form-item prop="endtime">
                            <el-date-picker type="date" format="yyyy 年 MM 月 dd 日"
                                            value-format="yyyy-MM-dd" placeholder="选择日期" v-model="editForm.endtime" style="width: 100%;"></el-date-picker>
                        </el-form-item>
                    </el-col>
                </el-form-item>

                <el-form-item label="退住类型" prop="endsort">
                    <el-select v-model="editForm.endsort" placeholder="请选择退住类型">
                        <el-option label="正常退住" value="正常退住"></el-option>
                        <el-option label="死亡退住" value="死亡退住"></el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="退住办理情况" prop="endstate">
                    <el-select v-model="editForm.endstate" placeholder="请选择退住办理情况">
                        <el-option label="待审批" value="待审批"></el-option>
                        <el-option label="通过" value="通过"></el-option>
                        <el-option label="拒绝" value="拒绝"></el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="退住备注" prop="endremarks" placeholder="请输入入住备注">
                    <el-input v-model="editForm.endremarks"></el-input>
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" @click="submiteditForm('editForm')">立即修改</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>
        <el-table
                :data="CustomerTable"
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
                    width="50">
            </el-table-column>
            <el-table-column
                    prop="Sex"
                    label="性别"
                    width="50">
            </el-table-column>
            <el-table-column
                    prop="Identity"
                    label="身份证"
                    width="190">
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
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="ExpireTime"
                    label="合同到期时间"
                    width="130">
            </el-table-column>
            <el-table-column
                    prop="StartRemarks"
                    label="入住备注"
                    width="200">
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
                    prop="EndState"
                    label="退住情况"
                    width="100">
            </el-table-column>
            <el-table-column
                    prop="EndRemarks"
                    label="退住备注"
                    width="180">
            </el-table-column>
            <el-table-column label="操作" width="300">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            @click="handleEdit(scope.row)">修改</el-button>
                    <el-button
                            size="mini"
                            type="danger"
                            @click="handleDelete(scope.row)">删除</el-button>
                    <el-button
                            size="mini"
                            type="success"
                            @click="handleShow(scope.row)">恢复显示</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</body>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                visible:false,
                dialogEditFormVisible:false,
                CustomerTable:[{}],
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
                    startremarks:'',
                    endsort:'',
                    endtime:'',
                    endstate:'',
                    endreason:'',
                    endremarks:''
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
            };
        },
        created(){
            this.ShowAllCustomers()
        },
        methods: {
            ShowAllCustomers(){
                axios.post("http://localhost:8081/beadhouse/showAllCustomers").then(function (response){
                    return response.data;
                }).then(content=>{
                    this.CustomerTable=content
                    this.loading=false
                })
            },
            goBack(){
                console.log('go back')
                window.history.go(-1)
            },
            handleDelete(row){
                console.log(row.Cid)
                this.nowid=row.Cid
                this.submitdelete()
            },
            submitdelete(){
                let params = new URLSearchParams();
                params.append("Cid",this.nowid)
                axios.post("http://localhost:8081/beadhouse/deleteCustomer",params).then(function (response){
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
                this.editForm.room=row.Room
                this.editForm.health=row.Health
                this.editForm.date1=row.StartTime
                this.editForm.date2=row.ExpireTime
                this.editForm.family=row.Family
                this.editForm.familyphone=row.FamilyPhone
                this.editForm.state=row.State
                this.editForm.startremarks=row.StartRemarks
                this.editForm.endtime=row.EndTime
                this.editForm.endstate=row.EndState
                this.editForm.endsort=row.EndSort
                this.editForm.endreason=row.EndReason
                this.editForm.endremarks=row.EndRemarks

                console.log(this.editForm.name)
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
                        params.append("EndTime",this.editForm.endtime)
                        params.append("EndState",this.editForm.endstate)
                        params.append("EndSort",this.editForm.endsort)
                        params.append("EndReason",this.editForm.endreason)
                        params.append("EndRemarks",this.editForm.endremarks)
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
            handleShow(row){
                console.log(row.Cid)
                let params = new URLSearchParams();
                params.append("Cid",row.Cid)
                axios.post("http://localhost:8081/beadhouse/ShowInfo",params).then(function (response){
                    location.reload()
                })
            },
        }
    })
</script>
</html>
