<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
</head>

<body>
    <div>初次见面</div>
    <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
    <div id="mainMap" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
    
    <!--Step:2 Import echarts.js-->
    <!--Step:2 引入echarts.js-->
    <script src="<%=basePath %>echarts-2.2.2/build/dist/echarts.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/xztb.js"></script>
</body>
</html>
