<template>
  <a-card :bordered="false">
    <!-- 查询区域 -->
    <div class="table-page-search-wrapper">
      <a-form layout="inline" @keyup.enter.native="searchQuery">
        <a-row>
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
            <a-form-item label="支撑厂家">
              <j-input placeholder="支撑厂家" v-model="queryParam.supportingManufacturer"></j-input>
            </a-form-item>
          </a-col>
          <!--          <a-col :md="6" :sm="8">
                      <a-form-item label="当前进展">
                        <j-dict-select-tag v-model="queryParam.currentProgress" placeholder="请选择进展情况" dictCode="ICT_projOpportunityProgress"/>
                      </a-form-item>
                    </a-col>-->
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
<!--      <a-button type="primary" icon="download" @click="handleExportXls('biz_ict_project_opportunity')">导出</a-button>
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
        :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        :scroll="{ x: 2700 }"
        @change="handleTableChange">

<!--        <template slot="htmlSlot" slot-scope="text">
          <div v-html="text"></div>
        </template>-->
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

    <bizIctProjectOpportunityDataManage-modal ref="modalForm" @ok="modalFormOk"></bizIctProjectOpportunityDataManage-modal>
  </a-card>
</template>

<script>

  import { JeecgListMixin } from '@/mixins/JeecgListMixin'
  import BizIctProjectOpportunityDataManageModal from './modules/BizIctProjectOpportunityDataManageModal'
  import JInput from '../../components/jeecg/JInput'
  import JTreeSelect from '@/components/jeecg/JTreeSelect'

  export default {
    name: "BizIctProjectOpportunityList",
    mixins:[JeecgListMixin],
    components: {
      JInput,
      BizIctProjectOpportunityDataManageModal,
      JTreeSelect
    },
    data () {
      return {
        departmentID:"1201393928330571778",
        description: 'biz_ict_project_opportunity管理页面',
        // 表头
        columns: [
/*          {
            title: '#',
            dataIndex: '',
            key:'rowIndex',
            width:60,
            align:"center",
            customRender:function (t,r,index) {
              return parseInt(index)+1;
            }
          },*/
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
            title:'项目金额',
            align:"center",
            width:75,
            dataIndex: 'projectAmount'
          },
          {
            title:'入收计划',
            align:"center",
            width:75,
            dataIndex: 'incomePlan'
          },
          {
            title:'当前进展',
            align:"center",
            width:110,
            dataIndex: 'currentProgress_dictText'
          },
          {
            title:'支撑厂家',
            align:"center",
            width:75,
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
            title:'进度一',
            align:"center",
            width:300,
            dataIndex: 'progress1'
          },
          {
            title:'进度二',
            align:"center",
            width:300,
            dataIndex: 'progress2'
          },
          {
            title:'进度三',
            align:"center",
            width:300,
            dataIndex: 'progress3'
          },
          {
            title:'进度四',
            align:"center",
            width:300,
            dataIndex: 'progress4'
          },
          {
            title:'备注',
            align:"center",
            width:200,
            dataIndex: 'remark'
          },
          {
            title: '操作',
            dataIndex: 'action',
            align:"center",
            fixed:"right",
            width:100,
            scopedSlots: { customRender: 'action' }
          }
        ],
        url: {
          list: "/ict/bizIctProjectOpportunityDataManage/list",
          delete: "/ict/bizIctProjectOpportunityDataManage/delete",
          deleteBatch: "/ict/bizIctProjectOpportunityDataManage/deleteBatch",
          exportXlsUrl: "/ict/bizIctProjectOpportunityDataManage/exportXls",
          importExcelUrl: "ict/bizIctProjectOpportunityDataManage/importExcel",
        },
        dictOptions:{
        }
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
      immediate: true,
      deep: true
    },
    methods: {
      initDictConfig(){
      }

    }
  }
</script>
<style scoped>
  @import '~@assets/less/common.less';
</style>