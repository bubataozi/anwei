/*
layui.use(['index', 'carousel', 'form'], function () {
    var carousel = layui.carousel
        , form = layui.form;

    //常规轮播
    carousel.render({
        elem: '#test-carousel-normal'
        , arrow: 'always'
        , width: 'auto'
        , height: '400px'
    });
})


// 基于准备好的dom，初始化echarts实例
var myChart1 = echarts.init(document.getElementById('main'));
var myChart2 = echarts.init(document.getElementById('main2'));
//声明一个全局数组 用于加载echarts数据
var originalDataName = [];
var originalDataCount = [];

$(function () {
    var sbfh_date = new Date(), sbfh_dateFirst = '', sbfh_dateLast = '';
    var sbfh_year = sbfh_date.getFullYear();
    //格式化月，如果小于9，前面补0
    var sbfh_month = ("0" + (sbfh_date.getMonth() + 1)).slice(-2);
    //格式化日，如果小于9，前面补0
    var sbfh_day = ("0" + sbfh_date.getDate()).slice(-2);
    sbfh_dateFirst = sbfh_year + "-" + sbfh_month + "-01";
    sbfh_dateLast = sbfh_year + "-" + sbfh_month + "-" + sbfh_day;
    //将默认的时间赋值给input框
    $("#sbfh_dateFirst").val(sbfh_dateFirst);
    $("#sbfh_dateLast").val(sbfh_dateLast);

    //统计时间失焦时间
    // $("#sbfh_dateFirst").blur(function () {
    //     echarts_sbfh();
    // });
    // $("#sbfh_dateLast").blur(function () {
    //     echarts_sbfh();
    // });


    // $.ajax({
    //     url: "//",
    //     type: "post",
    //     dataType: "json",
    //     async: false,
    //     data: {"sbfh_dateFirst":sbfh_dateFirst,"sbfh_dateLast":sbfh_dateLast},
    //     success: function (data) {
    //
    //         for(var k in data){
    //             originalDataName_sbfh.push(k);
    //             originalDataCount_sbfh.push(data[k]);
    //         }
    //         histogram_sbfh(originalDataName_sbfh,originalDataCount_sbfh);
    //     },
    //     error: function () {
    //         alert("请求失败");
    //     }
    // });

    //paixu();
})

function paixu() {
    $.ajax({
        url: "/homePage/findAllGoodsNum",
        type: "post",
        dataType: "json",
        data: {},
        success: function (data) {

        },
        error: function () {
            alert("请求失败");
        }
    });

}

//加载echarts图标
function echarts_sbfh() {
    myChart1.clear();
    var sbfh_dateFirst = $("#sbfh_dateFirst").val();
    var sbfh_dateLast = $("#sbfh_dateLast").val();

    $.ajax({
        url: "/sbzt/getsbfhById",
        type: "post",
        dataType: "json",
        async: false,
        data: {"sbfh_dateFirst": sbfh_dateFirst, "sbfh_dateLast": sbfh_dateLast},
        success: function (data) {
            originalDataName_sbfh = [];
            originalDataCount_sbfh = [];
            for (var k in data) {
                originalDataName_sbfh.push(k);
                originalDataCount_sbfh.push(data[k]);
            }
            histogram_sbfh(originalDataName_sbfh, originalDataCount_sbfh);

        },
        error: function () {
            alert("请求失败");
        }
    });
}

//柱状图
function histogram_sbfh(originalDataName_sbfh, originalDataCount_sbfh) {

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '设备负荷率统计报告',
            x: 'center'
        },
        tooltip: {
            trigger: 'axis',
        },
        xAxis: {
            type: 'category',
            data: originalDataName_sbfh,
            name: '设备名称',
        },
        yAxis: {
            type: 'value',
            max: 100,
            axisLabel: {
                show: true,
                interval: 'auto',
                formatter: '{value}%'
            },
        },
        dataZoom: [
            {
                type: 'slider',
                show: true,
                xAxisIndex: [0],
                start: 1,
                end: 35
            }, {
                type: 'inside',
                xAxisIndex: [0],
                start: 1,
                end: 35
            }

        ],
        series: [{
            data: originalDataCount_sbfh,
            type: 'bar',
            name: '设备负荷率',
            itemStyle: {
                normal: {
                    color: '#4ad2ff'
                }
            }
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option);
}*/



$(function () {
    Shortcut();
    logShow()
    countUser();
    countQuestion();
    RankingListTop10()

})
//快捷方式
function Shortcut() {
    $.ajax({
        type: "post",
        url: "/user/loading_res",
        data: {},
        dataType: "json",
        error: function (error) {
            layer.alert('加载失败！', {
                title: '提示框',
                icon: 0,
            });
        }, success: function (data) {
            var str ="";
            for (var i = 0; i < data.length; i++) {
                if(data[i].resList.length!=0){
                    for (var j = 0; j < data[i].resList.length; j++) {

                        //访问拼接路径
                        var href = data[i].info+"/"+data[i].resList[j].info+".jsp";
                        var cl = "layui-icon "+data[i].resList[j].icon;
                        str=str+"<li class=\"layui-col-xs3\">\n" +
                            "        <a lay-href=\""+href+"\">\n" +
                            "          <i class=\""+cl+"\"></i>\n" +
                            "          <cite>"+data[i].resList[j].resName+"</cite>\n" +
                            "        </a>\n" +
                            "         </li>";
                    }
                }
            }
            $("#Shortcut").append(str);
        }
    });
}

