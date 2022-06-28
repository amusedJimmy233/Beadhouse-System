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
    <el-button type="primary" @click="dialogFormVisible = true">登记入住</el-button>

    <el-dialog title="收货地址" :visible.sync="dialogFormVisible">
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

    <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="活力老人" name="first">
            <el-table
                    :data="firsttableData"
                    style="width: 100%">
                <el-table-column
                        prop="date"
                        label="日期"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="name"
                        label="姓名"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="address"
                        label="地址">
                </el-table-column>
            </el-table>
        </el-tab-pane>

        <el-tab-pane label="自理老人" name="second">
                <el-table
                        :data="secondtableData"
                        style="width: 100%">
                    <el-table-column
                            prop="date"
                            label="日期"
                            width="180">
                    </el-table-column>
                    <el-table-column
                            prop="name"
                            label="姓名"
                            width="180">
                    </el-table-column>
                    <el-table-column
                            prop="address"
                            label="地址">
                    </el-table-column>
                </el-table>
        </el-tab-pane>
        <el-tab-pane label="护理老人" name="third">护理老人</el-tab-pane>
    </el-tabs>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                dialogFormVisible: false,
                ruleForm: {
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
                activeName: 'second',
                firsttableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1517 弄'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1519 弄'
                }, {
                    date: '2016-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1516 弄'
                }],
                secondtableData: [{
                    date: '2022-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2022-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1517 弄'
                }, {
                    date: '2022-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1519 弄'
                }, {
                    date: '2022-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1516 弄'
                }]
            };
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
            }
        }
    })
</script>
</html>

