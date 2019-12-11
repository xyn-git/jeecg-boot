<template>
  <div>
    <h1>result:{{resData}}</h1>
  </div>
</template>

<script>
  import  {getAction} from '@api/manage'

  export default {
    name: 'Hello',
    data(){
      return {
        resData:"",
        url:"/hello/test"
      }
    },
    methods:{
      loadData(){
        getAction(this.url).then((res)=>{
          this.resData=res;
        })
      }
    },
    created(){
      this.loadData()
    }
  }
</script>

<style scoped>

</style>