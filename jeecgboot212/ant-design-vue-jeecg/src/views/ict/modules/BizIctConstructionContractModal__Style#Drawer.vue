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

        <a-form-item label="合同编号" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'contractNumber', validatorRules.contractNumber]" placeholder="请输入合同编号"></a-input>
        </a-form-item>
        <a-form-item label="项目名称" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectName', validatorRules.projectName]" placeholder="请输入项目名称"></a-input>
        </a-form-item>
        <a-form-item label="乙方单位名" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'partyB', validatorRules.partyB]" placeholder="请输入乙方单位名"></a-input>
        </a-form-item>
        <a-form-item label="ICT协议金额" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'itAmount', validatorRules.itAmount]" placeholder="请输入ICT协议金额" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="ICT协议税率" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'itRate', validatorRules.itRate]" placeholder="请输入ICT协议税率" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="设备协议金额" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'deivceAmount', validatorRules.deivceAmount]" placeholder="请输入设备协议金额" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="设备协议税率" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'deviceRate', validatorRules.deviceRate]" placeholder="请输入设备协议税率" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="项目经理" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectManager', validatorRules.projectManager]" placeholder="请输入项目经理"></a-input>
        </a-form-item>
        <a-form-item label="项目组" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectTeam', validatorRules.projectTeam]" placeholder="请输入项目组"></a-input>
        </a-form-item>
        <a-form-item label="合同签订时间" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-date placeholder="请选择合同签订时间" v-decorator="[ 'signingDate', validatorRules.signingDate]" :trigger-change="true" style="width: 100%"/>
        </a-form-item>
        <a-form-item label="乙方联系人" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'partyBLinkman', validatorRules.partyBLinkman]" placeholder="请输入乙方联系人"></a-input>
        </a-form-item>
        <a-form-item label="乙方联系电话" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'partyBTel', validatorRules.partyBTel]" placeholder="请输入乙方联系电话"></a-input>
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

  export default {
    name: "BizIctConstructionContractModal",
    components: {
      JDate,
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
        contractNumber:{rules: [{ required: true, message: '请输入合同编号!' }]},
        projectName:{rules: [{ required: true, message: '请输入项目名称!' }]},
        partyB:{rules: [{ required: true, message: '请输入乙方单位名!' }]},
        itAmount:{},
        itRate:{},
        deivceAmount:{},
        deviceRate:{},
        projectManager:{},
        projectTeam:{},
        signingDate:{},
        partyBLinkman:{},
        partyBTel:{},
        remark:{},
        },
        url: {
          add: "/ict/bizIctConstructionContract/add",
          edit: "/ict/bizIctConstructionContract/edit",
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
          this.form.setFieldsValue(pick(this.model,'contractNumber','projectName','partyB','itAmount','itRate','deivceAmount','deviceRate','projectManager','projectTeam','signingDate','partyBLinkman','partyBTel','remark'))
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
        this.form.setFieldsValue(pick(row,'contractNumber','projectName','partyB','itAmount','itRate','deivceAmount','deviceRate','projectManager','projectTeam','signingDate','partyBLinkman','partyBTel','remark','createBy','createTime','updateBy','updateTime'))
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