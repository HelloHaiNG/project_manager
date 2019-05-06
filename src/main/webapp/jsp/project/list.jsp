<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>项目列表</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
          rel=stylesheet>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
    <SCRIPT language=javascript>
        function to_page(page) {
            if (page) {
                $("#page").val(page);
            }
            document.projectForm.submit();

        }
        function update() {
            document.projectForm.action="${pageContext.request.contextPath }/project/update.action";
            document.projectForm.submit();
        }
    </SCRIPT>

    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
<FORM id="projectForm" name="projectForm"
      action="${pageContext.request.contextPath }/project/list.action?currentPage=1"
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
                        <TD class=manageHead>当前位置：项目管理 &gt; 项目列表</TD>
                    </TR>
                    <TR>
                        <TD height=2></TD>
                    </TR>
                </TABLE>
                <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
                       width="100%" align=center border=0>
                    <TBODY>
                    <TR>
                        <TD height=25>
                            <TABLE cellSpacing=0 cellPadding=2 border=0>
                                <TBODY>
                                <TR>
                                    <TD>项目名称：</TD>
                                    <TD><INPUT class=textbox id=sChannel2
                                               style="WIDTH: 80px" maxLength=50 name="pname"
                                               value="${projectCustom.pname}"></TD>

                                    <TD><INPUT class=button id=sButton2 type=submit
                                               value="查找" name=sButton2></TD>
                                    <TD><INPUT class=button id=sButton2 type="button"
                                               value="批量修改" name=sButton2 onclick="update()"></TD>
                                </TR>
                                </TBODY>
                            </TABLE>
                        </TD>
                    </TR>

                    <TR>
                        <TD>
                            <TABLE id=grid
                                   style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                                   cellSpacing=1 cellPadding=2 rules=all border=0>
                                <TBODY>
                                <TR
                                        style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                                    <TD>项目ID</TD>
                                    <TD>项目名称</TD>
                                    <TD>项目时间</TD>
                                    <TD>项目描述</TD>
                                    <TD>添加人</TD>
                                </TR>
                                <c:forEach items="${projectCustoms }" var="project" varStatus="status">
                                    <TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                                        <TD><input type="text" name="projectCustoms[${status.index }].pid"
                                                   value="${project.pid }" readonly="readonly"></TD>
                                        <TD><input type="text" name="projectCustoms[${status.index }].pname"
                                                   value="${project.pname }"></TD>
                                        <TD><input type="text" name="projectCustoms[${status.index }].ptime"
                                                   value="${project.ptime }" readonly="readonly"></TD>
                                        <TD><input type="text" name="projectCustoms[${status.index }].pdetail"
                                                   value="${project.pdetail}"></TD>
                                        <TD><input type="text" name="projectCustoms[${status.index }].uid"
                                                   value="${project.uid}"></TD>
                                    </TR>
                                </c:forEach>
                                </TBODY>
                            </TABLE>
                        </TD>
                    </TR>

                    <TR>
                        <TD><SPAN id=pagelink>
											<DIV
                                                    style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B>${pageBean.totalCount}</B>]条记录,[<B>${pageBean.totalPage}</B>]页
												,当前第[<b>${pageBean.currentPage}</b>]页
                                                <c:if test="${projectCustom != null}">
                                                    <c:if test="${pageBean.currentPage!=1}">
                                                        [<A href="${pageContext.request.contextPath }/project/list.action?currentPage=${pageBean.currentPage-1 }&pname=${projectCustom.pname}">前一页</A>]
                                                    </c:if>
                                                    <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                                                        [<A href="${pageContext.request.contextPath }/project/list.action?currentPage=${pageBean.currentPage+1 }&pname=${projectCustom.pname}">后一页</A>]
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${projectCustom == null}">
                                                    <c:if test="${pageBean.currentPage!=1}">
                                                        [<A href="${pageContext.request.contextPath }/project/list.action?currentPage=${pageBean.currentPage-1 }">前一页</A>]
                                                    </c:if>
                                                    <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                                                        [<A href="${pageContext.request.contextPath }/project/list.action?currentPage=${pageBean.currentPage+1 }">后一页</A>]
                                                    </c:if>
                                                </c:if>
												<input type="hidden" size="3" id="page" name="page"/>
												
											</DIV>
									</SPAN></TD>
                    </TR>
                    </TBODY>
                </TABLE>
            </TD>
            <TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
                    src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
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
