<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/4
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<%pageContext.setAttribute("IMG_PATH", request.getContextPath().concat("/static/images/article/"));%>
<div>
  <c:if test="${pageInfo.list.size() > 0}">
    <input id="pageNum" type="hidden" value="${pageInfo.pageNum}">
    <c:forEach var="article" items="${pageInfo.list}">
      <c:if test="${article.status==1}">
        <div class="top-20 clearfix">
          <div class="wid-70 pull-left">
            <a href="${APP_PATH.concat("/article/detail.do?id=").concat(article.fid)}"><h4>${article.titles}</h4></a>
            <p>${fn:substring(article.fcontent, 0, 100)}</p>
            <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(article.userid)}">
              <small>
            <span class="glyphicon glyphicon-user" aria-hidden="true">
                ${article.username}
            </span>
              </small>
            </a>
            <span style="margin: 0 10px;"></span>
            <a href="javascript:void(0);">
              <small>
            <span class="glyphicon glyphicon-map-marker" aria-hidden="true">
            </span>${article.bname}
              </small>
            </a>
          </div>
          <div class="wid-30 pull-right">
            <a href="#">
              <img class="article-pic" src="${IMG_PATH.concat(article.photo)}" alt="picture">
            </a>
          </div>
        </div>
        <hr>
      </c:if>
    </c:forEach>
  </c:if>
  <c:if test="${pageInfo.list.size() <= 0}">
    <div style="height: 30px;"></div>
    <img class="img-thumbnail center-block" src="${APP_PATH}/static/images/icons/null.png" alt="">
  </c:if>

  <c:if test="${pageInfo.pageNum < pageInfo.pages}">
    <div style="height: 50px; width: 100%;"></div>
    <button onclick="loadMorePlate()" class="btn btn-block btn-info">加载更多</button>
  </c:if>
  <c:if test="${pageInfo.pageNum == pageInfo.pages}">
    <div style="height: 50px; width: 100%;"></div>
    <button class="btn btn-block btn-primary">已加载全部</button>
  </c:if>
</div>