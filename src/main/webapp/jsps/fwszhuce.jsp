<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/29
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="referrer" content="never">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>安维</title>
    <!-- css文件-->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/nav.js"> </script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/table/bootstrap-table.css"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
    <style type="text/css">
        body {
            background: url(/static/js/login/images/aw.jpg) no-repeat center;
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            background-attachment: fixed;
            font-family: 'Poppins', sans-serif;
        }
    </style>
    <script type="text/javascript">
        function verify(){
            var flag=true;
            $("#saveForm .form-group").each(function () {
                if (!$(this).hasClass("has-success")) {
                    flag = false;
                    return flag;
                }
            });
            return flag;
        }
        $(function(){
            $("#btn").click(function() {
                   verify();
                    if(!verify()){
                        alert("校验不通过！");
                        return;
                    }
                    var userName=$("#userName").val();
                    var phone=$("#phone").val();
                    var password=$("#password").val();
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath }/user/fwszhuce",
                        data:{userName:userName,phone:phone,password:password},
                        dataType:"json",
                        success:function(data){
                            if(data){
                                alert("注册成功");
                            }else{
                                alert("注册失败");
                            }
                        },error:function(){
                            alert("注册失败");
                        }
                    });

            });

            $("#userName").blur(function () {
                var userName=$("#userName").val();
                var reg=/^[a-zA-Z]\w{3,15}$/;
                if(reg.test(userName)){
                    isOk($("#userName"),"格式正确");
                }else{
                    isError($("#userName"),"格式不正确");
                    return false;
                }
            })
            $("#phone").blur(function () {
                var phone=$("#phone").val();
                var reg=/^1[3-9][0-9]{9}$/;
                if(reg.test(phone)){
                    isOk($("#phone"),"格式正确");
                }else{
                    isError($("#phone"),"格式不正确");
                    return false;
                }
            })
            $("#password1").blur(function () {
                var password1=$("#password1").val();
                var password=$("#password").val();
                if(password==password1){
                    isOk( $("#password1"),"两次密码一样");
                }else{
                    isError( $("#password1"),"两次密码不一样");
                    return false;
                }
            })
            $("#password").blur(function () {
                var password=$("#password").val();
                var reg=/^(\w){6,16}$/;
                if(reg.test(password)){
                    isOk($("#password"),"格式正确");
                }else{
                    isError($("#password"),"格式不正确");
                    return false;
                }
            })
            $("#code").blur(function () {

                var code=$("#code").val();
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/user/verifyMobileCode',
                    data:{code:code},
                    dataType:'json',
                    success:function (data) {
                        if(data){
                            isOk($("#code"),"验证码正确");
                        }else {
                            isError($("#code"),"验证码错误");
                            return false;
                        }if(code==null){
                            isError($("#code"),"验证码错误");
                        }
                    }
                });
            })
        })

        //成功校验
        function isOk(obj,text){
            obj.parent().parent().removeClass("has-error");
            obj.parent().parent().addClass("has-success");
            obj.parent().next().children(":first").html(text);
        }
        //失败校验
        function isError(obj,text){
            obj.parent().parent().removeClass("has-success");
            obj.parent().parent().addClass("has-error");
            obj.parent().next().children(":first").html(text);
        }
    </script>
    <script type="text/javascript">
        $(function(){
            $("#image2").click(function(){
                var phone=$("#phone").val();
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/user/fasong",
                    data:{phone:phone},
                    dataType:"json",
                    success:function(data){
                        alert("已发送请注意查看");
                    },error:function(){
                        alert("发送失败");
                    }
                });

            });
        })

    </script>
    <style type="text/css">
        #saveForm{
            width:700px;
            height:400px;
            position:relative;
            left:50%;
            top:50%;
            margin-left:-150px;
            margin-top:-250px;

        }
        #aaa{
            margin-left:50px;
        }
    </style>

</head>
<body>

<form class="form-horizontal" id="saveForm" name="form" role="form" action="#">
    <div id="aaa">
        <img src="${pageContext.request.contextPath}/static/img/LOGO.gif" width="300px" height="100px" alt="" />
    </div>
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务商注册</h1>
    <div class="form-group">
        <label for="userName" class="col-sm-2 control-label">姓名</label>
        <div class="col-sm-4">
            <input type="text" name="userName" class="form-control" id="userName">
        </div>
        <div class="col-md-3">
            <span class="help-block"></span>
        </div>
    </div>

    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">手机号</label>
        <div class="col-sm-4">
            <input type="text" name="phone" class="form-control" id="phone">
        </div>
        <div class="col-md-3">
            <span class="help-block"></span>
        </div>
    </div>

    <div class="form-group">
        <label for="code" class="col-sm-2 control-label">验证码</label>
        <div class="col-sm-4">
            <input type="text" name="code" class="form-control" id="code">
            <button type="button" id="image2" class="btn btn-default">获取验证码</button>
        </div>
        <div class="col-md-3">
            <span class="help-block"></span>
        </div>
    </div>

    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-4">
            <input type="password" name="password" class="form-control" id="password" >
        </div>
        <div class="col-md-3">
            <span class="help-block"></span>
        </div>
    </div>

    <div class="form-group">
        <label for="password1" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-4">
            <input type="password" name="password1" class="form-control" id="password1" >
        </div>
        <div class="col-md-3">
            <span class="help-block"></span>
        </div>
    </div>


    </div>
    <div class="row">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" id="btn" class="btn btn-default">注册</button>
        </div>
    </div>
</form>
</body>
</html>
