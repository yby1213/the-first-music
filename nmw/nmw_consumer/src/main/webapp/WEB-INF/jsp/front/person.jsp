<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html class="no-js" lang="en"> <!--<![endif]-->
<head>


    <meta charset="utf-8">
    <title>个人中心</title>
    <meta name="description" content="">
    <meta name="author" content="">


    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/style/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/style/main2.css">
    <script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/validation.js"></script>
</head>

<body id="top">

<section id="about">

    <div class="row section-intro">
        <div class="col-twelve">

            <h1>个人中心</h1>

                <div class="intro-info">
                    <img src="${userSession.userPic}" alt="Profile Picture">
                </div>
        </div>
    </div>
                <div class="row about-content">

                    <div class="col-twelve tab-full">
                        <form id="userForm" method="post" enctype="multipart/form-data"
                              action="${pageContext.request.contextPath }/userMod">
                            <input type="hidden" name="id" value="${userSession.id }"/>
                        <ul class="info-list">
                            <li>
                                <strong>用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;</strong>
                                <input type="text" name="userName" id="uname" value="${userSession.userName}"/>
                                <span class="info_span" id="spanUserName"></span>
                            </li>
                            <li>
                                <strong>手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;</strong>
                                <input type="text" name="phone" id="tel" value="${userSession.phone}"/>
                                <span class="info_span" id="spanPhone"></span>
                            </li>
                            <li>
                                <strong>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</strong>
                                <input type="text" name="userPwd" id="pwd" value="${userSession.userPwd}"/>
                                <span class="info_span" id="spanUserPwd"></span>
                            </li>
                            <li>

                                <strong>文件上传：</strong>
                                <input name="attach" type="file">
                            </li>
                        </ul>
        <div class="row button-section">
            <div class="col-twelve">

                <input type="submit" value="保存">
                <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回上一页">
            </div>
        </div>
                        </form>
    </div>
                </div>
</section>
</body>
</html>