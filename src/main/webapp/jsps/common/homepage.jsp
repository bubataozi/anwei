

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="head.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/static/js/common/homepage.js"></script>

<style type="text/css">

    /*    #RankingList {border-left: 0px; border-right:0px}*/
    /*    #RankingList th{border-left: 0px; border-right: 0px}*/
    /*    #RankingList td{border-left: 0px; border-right: 0px}*/
    /*    td{border: 1px solid transparent !important;}*/
</style>


<body style="background-color: #ebebeb">

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">快捷方式</div>
                        <div class="layui-card-body">

                            <div class="layui-carousel layadmin-carousel layadmin-shortcut">
                                <div carousel-item>
                                    <ul class="layui-row layui-col-space13" id="Shortcut">

                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">数据</div>
                        <div class="layui-card-body">

                            <div class="layui-carousel layadmin-carousel layadmin-backlog">
                                <div carousel-item>
                                    <ul class="layui-row layui-col-space10">
                                        <li class="layui-col-xs6">
                                            <a href="javascript:;" onclick="layer.tips('不跳转', this, {tips: 3});" class="layadmin-backlog-body">
                                                <h3>用户数量</h3>
                                                <p><cite id="countUser"></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs6">

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">动态</div>
                        <div class="layui-card-body">
                            <dl class="layuiadmin-card-status" id="logShow">

                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md4">

        </div>

    </div>
</div>
</body>
