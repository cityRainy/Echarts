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
    <div id="console" style="border: 1px solid red;width: 400px;height: 20px;float: left;"></div>
    <div id="hover-console" style="border: 1px solid blue;width: 400px;height: 20px; float: right;"> </div>
    <!--Step:2 Import echarts.js-->
    <!--Step:2 引入echarts.js-->
    <script src="<%=basePath %>echarts-2.2.2/build/dist/echarts.js"></script>
</body>
<script type="text/javascript">
// Step:3 conifg ECharts's path, link to echarts.js from current page.
// Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
require.config({
    paths: {
        echarts: './echarts-2.2.2/build/dist'
    }
});

// Step:4 require echarts and use it in the callback.
// Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
require(
    [
        'echarts',
        'echarts/chart/bar',
        'echarts/chart/line',
        'echarts/chart/map',
        'echarts/chart/pie'
    ],
    function (ec) {
        //--- 折柱 ---
        var myChart = ec.init(document.getElementById('main'));
       	var option = {
       		    tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['最高','最低']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {readOnly:false},
                magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        dataZoom : {
            show : true,
            realtime : true,
            start : 40,
            end : 60
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap : true,
                data : function (){
                    var list = [];
                    for (var i = 1; i <= 30; i++) {
                        list.push('2013-03-' + i);
                    }
                    return list;
                }()
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'最高',
                type:'line',
                data:function (){
                    var list = [];
                    for (var i = 1; i <= 30; i++) {
                        list.push(Math.round(Math.random()* 30) + 30);
                    }
                    return list;
                }()
            },
            {
                name:'最低',
                type:'bar',
                data:function (){
                    var list = [];
                    for (var i = 1; i <= 30; i++) {
                        list.push(Math.round(Math.random()* 10));
                    }
                    return list;
                }()
            }
        ]
    };
    myChart.setOption(option);  
    var ecConfig = require('echarts/config');//读取配置，以获取事件源类型
    myChart.on(ecConfig.EVENT.CLICK, eConsole);//给指定操作，绑定事件与处理方法
    function eConsole(param) {//事件的处理方法
        alert(param.type);
        var mes = '【' + param.type + '】';
        if (typeof param.seriesIndex != 'undefined') {
            mes += '  seriesIndex : ' + param.seriesIndex;
            mes += '  dataIndex : ' + param.dataIndex;
        }
        if (param.type == 'hover') {
            document.getElementById('hover-console').innerHTML = 'Event Console : ' + mes;
        }
        else {
            document.getElementById('console').innerHTML = mes;
        }
        console.log(param);
    }
    /*
    // -------全局通用
    REFRESH: 'refresh',
    RESTORE: 'restore',
    RESIZE: 'resize',
    CLICK: 'click',
    DBLCLICK: 'dblclick',
    HOVER: 'hover',
    MOUSEOUT: 'mouseout',
    // -------业务交互逻辑
    DATA_CHANGED: 'dataChanged',
    DATA_ZOOM: 'dataZoom',
    DATA_RANGE: 'dataRange',
    DATA_RANGE_HOVERLINK: 'dataRangeHoverLink',
    LEGEND_SELECTED: 'legendSelected',
    LEGEND_HOVERLINK: 'legendHoverLink',
    MAP_SELECTED: 'mapSelected',
    PIE_SELECTED: 'pieSelected',
    MAGIC_TYPE_CHANGED: 'magicTypeChanged',
    DATA_VIEW_CHANGED: 'dataViewChanged',
    TIMELINE_CHANGED: 'timelineChanged',
    MAP_ROAM: 'mapRoam',
    */
    //myChart.on(ecConfig.EVENT.CLICK, eConsole);
    //myChart.on(ECCONFIG.EVENT.DBLCLICK, eConsole);
    //myChart.on(ecConfig.EVENT.HOVER, eConsole);
    //myChart.on(ecConfig.EVENT.DATA_ZOOM, eConsole);
    //myChart.on(ecConfig.EVENT.LEGEND_SELECTED, eConsole);
    //myChart.on(ecConfig.EVENT.MAGIC_TYPE_CHANGED, eConsole);
    //myChart.on(ecConfig.EVENT.DATA_VIEW_CHANGED, eConsole);
                        
        
       
               
    }//end function
);



	                    













</script>
</html>
