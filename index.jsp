<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	/* 	//普通函数写法
		function test1(obj){
			alert(obj);
		}
		//函数直接量
		function test2(obj){
			var x=function(argument){
				alert(argument);
			};
			return x(obj);	
		}
		//构造函数
		function test3(obj){
			x = new Function("msg","alert(msg)");
			x(obj);
		} */
		//99乘法表
		function load(){
			var a = 1;
			var b;
			document.write("<table>");
			for(a ; a<=9 ; a++){
			document.write("<tr>");
				for(b=1 ; b<=a ; b++){
					document.write("<td>"+b+"*"+a+"="+a*b+"</td>   ");			
				}
				document.write("</tr>");
			}
			document.write("</table>");
		}
	</script>
  </head>
  
  <body>
    <form>
    <input type="button" value="乘法表" onclick="load()">
     <!-- 	名称<input type="text" id="name" />
     	<br/>
    	<input type="button" value="请点击1" onclick="test1('a')">
    	<input type="button" value="请点击2" onclick="test2('b')">
    	<input type="button" value="请点击3" onclick="test3('c')"> -->
    </form>
   
  </body>
</html>
