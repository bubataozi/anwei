<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="referrer" content="no-referrer">
    <title>安维管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/icheck-material.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/icheck-material-custom.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/style/admin.css" media="all">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <link href="${pageContext.request.contextPath}/static/ueditor/themes/default/css/ueditor.min.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/echarts/echarts.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/echarts/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"></script>
    <script src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="${pageContext.request.contextPath}/static/ueditor/ueditor.parse.js"></script>
</head>

<script>
    layui.config({
        base: '${pageContext.request.contextPath}/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'senior']);

    //加载表单控件
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });

    //时间控件
    var laydate;
    layui.use(['index', 'laydate'], function() {
        laydate = layui.laydate;
        laydate.render({
            elem: '#dateFirst'
        });
        laydate.render({
            elem: '#dateLast'
        });
    })

    $(function(){
        $('.modal').on('hidden.bs.modal', function () {
            document.getElementsByTagName('body')[0].className = 'modal-open';
        })
    })
</script>
<style>
    .publist-rule-entrance {
        text-align: right;
        display: block;
        font-size: 15px;
    }

    .a {
        text-align: left;
        display: block;
    }

    .b {
        margin-left: auto;
        margin-right: auto;
    }

    .c {
        width: 1150px;
        height: 40px;
        background-color: #FFFCED;
        line-height: 40px;
        border: solid 1px #FAC595;
    }

    .d {
        color: black;
    }

</style>

