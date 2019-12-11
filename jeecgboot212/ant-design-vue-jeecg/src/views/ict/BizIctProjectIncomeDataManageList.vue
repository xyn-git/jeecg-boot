<template>
  <a-card :bordered="false">
    <!-- 查询区域 -->
    <div class="table-page-search-wrapper">
      <a-form layout="inline" @keyup.enter.native="searchQuery">
        <a-row :gutter="24">
          <a-col :md="6" :sm="8">
            <a-form-item label="项目组">
              <j-dict-select-tag v-model="queryParam.projectTeam" placeholder="请选择项目组" dictCode="ICT_projTeam"/>
            </a-form-item>
          </a-col>
          <a-col :md="6" :sm="8">
            <a-form-item label="项目经理">
              <j-input placeholder="项目经理" v-model="queryParam.projectManager"></j-input>
            </a-form-item>
          </a-col>
          <a-col :md="6" :sm="8">
            <a-form-item label="入收时间">
              <j-dict-select-tag v-model="queryParam.incomeDate" placeholder="请选择入收时间" dictCode="ICT_projIncomeDate"/>
            </a-form-item>
          </a-col>

          <a-col :span="8">
            <a-form-item label="营销部门选择">
              <j-tree-select v-model="queryParam.saleDepartment" placeholder="请选择营销部门"  dict="sys_category,name,id" pidField="pid" pidValue="1201393928330571778" condition='{"pid": "1201393928330571778"}'/>
            </a-form-item>
          </a-col>
          <a-col :span="8">

            <a-form-item label="营销单位选择">
              <j-tree-select v-model="queryParam.saleUnit" placeholder="请选择营销单位"  dict="sys_category,name,id" pidField="pid" :pidValue="departmentID"    />
            </a-form-item>
          </a-col>
          <a-col :md="6" :sm="8" >
            <span style="float: left;overflow: hidden;" class="table-page-search-submitButtons">
              <a-button type="primary" @click="searchQuery" icon="search">查询</a-button>
              <a-button type="primary" @click="searchReset" icon="reload" style="margin-left: 8px">重置</a-button>
              <a @click="handleToggleSearch" style="margin-left: 8px">
                {{ toggleSearchStatus ? '收起' : '展开' }}
                <a-icon :type="toggleSearchStatus ? 'up' : 'down'"/>
              </a>
            </span>
          </a-col>

        </a-row>
      </a-form>
    </div>
    <!-- 查询区域-END -->

    <!-- 操作按钮区域 -->
    <div class="table-operator">
      <a-button @click="handleAdd" type="primary" icon="plus">新增</a-button>
<!--      <a-button type="primary" icon="download" @click="handleExportXls('biz_ict_project_income')">导出</a-button>
      <a-upload name="file" :showUploadList="false" :multiple="false" :headers="tokenHeader" :action="importExcelUrl" @change="handleImportExcel">
        <a-button type="primary" icon="import">导入</a-button>
      </a-upload>-->
      <a-dropdown v-if="selectedRowKeys.length > 0">
        <a-menu slot="overlay">
          <a-menu-item key="1" @click="batchDel"><a-icon type="delete"/>删除</a-menu-item>
        </a-menu>
        <a-button style="margin-left: 8px"> 批量操作 <a-icon type="down" /></a-button>
      </a-dropdown>
    </div>

    <!-- table区域-begin -->
    <div>
      <div class="ant-alert ant-alert-info" style="margin-bottom: 16px;">
        <i class="anticon anticon-info-circle ant-alert-icon"></i> 已选择 <a style="font-weight: 600">{{ selectedRowKeys.length }}</a>项
        <a style="margin-left: 24px" @click="onClearSelected">清空</a>
      </div>

      <a-table
        ref="table"
        size="middle"
        bordered
        rowKey="id"
        :columns="columns"
        :dataSource="dataSource"
        :pagination="ipagination"
        :loading="loading"
        :rowSelection="{fixed:true,selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        :scroll="{ x: 1800 }"
        @change="handleTableChange">

        <template slot="htmlSlot" slot-scope="text">
          <div v-html="text"></div>
        </template>
        <template slot="imgSlot" slot-scope="text">
          <span v-if="!text" style="font-size: 12px;font-style: italic;">无此图片</span>
          <img v-else :src="getImgView(text)" height="25px" alt="图片不存在" style="max-width:80px;font-size: 12px;font-style: italic;"/>
        </template>
        <template slot="fileSlot" slot-scope="text">
          <span v-if="!text" style="font-size: 12px;font-style: italic;">无此文件</span>
          <a-button
            v-else
            :ghost="true"
            type="primary"
            icon="download"
            size="small"
            @click="uploadFile(text)">
            下载
          </a-button>
        </template>

        <span slot="action" slot-scope="text, record">
          <a @click="handleEdit(record)">编辑</a>

          <a-divider type="vertical" />
          <a-dropdown>
            <a class="ant-dropdown-link">更多 <a-icon type="down" /></a>
            <a-menu slot="overlay">
              <a-menu-item>
                <a-popconfirm title="确定删除吗?" @confirm="() => handleDelete(record.id)">
                  <a>删除</a>
                </a-popconfirm>
              </a-menu-item>
            </a-menu>
          </a-dropdown>
        </span>

      </a-table>
    </div>

    <bizIctProjectIncomeDataManage-modal ref="modalForm" @ok="modalFormOk"></bizIctProjectIncomeDataManage-modal>
  </a-card>
