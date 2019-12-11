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
<!--        <a-form-item label="项目组" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-dict-select-tag type="list" v-decorator="['projectTeam']" :trigger-change="true" dictCode="ICT_projTeam" placeholder="请选择项目组"/>
        </a-form-item>
        <a-form-item label="项目经理" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectManager', validatorRules.projectManager]" placeholder="请输入项目经理"></a-input>
        </a-form-item>-->
        <a-form-item label="项目名称" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectName', validatorRules.projectName]" placeholder="请输入项目名称"></a-input>
        </a-form-item>
        <a-form-item label="项目金额" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'projectAmount', validatorRules.projectAmount]" placeholder="请输入项目金额"></a-input>
        </a-form-item>
        <a-form-item label="入收计划" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'incomePlan', validatorRules.incomePlan]" placeholder="请输入入收计划"></a-input>
        </a-form-item>
        <a-form-item label="当前进展" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-dict-select-tag type="list" v-decorator="['currentProgress']" :trigger-change="true" dictCode="ICT_projOpportunityProgress" placeholder="请选择当前进展"/>
        </a-form-item>
        <a-form-item label="支撑厂家" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'supportingManufacturer', validatorRules.supportingManufacturer]" placeholder="请输入支撑厂家"></a-input>
        </a-form-item>
        <a-form-item label="营销部门" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-tree-select  v-decorator="[ 'saleDepartment', validatorRules.saleDepartment]" placeholder="请选择营销部门"  @change="getMsgFormSon" 　dict="sys_category,name,id" pidField="pid" pidValue="1201393928330571778" condition='{"pid": "1201393928330571778"}'/>
        </a-form-item>
        <a-form-item label="营销单位" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <j-tree-select v-decorator="[ 'saleUnit', validatorRules.saleUnit]" placeholder="请选择营销单位"  dict="sys_category,name,id" pidField="pid" :pidValue="departmentID"  />
        </a-form-item>


        <a-form-item label="客户经理" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-input v-decorator="[ 'customerManager', validatorRules.customerManager]" placeholder="请输入客户经理"></a-input>
        </a-form-item>
        <a-form-item label="进度一" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <!--<a-input v-decorator="[ 'progress1', validatorRules.progress1]" placeholder="请输入进度一"></a-input>-->
          <a-textarea
            v-decorator="[ 'progress1', validatorRules.progress1]" placeholder="请输入进度一"
            :autosize="{ minRows: 2, maxRows: 8 }"
          />
        </a-form-item>
        <a-form-item label="进度二" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <!--<a-input v-decorator="[ 'progress1', validatorRules.progress2]" placeholder="请输入进度二"></a-input>-->
          <a-textarea
            v-decorator="[ 'progress2', validatorRules.progress2]" placeholder="请输入进度二"
            :autosize="{ minRows: 2, maxRows: 8 }"
          />
        </a-form-item>
        <a-form-item label="进度三" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <!--<a-input v-decorator="[ 'progress3', validatorRules.progress3]" placeholder="请输入进度三"></a-input>-->
          <a-textarea
            v-decorator="[ 'progress3', validatorRules.progress3]" placeholder="请输入进度三"
            :autosize="{ minRows: 2, maxRows: 8 }"
          />
        </a-form-item>
        <a-form-item label="进度四" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <!--<a-input v-decorator="[ 'progress4', validatorRules.progress4]" placeholder="请输入进度四"></a-input>-->
          <a-textarea
            v-decorator="[ 'progress4', validatorRules.progress4]" placeholder="请输入进度四"
            :autosize="{ minRows: 2, maxRows: 8 }"
          />
        </a-form-item>
        <a-form-item label="备注" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <!--<a-input v-decorator="[ 'remark', validatorRules.remark]" placeholder="请输入备注"></a-input>-->
          <a-textarea
            v-decorator="[ 'remark', validatorRules.remark]" placeholder="请输入备注"
            :autosize="{ minRows: 2, maxRows: 6 }"
          />
        </a-form-item>

      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>

  import { httpAction } from '@/api/manage'
  import pick from 'lodash.pick'
  import JDictSelectTag from "@/components/dict/JDictSelectTag"
  import JTreeSelect from '@/components/jeecg/JTreeSelect'

  export default {
    name: "BizIctProjectOpportunityDataManageModal",
    components: {
      JDictSelectTag,
      JTreeSelect
    },
    data () {
      return {
        form: this.$form.createForm(this),
        departmentID:"1201393928330571778",
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
        projectTeam:{},
        projectManager:{rules: [{ required: true, message: '请输入项目经理!' }]},
        projectName:{rules: [{ required: true, message: '请输入项目名称!' }]},
        projectAmount:{rules: [{ required: true, message: '请输入项目金额!' }]},
        incomePlan:{},
        currentProgress:{},
        supportingManufacturer:{},
        saleDepartment:{},
        saleUnit:{},
        customerManager:{},
        progress1:{},
        progress2:{},
        progress3:{},
        progress4:{},
        remark:{},
        },
        url: {
          add: "/ict/bizIctProjectOpportunityDataManage/add",
          edit: "/ict/bizIctProjectOpportunityDataManage/edit",
        }

      }
    },
    created () {
    },

    methods: {
      getMsgFormSon(data,label){
        this.departmentID = data
        console.log("getMsgFormSon this.departmentID=",this.departmentID);
        console.log("getMsgFormSon label=",label);
      },
      add () {
        this.edit({});
      },
      edit (record) {
        this.form.resetFields();
        this.model = Object.assign({}, record);
        this.visible = true;
        this.$nextTick(() => {
          this.form.setFieldsValue(pick(this.model,'projectTeam','projectManager','projectName','projectAmount','incomePlan','currentProgress','supportingManufacturer','saleDepartment','saleUnit','customerManager','progress1','progress2','progress3','progress4','remark'))
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
        this.form.setFieldsValue(pick(row,'projectTeam','projectManager','projectName','projectAmount','incomePlan','currentProgress','supportingManufacturer','saleDepartment','saleUnit','customerManager','progress1','progress2','progress3','progress4','remark'))
      },

    }
  }
</script>