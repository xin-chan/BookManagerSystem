<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="common/head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

</head>
<div>
        <!-- 中心展示内容 -->
        <span class="hrms_main_ad col-sm-10">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 style="text-align: center;">大耳朵图书馆，欢迎你！</h3>
                </div>
                <div class="panel-body" style="position:relative; top:-15px;">
                    <div id="hrms_carousel_1" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#hrms_carousel_1" data-slide-to="0" class="active"></li>
                            <li data-target="#hrms_carousel_1" data-slide-to="1"></li>
                            <li data-target="#hrms_carousel_1" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner" role="listbox">
                            <div class="item active" style="text-align: center;">
                                <img class="img-responsive center-block" src="${pageContext.request.contextPath }/static/images/company1.png" alt="company1">
                                <div class="carousel-caption">
                                    <h3>漂亮大气的图书馆外观</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="${pageContext.request.contextPath }/static/images/company4.jpg" alt="company1">
                                <div class="carousel-caption">
                                    <h3>休闲的阅读场所</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="${pageContext.request.contextPath }/static/images/company5.jpg" alt="company1">
                                <div class="carousel-caption">
                                    <h3>舒适的学习环境</h3>
                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#chrms_carousel_1" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#hrms_carousel_1" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div><!-- /#hrms_carousel_1 -->
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </span><!-- /.hrms_main_ad -->



    <!-- 尾部 -->
    <div class="hrms_footer" style="text-align: center;">
        <address>
            <strong>Copyright&copy;大耳朵图书馆.Inc</strong><br>
            长安街1号<br>
            <abbr title="Phone">P:</abbr> (123) 010-88888888
        </address>
    </div>
</div>
</body>
</html>
