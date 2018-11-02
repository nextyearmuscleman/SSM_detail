<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">

    <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin: 380px 380px">
            <div class="login-panel panel panel-default" >
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center;">登录</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="#" method="post" id="login_form">
                        <fieldset>
                            <div class="form-group">
                                <input id="username" class="form-control" placeholder="用户名:admin" name="username" autofocus>
                            </div>
                            <div class="form-group">
                                <input id="pwd" class="form-control" placeholder="密码:1234" name="password" type="password" value="">
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <a href="javascript:void(0)" class="btn btn-lg btn-success btn-block" id='login_btn'>登录</a>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(function () {
        $("#login_btn").click(function () {
            $.ajax({
                        url:"/hrms/dologin",
                        type:"POST",
                        //使用JSON格式传递数据不知道怎么写
                        // data:{
                        //     "username": $("username").val(),
                        //     "password":$("pwd").val()},

                         //将匹配的DOM元素装换成能够随Ajax请求传递的查询字符串，这种方式比较方便
                        data:$("#login_form").serialize(),//将表单数据一次性传递
                        success:function (result) {
                            if(result.code == 100){
                                window.location.href= "/hrms/main";
                            }else {
                                alert("输入账号用户名与密码不匹配，请重新输入");
                            }
                }

            });
        });
    });
</script>
</body>
</html>
