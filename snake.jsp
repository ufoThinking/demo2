<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'snake.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		var map; //地图类对象
        var snake; //蛇类对象
        var food; //食物类对象
        var timer; //定时器对象
        var sum=0; //分数
	
		//定义地图
		function map(){
			this.width = 800;//地图宽度
			this.height = 400;//地图高度
			this.color = "#cccccc";//地图颜色
			this.div = null;//保存地图的dom元素
			this.position = "absolute";//定位方式  
			
			this.show = function (){
			 	//生成div元素，用于构建地图
				this.div = document.createElement("div");
				this.div.style.width = this.width+"px";
				this.div.style.height = this.height+"px";
				this.div.style.backgroundColor = this.color;
				this.div.style.position = this.position;
				//把div放置在body元素中
				document.getElementsByTagName('body')[0].appendChild(this.div);
			};
		}
	 	//定义食物
		function food(){
			this.width=20;
			this.height=20;
			this.position="absolute";//定位方式
			this.color="#00ff00";
			this._food=null;//用于保存食物的dom元素
			this.x=0;//横向第几格
			this.y=0;//纵向第几格
			this.show = function(){
				if(this._food ==null){
					this._food = document.createElement("div");
					//设置食物样式
					this._food.style.width = this.width+"px";
					this._food.style.height = this.height+"px";
					this._food.style.backgroundColor = this.color;
					this._food.style.position = this.position;
					map.div.appendChild(this._food);
				}
				this.x = Math.floor(Math.random()*40);
				this.y = Math.floor(Math.random()*20);
				this._food.style.left = this.x*this.width+"px";
                this._food.style.top = this.y*this.height+"px";
			};
		}
		//定义蛇
		function snake(){
			this.width = 20;//蛇节宽度
			this.height =20;//蛇节高度
			this.position = "absolute";//蛇节定位方式
			this.direct = "";//蛇移动方向
			//所有蛇节全部信息
			this.body = [[3,2,"#ffc0cb",null],[2,2,"#0000ff",null],[1,2,"#0000ff",null]];
			
			this.setDirect = function (code){
				switch(code){
					case 37:
						this.direct = "left";
						break;
					case 38:
						this.direct = "up";
						break;
					case 39:
						this.direct = "right";
						break;
					case 40:
						this.direct = "down";
						break;				
				}
			};
			
			this.show = function(){
				//用于显示蛇
				for(var i=0;i<this.body.length;i++){
				debugger;
					if(this.body[i][3]==null){
						this.body[i][3] = document.createElement("div");
						this.body[i][3].style.height= this.height+"px";
						this.body[i][3].style.width = this.width+"px";
						this.body[i][3].style.position = this.position;
						this.body[i][3].style.backgroundColor = this.body[i][2];
						map.div.appendChild(this.body[i][3]);
					}
					this.body[i][3].style.left = this.body[i][0]*this.width+"px";
					this.body[i][3].style.top = this.body[i][1]*this.height+"px";
				}
			};
		
			this.move = function(){
				//移动蛇身
				var length = this.body.length -1;
				for(var i=length;i>0;i--){
					//让后面的蛇节的坐标等于前面蛇节的坐标
					this.body[i][0]=this.body[i-1][0];//横坐标
					this.body[i][1] = this.body[i-1][1];//纵坐标
				}
				switch(this.direct){
					case "right":
						this.body[0][0]=this.body[0][0]+1;
						break;
					case "down":
						this.body[0][1]=this.body[0][1]+1;
						break;
					case "left":
						this.body[0][0]=this.body[0][0]-1;
						break;
					case "up":
						this.body[0][1]=this.body[0][1]-1;
						break;
					default:
						return;
				}
				
				//判断蛇吃到食物
            	if(this.body[0][0]==food.x&&this.body[0][1]==food.y)   {
                 	var x=this.body[length][0];
                 	var y=this.body[length][1];
                 	sum++;
                 	//document.title='分数:'+sum+'分';
                 	this.body.push([x,y,'blue',null]);
               		food.show();
             	}
			
				//判断蛇撞墙死
				if(this.body[0][0] >39 || this.body[0][1] >19 || this.body[0][0] <0 || this.body[0][1] <0){
					alert("撞墙死");
					clearInterval(timer);
					alert("本次得分"+sum+"分");
					return;
				
				}
				
				//吃到自己死
				for(var i=1;i<this.body.length;i++){
					if(this.body[0][0] == this.body[i][0] && this.body[0][1] == this.body[i][1]){
						alert("吃到自己死");
						clearInterval(timer);
						alert("本次得分"+sum+"分");
						return;
					}
				
				}
				this.show();
			};
		} 
		
		window.onload = function(){
		 	map = new map();
			map.show(); 
		
			food = new food();
			food.show();
		
			snake = new snake();
			snake.show();
			timer = setInterval("snake.move()",300);
			
			document.onkeydown = function(event){
				var code;
				if(window.event){
					code = window.event.keyCode;
				}else{
					code = event.keyCode;
				}
				snake.setDirect(code);
			};
		};
	</script>
	
  </head>
  
  <body>
    贪吃蛇游戏 <br>
   
  </body>
</html>
