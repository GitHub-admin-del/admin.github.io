<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录注册表单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel='stylesheet' href="css/all.min.css" >
		<link rel='stylesheet' href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<style>
		#shopClickEamil{
			font-size: 12px;
			position: absolute;
			right: 25px;
			top: 200px;
		}
		#shopClickPhone{
			font-size: 12px;
			position: absolute;
			right: 25px;
			top: 310px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		function checkName() {
			$.ajax({
				"url":"UserAction_selectUser.action",
				"type":"post",
				"data":{shopName:$("#shopName").val()},
				"dataType":"text",
				"success":function(data){
					var check = false;
					if(data == "suc"){
						var name=document.getElementById("checkName");
						name.innerHTML = "";
						name.style.color="green";
						check = true;
					}else if(data == "fail"){
						document.getElementById("checkName").innerHTML = "用户名已存在";
						document.getElementById("checkName").style.color="red";
						check = false;
					}
					if($("#shopName").val()==""){
						document.getElementById("checkName").innerHTML = "用户名不能为空";
						document.getElementById("checkName").style.color="red";
						check = false;
					}
					 
				},
				"error":function(){
					alert("请求异常");
				}
			});
			 	return check;
		}
		function clickEmail(obj,second){
			$.ajax({
				"url":"UserAction_getCode.action",
				"type":"post",
				"data":{"email":$("#shopEmail").val()},
				"dataType":"text",
				"success":function(data){
					countDown(obj,second);
					alert(data);
				},
				"error":function(){
					alert("请求异常");
				}
			});
		}
		function clickPhone(){
			$.ajax({
				"url":"UserAction_getiPhoneCode.action",
				"type":"post",
				"data":{"phone":$("#shopPhone").val()},
				"dataType":"text",
				"success":function(data){
					alert(data);
				},
				"error":function(){
					alert("请求异常");
				}
			});
		}
			function countDown(obj,second){
		    // 如果秒数还是大于0，则表示倒计时还没结束
		     if(second>=0){
		          // 获取默认按钮上的文字
		          if(typeof buttonDefaultValue === 'undefined' ){
		            buttonDefaultValue =  obj.defaultValue;
		        }
		        // 按钮置为不可点击状态
		        obj.disabled = true;            
		        // 按钮里的内容呈现倒计时状态
		        obj.value ='('+second+')后重新发送';
		        // 时间减一
		        second--;
		        // 一秒后重复执行
		        setTimeout(function(){countDown(obj,second);},1000);
		        // 否则，按钮重置为初始状态
		        }else{
		        // 按钮置未可点击状态
		        obj.disabled = false;   
		        // 按钮里的内容恢复初始状态
		        obj.value = buttonDefaultValue;
		       }   
			}
		function checkCode(){
			$.ajax({
				"url":"UserAction_codess.action",
				"type":"post",
				"data":{shopCode:$("#shopCode").val()},
				"dataType":"text",
				"success":function(data){
					var check = false;
					var codes = /^[0-9]{6}$/;
					var code1=document.getElementById("shopCode").value;
					if(data == code1){
						var name=document.getElementById("checkCode");
						name.innerHTML = "";
						name.style.color="green";
						check = true;
					}else if(!codes.test(code1)){
						var name=document.getElementById("checkCode");
						name.innerHTML = "验证码必须是6位数字";
						name.style.color="red";
						check = false;
					}else{
						var name=document.getElementById("checkCode");
						name.innerHTML = "您输入的验证码有误";
						name.style.color="red";
						check = false;
					}
				},
				"error":function(){
					
					}
					
				});
		}
		function Code() {
			$.ajax({
				"url":"UserAction_phoneCodess.action",
				"type":"post",
				"data":{shopiphoneCode:$("#shopiphoneCode").val()},
				"dataType":"text",
				"success":function(data){
					var check = false;
					var codes = /^[0-9]{6}$/;
					var code=document.getElementById("shopiphoneCode").value;
					if(data == code){
						var name=document.getElementById("checkiphoneCode");
						name.innerHTML = "";
						name.style.color="green";
						check = true;
					}else if(!codes.test(code)){
						var name=document.getElementById("checkiphoneCode");
						name.innerHTML = "验证码必须是6位数字";
						name.style.color="red";
						check = false;
					}
					else{
						var name=document.getElementById("checkiphoneCode");
						name.innerHTML = "您输入的验证码有误";
						name.style.color="red";
						check = false;
					}
				},
				"error":function(){
					alert("请求异常");
					}
					
				});
		}
		
		function checkPwd() {
            //密码
            var check = false;
            var pwd = document.getElementById("shopPwd").value;
            var reg = /^[\d\w]{6,12}$/;
          
            if (!reg.test(pwd)) {
            	var checkPwd = document.getElementById("checkPwd");
            	checkPwd.innerHTML = "请输入6~12以内数字";
            	checkPwd.style.color="red";
            	check = false;
            }
            else {
            	var checkPwd = document.getElementById("checkPwd");
            	checkPwd.innerHTML = "";
            	checkPwd.style.color="green";
            	check = true;
            }
            return check;
        }
		
		function checkEmail() {
            //邮箱验证
            var check = false;
            var email = document.getElementById("shopEmail").value;
            var reg1 = /^[\d]{1,10}@qq\.[\w]{2,3}$/;
            if (!reg1.test(email)) {
            	var checkE = document.getElementById("checkE");
            	checkE.innerHTML = "错误!如:Java@qq.com";
            	checkE.style.color="red";
                check = false;
            }
            else {
            	var checkE = document.getElementById("checkE");
            	checkE.innerHTML = "";
            	checkE.style.color="green";
            	check = true;
            }
            return check;
        }
		
		function checkPhone(){
			var check = false;
			var phone = document.getElementById("shopPhone").value;
			var reg1 = /^1[3456789]\d{9}$/;
			if (!reg1.test(phone)) {
            	var checkPhone = document.getElementById("checkPhone");
            	checkPhone.innerHTML = "请输入正确的手机号";
            	checkPhone.style.color="red";
            	check = false;
            } else {
            	var checkPhone = document.getElementById("checkPhone");
            	checkPhone.innerHTML = "";
            	checkPhone.style.color="green";
            	check = true;
            }
            return check;
			
		}
		function check() {
			var check = checkPwd() && checkEmail() && checkCode() && clickEmail() && checkName() &&checkPhone();
			return check;
		 
		}
		

	</script>
	<body>
	<div class="container">
	  <div class="card-wrap">
		<div class="card border-0 shadow card--welcome is-show" id="welcome">
		  <div class="card-body">
		<h2 class="card-title">欢迎光临</h2>
		<p>欢迎进入登录页面</p>
		<div class="btn-wrap"><a class="btn btn-lg btn-register js-btn" data-target="register">注册</a><a class="btn btn-lg btn-login js-btn" data-target="login">登录</a></div>
		  </div>
		</div>
	<div class="card border-0 shadow card--register" id="register">
	  <div class="card-body">
		<h2 class="card-title">会员注册</h2>
		<form action="UserAction_regUser.action" method="post" onsubmit="return check();">
			<div class="form-group">
				<input class="form-control" name="user.user_Name" id="shopName"  onblur="checkName()" type="text" placeholder="名称" required="required" />
				<span id="checkName"></span>
			</div>
			<div class="form-group">
				<input class="form-control" type="password" name="user.pass_Word" placeholder="密码" required="required" id="shopPwd" onblur="checkPwd()" />
				<span id="checkPwd"></span>
			</div>
			<div class="form-group">
				<input class="form-control" name="user.email" type="text"  placeholder="邮箱" required="required" id="shopEmail"   onblur="checkEmail()" />
				<input type="button" onclick="clickEmail(this,60)" class="e" value="获取验证码" style="display:inline-block;float: right;" id="shopClickEamil"></input>
				<span id="checkE"></span>
			</div>
			<div class="form-group">
				<input class="form-control" type="text" name="user.code" placeholder="请输入邮箱验证码" required="required" id="shopCode" onblur="checkCode()" />
				<span id="checkCode"></span>
			</div>	
			<div class="form-group">
				<input class="form-control" name="user.phone" type="text"  placeholder="手机号" required="required" id="shopPhone"   onblur="checkPhone()" />
				<input type="button" onclick="clickPhone(this,60)"  value="获取验证码" style="display:inline-block; float: right; "  id="shopClickPhone"></input>
				<span id="checkPhone"></span>
			</div>
			<div class="form-group">
				<input class="form-control" type="text" name="user.iphoneCode" placeholder="请输入手机验证码" required="required" id="shopiphoneCode" onblur="Code()" />
				<span id="checkiphoneCode"></span>
			</div>	
				<button class="btn btn-lg">注册</button>
		</form>
      </div>
		<button class="btn btn-back js-btn" data-target="welcome"><i class="fas fa-angle-left"></i></button>
	</div>
	<div class="card border-0 shadow card--login" id="login">
	  <div class="card-body">
		<h2 class="card-title">欢迎登录！</h2>
	<form action="UserAction_login.action" method="post">
		<span id="loginSpan"></span>
		<div class="form-group">
			<input class="form-control" name="user.user_Name"  type="text" placeholder="用户名"  required="required" />
		</div>
		<div class="form-group">
			<input class="form-control" name="user.pass_Word"  type="password" placeholder="密码" required="required" />
		</div>
			<button class="btn btn-lg" onclick="clickLogin()">登录</button>
	</form>
	  </div>
		<button class="btn btn-back js-btn" data-target="welcome"><i class="fas fa-angle-left"></i></button>
	</div>
	  </div>
	</div>
	<script src="js/index.js" ></script>
	</body>
</html>
