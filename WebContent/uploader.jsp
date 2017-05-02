<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/static/js/webuploader/webuploader.css" />
</head>
<body>

<div id="picker">选择文件</div> <button id="startBtn">开始上传</button>
<ul id="fileList"></ul>

<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/webuploader/webuploader.min.js"></script>

<script type="text/template" id="bar">
	<div class="progress">
		<div class="progress-bar" id="{{id}}" style="width:0%;">
			<span class="sr-only"></span>
		</div>
	</div>
</script>

<script>
	$(function(){
		
		var uploader = WebUploader.create({
			//swf文件路径
			swf:"/static/js/webuploader/Uploader.swf",
			//文件接收服务端
			server:"/upload",
			//选择文件的按钮
			pick:"#picker",
			//不压缩image，默认如果是jpg，文件上传之前会压缩
			resize:false,
			//默认为file
			fileVal:"file",
			//是否自动上传
			//auto:true
		});
		
		//将文件加入队列
		uploader.on("fileQueued",function(file){
			var html = "<li id='"+file.id+"'>"+file.name+"</li>";
			$("#fileList").append($(html));
		});
		
		//文件上传过程中创建进度条实时显示
		uploader.on("uploadProgress",function(file,percentage){
			var num = parseInt(percentage*100);
			var $bar = $("#"+file.id).find("#bar_"+file.id);
			
			if(!$bar[0]){
				var template = $("#bar").html();
				template = template.replace("{{id}}","bar_"+file.id);
				$("#"+file.id).append($(template));
			}else{
				$bar.css("width",num+"%");
			}
		});
		
		//文件上传成功
		uploader.on("uploadSuccess",function(file){
			$("#"+file.id).css("color","green");
		});
		
		//文件上传失败
		uploader.on("uploadError",function(file){
			$("#"+file.id).css("color","darkred");
		});
		
		//不管上传成功失败总要执行的部分
		uploader.on("uploadComplete",function(file){
			$("#"+file.id).find("#bar_"+file.id).parent().remove();
		});
		
		$("#startBtn").click(function(){
			uploader.upload();
		});
		
	});
</script>












</body>
</html>