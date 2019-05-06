﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>添加用户</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
    <script src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        function loseOnBlur() {
            alert("aaa")
            var username = $("#username").val();
            $.ajax({
                type: "POST",
                url: "/project_manager/user/findUserByUsername.action?timeStamp=" + new Date().getTime(),
                data: "username=" + username,
                success: function (msg) {
                    if (msg === "yes") {
                        $("#sButton2").attr("disabled",disabled);
                    } else {
                        $("#sButton2").removeAttr("disabled");
                    }
                }
            });
        }

        // function loseOnBlur() {
        //     var username = document.getElementById("username").value;
        //     var xmlHttpRequest = null;
        //     if (window.XMLHttpRequest) {
        //         xmlHttpRequest = new XMLHttpRequest();
        //     } else {
        //         xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
        //     }
        //     xmlHttpRequest.onreadystatechange = function () {
        //         if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
        //             var string = xmlHttpRequest.responseText;
        //             if (string === "yes") {
        //                 document.getElementById("sButton2").disabled = true;
        //             } else {
        //                 document.getElementById("sButton2").disabled = false;
        //             }
        //         }
        //     }
        //     xmlHttpRequest.open("post", "/project_manager/user/findUserByUsername.action?timeStamp=" + new Date().getTime(), true);
        //     xmlHttpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        //     xmlHttpRequest.send("username=" + username);
        // }
    </script>
    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
<FORM id=form1 name=form1
      action="${pageContext.request.contextPath }/user/add.action"
      method=post>


    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
                              border=0></TD>
            <TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
                height=20></TD>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
                    src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
            <TD vAlign=top width="100%" bgColor=#ffffff>
                <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                    <TR>
                        <TD class=manageHead>当前位置：用户管理 &gt; 添加用户</TD>
                    </TR>
                    <TR>
                        <TD height=2></TD>
                    </TR>
                </TABLE>

                <TABLE cellSpacing=0 cellPadding=5 border=0>
                    <TR>
                        <td>用户名称：</td>
                        <td>
                            <INPUT class=textbox id="username"
                                   style="WIDTH: 180px" maxLength=50 name="username" onclick="loseOnBlur()">
                        </td>
                        <td>用户密码 ：</td>
                        <td>
                            <INPUT class=textbox id=sChannel2
                                   style="WIDTH: 180px" maxLength=50 name="password">
                        </td>
                    </TR>
                    <tr>
                        <td rowspan=2>
                            <INPUT class=button id="sButton2" type=submit
                                   value=" 添加 " name="sButton2" disabled="disabled">
                        </td>
                    </tr>
                </TABLE>
            </TD>
            <TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
                <IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
    <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
                              border=0></TD>
            <TD align=middle width="100%"
                background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
            <TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
                              border=0></TD>
        </TR>
        </TBODY>
    </TABLE>
</FORM>
</BODY>
</HTML>