</template>

<script>
  import { JeecgListMixin } from '@/mixins/JeecgListMixin'
  import BizIctProjectIncomeDataManageModal from './modules/BizIctProjectIncomeDataManageModal'
  import JInput from '../../components/jeecg/JInput'
  import JTreeSelect from '@/components/jeecg/JTreeSelect'

  export default {
    name: "BizIctProjectIncomeList",
    mixins:[JeecgListMixin],
    components: {
      JInput,
      BizIctProjectIncomeDataManageModal,
      JTreeSelect
    },
    data () {
      return {
        description: 'biz_ict_project_income管理页面',
        departmentID:"1201393928330571778",
        ipagination:{
          hideOnSinglePage:true,
          current: 1,
          pageSize: 10000,
          pageSizeOptions: ['10000', '20000', '30000'],
          showTotal: (total, range) => {
            return range[0] + "-" + range[1] + " 共" + total + "条"
          },
          showQuickJumper: true,
          showSizeChanger: true,
          total: 0
        },
        // 表头
        columns: [
          {
            title: '#',
            width:30,
            align: 'center',
            dataIndex: 'rowIndex',
            key:'rowIndex',
            customRender: function (text, r, index) {
              return (text !== '合计') ? (parseInt(index) + 1) : text
            }
          },
          {
            title:'项目组',
            align:"center",
            width:75,
            dataIndex: 'projectTeam_dictText'
          },
          {
            title:'项目经理',
            align:"center",
            width:75,
            dataIndex: 'projectManager'
          },
          {
            title:'项目名称',
            align:"center",
            width:160,
            dataIndex: 'projectName'
          },
          {
            title:'协议额',
            align:"center",
            width:70,
            dataIndex: 'agreementAmount'
          },
          {
            title:'入收额',
            align:"center",
            width:70,
            dataIndex: 'incomeAmount'
          },
          {
            title:'入收时间',
            align:"center",
            width:75,
            dataIndex: 'incomeDate_dictText'
          },
          {
            title:'进展情况',
            align:"center",
            width:140,
            dataIndex: 'progress_dictText'
          },
          {
            title:'支撑厂家',
            align:"center",
            width:100,
            dataIndex: 'supportingManufacturer'
          },
          {
            title:'营销部门',
            align:"center",
            width:75,
            dataIndex: 'saleDepartment_dictText'
          },
          {
            title:'营销单位',
            align:"center",
            width:75,
            dataIndex: 'saleUnit_dictText'
          },
          {
            title:'客户经理',
            align:"center",
            width:75,
            dataIndex: 'customerManager'
          },
          {
            title:'详细说明',
            align:"center",
            width:300,
            dataIndex: 'detail'
          },
          {
            title:'备注',
            align:"center",
            width:120,
            dataIndex: 'remark'
          },
          {
            title: '操作',
            dataIndex: 'action',
            align:"center",
            fixed:"right",
            width:120,
            scopedSlots: { customRender: 'action' }
          }
        ],
        url: {
          list: "/ict/bizIctProjectIncomeDataManage/list",
          delete: "/ict/bizIctProjectIncomeDataManage/delete",
          deleteBatch: "/ict/bizIctProjectIncomeDataManage/deleteBatch",
          exportXlsUrl: "/ict/bizIctProjectIncomeDataManage/exportXls",
          importExcelUrl: "ict/bizIctProjectIncomeDataManage/importExcel",
        },
        dictOptions:{
        },

      }
    },
    computed: {
      importExcelUrl: function(){
        return `${window._CONFIG['domianURL']}/${this.url.importExcelUrl}`;
      },
      newDepartmentID() {
        return this.queryParam.saleDepartment;
      }
    },
    watch:{
      newDepartmentID(val,old) {
        console.log("this.departmentID=",this.departmentID);
        this.departmentID = val;
        console.log("this.departmentID=",this.departmentID);
      },
      loading: {
        handler(newName, oldName) {
          if (newName==false)  this.tableAddTotalRow(this.columns, this.dataSource);
        },
      },
      immediate: true,
      deep: true
    },


    methods: {
      initDictConfig(){
      },


      /** 表格增加合计行 */
      tableAddTotalRow(columns, dataSource) {
        //this.$message.info("dataSource="+dataSource.length)
        let numKey = 'rowIndex'
        let totalRow = { [numKey]: '合计' }
        columns.forEach(column => {
          let { key, dataIndex } = column
          if (![key, dataIndex].includes(numKey)) {
            let total = 0
            dataSource.forEach(data => {
              //校验number   /^(\-|\+)?\d+(\.\d+)?$     以前是校验整数  //   /^\d+\.?\d?$/
              total += /^(\-|\+)?\d+(\.\d+)?$/.test(data[dataIndex]) ? Number.parseFloat(data[dataIndex]) : Number.NaN
              console.log(data[dataIndex], ':', (/^\d+\.?\d?$/.test(data[dataIndex]) ? Number.parseFloat(data[dataIndex]) : Number.NaN))
            })

            if (Number.isNaN(total)) {
              total = '-'
            }  //else    this.$message.info("data dataIndex="+ dataIndex+" total="+total)
            else total=total.toFixed(2)
            totalRow[dataIndex] = total
          }
        })

        dataSource.push(totalRow)
      },



    }
  }
</script>
<style scoped>
  @import '~@assets/less/common.less'
</style>