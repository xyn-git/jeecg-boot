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

        <a-form-item label="ICT收入合同编号" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'ictContractNumber', validatorRules.ictContractNumber]" placeholder="请输入ICT收入合同编号"></a-input>
        </a-form-item>
        <a-form-item label="ICT支出合同编号" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'ictConstructionContractNumber', validatorRules.ictConstructionContractNumber]" placeholder="请输入ICT支出合同编号"></a-input>
        </a-form-item>
        <a-form-item label="项目名称" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectName', validatorRules.projectName]" placeholder="请输入项目名称"></a-input>
        </a-form-item>
        <a-form-item label="项目类别" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-dict-select-tag type="list" v-decorator="['projectType']" :trigger-change="true" dictCode="ict_project_type" placeholder="请选择项目类别"/>
        </a-form-item>
        <a-form-item label="协议金额-ICT" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'ictAmount', validatorRules.ictAmount]" placeholder="请输入协议金额-ICT"></a-input>
        </a-form-item>
        <a-form-item label="ICT税率" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'itRate', validatorRules.itRate]" placeholder="请输入ICT税率" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="协议金额-设备" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'deviceAmount', validatorRules.deviceAmount]" placeholder="请输入协议金额-设备"></a-input>
        </a-form-item>
        <a-form-item label="设备税率" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'deviceRate', validatorRules.deviceRate]" placeholder="请输入设备税率" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="合同签订日期" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-date placeholder="请选择合同签订日期" v-decorator="[ 'signingDate', validatorRules.signingDate]" :trigger-change="true" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="甲方单位" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'partyA', validatorRules.partyA]" placeholder="请输入甲方单位"></a-input>
        </a-form-item>
        <a-form-item label="承办部门" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'organizer', validatorRules.organizer]" placeholder="请输入承办部门"></a-input>
        </a-form-item>
        <a-form-item label="归属行业" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'trade', validatorRules.trade]" placeholder="请输入归属行业"></a-input>
        </a-form-item>
        <a-form-item label="发展人" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'accountManager', validatorRules.accountManager]" placeholder="请输入发展人"></a-input>
        </a-form-item>
        <a-form-item label="发展人编码" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'accountManagerNumber', validatorRules.accountManagerNumber]" placeholder="请输入发展人编码"></a-input>
        </a-form-item>
        <a-form-item label="项目经理" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectManager', validatorRules.projectManager]" placeholder="请输入项目经理"></a-input>
        </a-form-item>
        <a-form-item label="项目状态" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-dict-select-tag type="list" v-decorator="['projectStatus']" :trigger-change="true" dictCode="ict_project_status" placeholder="请选择项目状态"/>
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
  import JDate from '@/components/jeecg/JDate'  
  import JDictSelectTag from "@/components/dict/JDictSelectTag"
  
  export default {
    name: "BizIctContractModal",
    components: { 
      JDate,
      JDictSelectTag,
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
        ictContractNumber:{rules: [{ required: true, message: '请输入ICT收入合同编号!' }]},
        ictConstructionContractNumber:{},
        projectName:{rules: [{ required: true, message: '请输入项目名称!' }]},
        projectType:{},
        ictAmount:{},
        itRate:{},
        deviceAmount:{},
        deviceRate:{},
        signingDate:{},
        partyA:{rules: [{ required: true, message: '请输入甲方单位!' }]},
        organizer:{},
        trade:{},
        accountManager:{},
        accountManagerNumber:{},
        projectManager:{},
        projectStatus:{},
        remark:{},
        },
        url: {
          add: "/ict/bizIctContract/add",
          edit: "/ict/bizIctContract/edit",
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
          this.form.setFieldsValue(pick(this.model,'ictContractNumber','ictConstructionContractNumber','projectName','projectType','ictAmount','itRate','deviceAmount','deviceRate','signingDate','partyA','organizer','trade','accountManager','accountManagerNumber','projectManager','projectStatus','remark'))
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
        this.form.setFieldsValue(pick(row,'ictContractNumber','ictConstructionContractNumber','projectName','projectType','ictAmount','itRate','deviceAmount','deviceRate','signingDate','partyA','organizer','trade','accountManager','accountManagerNumber','projectManager','projectStatus','remark'))
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