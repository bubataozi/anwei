<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<!-- Head -->
<head>
    <style type="text/css">
        #aaa{
            margin-left:700px;
            margin-bottom: -30px;
        }
    </style>
    <title>Border sign in Form Flat Responsive Widget Template :: w3layouts</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <meta name="keywords"
          content="Border sign in Form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/login/css/style.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/login/css/font-awesome.css" type="text/css" media="all">
    <link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext"
          rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layuiadmin/style/admin.css" media="all">
    <script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>

</head>

<body>
<h1 class="title-agile text-center">安维后台管理系统</h1>
<div id="aaa">
    <img src="${pageContext.request.contextPath}/static/img/LOGO.gif" width="500px" height="100px" alt="" />
</div>
<div class="content-w3ls">
    <div class="content-bottom">
        <h2>登录<i class="fa fa-hand-o-down" aria-hidden="true"></i></h2>
        <div class="field-group">
                <div class="wthree-field">
                    <ul class="list-login">
                        <li>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/jsps/fwszhuce.jsp" class="text-right">服务商注册</a>
                            <a href="${pageContext.request.contextPath}/jsps/cszhuce.jsp" class="text-right">厂商注册</a>
                        </li>
                    </ul>
                </div>
        </div>
        <form id="login_form">
            <div class="form-group"><!--  has-success has-feedback-->
                <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-mobile" aria-hidden="true"></i>
                        </span>
                    <input type="text" class="form-control" id="phone" name="phone" style="height:44px;" placeholder="用户名">
                </div>
                <div><span class="help-block">&nbsp;</span></div>

            </div>
            <div class="form-group ">
                <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    <input type="password" class="form-control" id="password" name="password" style="height:44px;"  placeholder="密码">

                </div>
                <div><span class="help-block">&nbsp;</span></div>
            </div>
            <div class="form-group ">
              <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-id-card-o" aria-hidden="true"></i>
                            </span>
                  <input name="codestext" type="text" id="codestext" style="height:44px;" placeholder="验证码"/>

                  <img id="img" src="${pageContext.request.contextPath}/user/authImage" style="height: 40px;width: 150px;"/>


              </div>
              <div><span class="help-block">&nbsp;</span></div>

            </div>
            <%--<div class="field-group">
                <div class="wthree-field">
                    <input name="phone" id="phone" type="text" placeholder="用户名">
                </div>
                <span class="fa fa-user" aria-hidden="true"></span>
            </div>
            <div class="field-group">
                <div class="wthree-field">
                    <input id="password" name="password" type="Password" placeholder="密码">
                </div>
                <span class="fa fa-lock" aria-hidden="true"></span>
            </div>
            <div class="field-group">
                <div class="wthree-field">
                    <input name="codestext" type="text" id="codestext" placeholder="验证码"/>
                </div>
                <img id="img" src="${pageContext.request.contextPath}/user/authImage">
            </div>--%>
            <div class="field-group">
                <div class="check">
                    <label class="checkbox w3l">
                        <input type="checkbox" onclick="myFunction()">
                        <i> </i>显示密码</label>
                </div>
                <script>
                    function myFunction() {
                        var x = document.getElementById("password");
                        if (x.type === "password") {
                            x.type = "text";
                        } else {
                            x.type = "password";
                        }
                    }
                </script>
            </div>
            <div class="wthree-field">
                <input id="login_btn" name="login" value="登录" type="button"/>
            </div>
            <ul class="list-login">
                <li class="switch-agileits">
                    <label class="switch">
                        <input type="checkbox">
                        <span class="slider round"></span>
                        保持登录
                    </label>
                </li>
                <li>
                    <a href="#" class="text-right">忘记密码?</a>
                </li>
                <li class="clearfix"></li>
            </ul>
        </form>
    </div>
</div>
<script>
    function isOk(obj,text){
        obj.parent().parent().removeClass("has-error");
        obj.parent().parent().addClass("has-success");
        obj.parent().next().children(":first").html(text);
    }
    function isError(obj,text){
        obj.parent().parent().removeClass("has-success");
        obj.parent().parent().addClass("has-error");
        obj.parent().next().children(":first").html(text);
    }
    function verify(){
        var flag=true;
        $("#login_form .form-group").each(function () {
            if(!$(this).hasClass("has-success") && !$(this).hasClass("has-error")){
                $(this).find(".from-control").trigger("blur");
            }
        })
        $("#login_form .form-group").each(function () {
            if (!$(this).hasClass("has-success")) {
                flag = false;
                return;
            }
        })
        return flag;
    }
    $(document).ready(function () {
        $("#img").click(function () {
            var img = document.getElementById("img");
            img.src = "/user/authImage?date=" + new Date();
        })
    })
    $(function () {
        $("#phone").blur(function () {
            var phone=$("#phone").val();
            var reg=/^1[3-9][0-9]{9}$/;
            if(reg.test(phone)){
                isOk($("#phone"),"格式正确");
            }else{
                isError($("#phone"),"格式不正确");
                return false;
            }
        });
        $("#password").blur(function () {
            var password=$("#password").val();
            var reg=/^(\w){6,16}$/;
            if(reg.test(password)){
                isOk($("#password"),"格式正确");
            }else{
                isError($("#password"),"格式不正确");
                return false;
            }
        });
        $("#codestext").blur(function () {
            var codestext=$("#codestext").val();
            $.ajax({
                type:'post',
                url:'/user/yanzhengma',
                data:{codestext:codestext},
                dataType:'json',
                success:function (data) {
                    if(data){
                        isOk($("#codestext"),"验证码正确");
                    }else{
                        isError($("#codestext"),"验证码不正确");
                        return false;
                    }
                }
            });
        })
        var layer ;
        layui.use('layer', function(){
            layer = layui.layer;
        });
        verify();

        $('#login_btn').on('click', function () {
            if(verify()==false){
                alert("账号或密码错误");
            } else{
            var num = 0;
            var str = "";
            $("input[type$='text'],input[type$='password']").each(function (n) {
                if ($(this).val() == "") {
                    layer.alert(str += "" + $(this).attr("placeholder") + "不能为空！\r\n", {
                        title: '提示框',
                        icon: 0,
                    });
                    num++;
                    return false;
                }
            });
            if (num > 0) {
                return false;
            } else {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/user/dl",
                    data: {"phone":$("#phone").val(),"password":$("#password").val()},
                    dataType: "json",
                    error: function (error) {
                        layer.alert('登陆失败！', {
                            title: '提示框',
                            icon: 0,
                        });
                    }, success: function (data) {
                        if (data.flag) {
                            layer.alert('登陆成功！', {
                                title: '提示框',
                                icon: 1,
                            });

                            location.href = "index.jsp";
                        } else {
                            layer.alert(data.message, {
                                title: '提示框',
                                icon: 0,
                            });
                        }
                    }
                });
            }
            }

        });
    })
</script>
<div class="copyright text-center">
    <p>安维
    </p>
</div>
</body>
</html>

