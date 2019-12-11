<template>
  <a-drawer
    :title="title"
    :width="width"
    placement="right"
    :closable="false"
    @close="close"
    :visible="visible">
  
    <a-spin :spinning="confirmLoading">
      <a-form :form="form">

        <a-form-item label="部门" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'department', validatorRules.department]" placeholder="请输入部门"></a-input>
        </a-form-item>
        <a-form-item label="单元" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'unit', validatorRules.unit]" placeholder="请输入单元"></a-input>
        </a-form-item>
        <a-form-item label="姓名" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'name', validatorRules.name]" placeholder="请输入姓名"></a-input>
        </a-form-item>
        <a-form-item label="员工编码" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'employeeCode', validatorRules.employeeCode]" placeholder="请输入员工编码"></a-input>
        </a-form-item>
        <a-form-item label="岗位" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'position', validatorRules.position]" placeholder="请输入岗位"></a-input>
        </a-form-item>
        <a-form-item label="用工形式" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'employeeType', validatorRules.employeeType]" placeholder="请输入用工形式"></a-input>
        </a-form-item>
        <a-form-item label="备注" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'remark', validatorRules.remark]" placeholder="请输入备注"></a-input>
        </a-form-item>
        
      </a-form>
    </a-spin>
    <a-button type="primary" @click="handleOk">确定</a-button>
    <a-button type="primary" @click="handleCancel">取消</a-button>
  </a-drawer>
</template>

<script>

  import { httpAction } from '@/api/manage'
  import pick from 'lodash.pick'
  
  export default {
    name: "BizGroupCustormerModal",
    components: { 
    },
    data () {
      return {
        form: this.$form.createForm(this),
        title:"操作",
        width:800,
        visible: false,
        model: {},
        labelCol: {
          xs: { span: 24 },
          sm: { span: 5 },
        },
        wrapperCol: {
          xs: { span: 24 },
          sm: { span: 16 },
        },

        confirmLoading: false,
        validatorRules:{
        department:{rules: [{ required: true, message: '请输入部门!' }]},
        unit:{rules: [{ required: true, message: '请输入单元!' }]},
        name:{rules: [{ required: true, message: '请输入姓名!' }]},
        employeeCode:{rules: [{ required: true, message: '请输入员工编码!' }]},
        position:{rules: [{ required: true, message: '请输入岗位!' }]},
        employeeType:{rules: [{ required: true, message: '请输入用工形式!' }]},
        remark:{},
        },
        url: {
          add: "/ict/bizGroupCustormer/add",
          edit: "/ict/bizGroupCustormer/edit",
        }
     
      }
    },
    created () {
    },
    methods: {
      add () {
        this.edit({});
      },
      edit (record) {
        this.form.resetFields();
        this.model = Object.assign({}, record);
        this.visible = true;
        this.$nextTick(() => {
          this.form.setFieldsValue(pick(this.model,'department','unit','name','employeeCode','position','employeeType','remark'))
        })
      },
      close () {
        this.$emit('close');
        this.visible = false;
      },
      handleOk () {
        const that = this;
        // 触发表单验证
        this.form.validateFields((err, values) => {
          if (!err) {
            that.confirmLoading = true;
            let httpurl = '';
            let method = '';
            if(!this.model.id){
              httpurl+=this.url.add;
              method = 'post';
            }else{
              httpurl+=this.url.edit;
               method = 'put';
            }
            let formData = Object.assign(this.model, values);
            console.log("表单提交数据",formData)
            httpAction(httpurl,formData,method).then((res)=>{
              if(res.success){
                that.$message.success(res.message);
                that.$emit('ok');
              }else{
                that.$message.warning(res.message);
              }
            }).finally(() => {
              that.confirmLoading = false;
              that.close();
            })
          }
         
        })
      },
      handleCancel () {
        this.close()
      },
      popupCallback(row){
        this.form.setFieldsValue(pick(row,'department','unit','name','employeeCode','position','employeeType','remark'))
      }
      
    }
  }
</script>

<style lang="less" scoped>
/** Button按钮间距 */
  .ant-btn {
    margin-left: 30px;
    margin-bottom: 30px;
    float: right;
  }
</style>