// 动态
function logShow() {
    $.ajax({
        type: "post",
        url: "/user/logShow",
        data: {},
        dataType: "json",
        error: function (error) {
            layer.alert('加载失败！', {
                title: '提示框',
                icon: 0,
            });
        }, success: function (data) {
            var str ="";
            for (var i = 0; i < data.length; i++) {
                str= str +"<dd>\n" +
                    "         <div class=\"layui-status-img\"><a href=\"javascript:;\"><img src=\"/static/layuiadmin/style/res/logo.png\"></a></div>\n" +
                    "            <div>\n" +
                    "                <p><font color='red'>"+data[i].name+"</font>在"+data[i].operationTime+" 进行了"+data[i].remark+"操作</p>\n" +
                    "            </div>\n" +
                    "      </dd>";
            }
            $("#logShow").append(str);
        }
    });
}

// 用户统计
function countUser() {
    $.ajax({
        type: "post",
        url: "/user/countUser",
        data: {},
        dataType: "json",
        error: function (error) {
            layer.alert('加载失败！', {
                title: '提示框',
                icon: 0,
            });
        }, success: function (data) {
            $("#countUser").append(data)
        }
    });
}

// 统计题目
function countQuestion() {
    $.ajax({
        type: "post",
        url: "/user/countQuestion",
        data: {},
        dataType: "json",
        error: function (error) {
            layer.alert('加载失败！', {
                title: '提示框',
                icon: 0,
            });
        }, success: function (data) {
            $("#countQuestion").append(data)
        }
    });
}


function RankingListTop10(){
    $("#RankingList").bootstrapTable('destroy');
    $("#RankingList").bootstrapTable({ // 对应table标签的id
        url:"/user/RankingListTop10",
        cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
        striped: false,  //表格显示条纹，默认为false
        columns: [
            {
                field: 'id', // 返回json数据中的name
                title: '排名', // 表格表头显示文字
                align: 'center',
                formatter: function (value, row, index) {//单元格格式化函数，有三个参数：value： 该列的字段值；row： 这一行的数据对象；index： 行号，第几行，从0开始计算
                    return index + 1;
                }
            },
            {
                align:'center',
                field:'questionBack',
                title:'题目',
                width:'60%',
                cellStyle: formatTableUnit,
                formatter: paramsMatter
            },
            {
                title: "所属关卡",
                field: 'gameLevelName',
                align: 'center', // 居中显示
                width:'20%'
            },
            {
                title: "次数",
                field: 'wrongCountNumber',
                align: 'center', // 居中显示
                width:'20%'
            }
        ]
    })
}

function RankingList() {
    $("#RankingList").bootstrapTable('destroy');
    $("#RankingList").bootstrapTable({ // 对应table标签的id
        url:"/user/RankingList",
        cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
        striped: false,  //表格显示条纹，默认为false
        pagination: true, // 在表格底部显示分页组件，默认false
        pageSize: 10, // 页面数据条数
        pageNumber: 1, // 首页页码
        sidePagination: 'client', // 设置为服务器端分页server   前端分页： client
        columns: [
            {
                field: 'id', // 返回json数据中的name
                title: '排名', // 表格表头显示文字
                align: 'center',
                formatter: function (value, row, index) {//单元格格式化函数，有三个参数：value： 该列的字段值；row： 这一行的数据对象；index： 行号，第几行，从0开始计算
                    return index + 1;
                }
            },
            {
                align:'center',
                field:'questionBack',
                title:'题目',
                width:'60%',
                cellStyle: formatTableUnit,
                formatter: paramsMatter
            },
            {
                title: "所属关卡",
                field: 'gameLevelName',
                align: 'center', // 居中显示
                width:'20%'
            },
            {
                title: "次数",
                field: 'wrongCountNumber',
                align: 'center', // 居中显示
                width:'20%'
            }
        ]
    })
    $("#a1").hide();
}

//表格超出宽度鼠标悬停显示td内容
function paramsMatter(value, row, index) {
    var span = document.createElement("span");
    span.setAttribute("title", value);
    span.innerHTML = value;
    return span.outerHTML;
}
//td宽度以及内容超过宽度隐藏
function formatTableUnit(value, row, index) {
    return {
        css: {
            "white-space": "nowrap",
            "text-overflow": "ellipsis",
            "overflow": "hidden",
            "max-width": "60px"
        }
    }
}

