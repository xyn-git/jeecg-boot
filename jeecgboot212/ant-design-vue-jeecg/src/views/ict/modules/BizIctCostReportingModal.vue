<template>
  <a-modal
    :title="title"
    :width="width"
    :visible="visible"
    :confirmLoading="confirmLoading"
    @ok="handleOk"
    @cancel="handleCancel"
    cancelText="关闭">
    <a-spin :spinning="confirmLoading">
      <a-form :form="form">

        <a-form-item label="ICT收入合同编号" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'ictContractNumber', validatorRules.ictContractNumber]" placeholder="请输入ICT收入合同编号"></a-input>
        </a-form-item>

        <a-form-item label="报支比例" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'costReportingRatio', validatorRules.costReportingRatio]" placeholder="请输入报支比例" style="width: 100%"/>
        </a-form-item>

        <a-form-item label="报支日期" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-date placeholder="请选择报支日期" v-decorator="[ 'costReportingDate', validatorRules.costReportingDate]" :trigger-change="true" style="width: 100%"/>
        </a-form-item>

        <a-form-item label="报支帐期（月）例201901" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input-number v-decorator="[ 'reportedAccountMonth', validatorRules.reportedAccountMonth]" placeholder="请输入报支帐期" style="width: 100%"/>
        </a-form-item>

        <a-form-item label="备注" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'remark', validatorRules.remark]" placeholder="请输入备注"></a-input>
        </a-form-item>



      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>

  import { httpAction } from '@/api/manage'
  import pick from 'lodash.pick'
  import JDate from '@/components/jeecg/JDate'

  export default {
    name: "BizIctCostReportingModal",
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
        ictContractNumber:{rules: [{ required: true, message: '请输入ICT收入合同编号!' }]},
        costReportingRatio:{},
        costReportingDate:{},
        reportedAccountMonth:{},
        remark:{},
        createBy:{},
        createTime:{},
        updateBy:{},
        updateTime:{},
        },
        url: {
          add: "/ict/bizIctCostReporting/add",
          edit: "/ict/bizIctCostReporting/edit",
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
          this.form.setFieldsValue(pick(this.model,'ictContractNumber','costReportingRatio','costReportingDate','reportedAccountMonth','remark'))
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
        this.form.setFieldsValue(pick(row,'ictContractNumber','costReportingRatio','costReportingDate','reportedAccountMonth','remark'))
      }

    }
  }
</script>