<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String ctx = request.getContextPath();
%>

<div id="gridWrapper">
    <script src="/qcadooView/public/js/crud/qcd/components/jqGrid/jquery-1.8.3.min.js?ver=2019_10_03_15_48"></script>
    <script type="text/javascript" src="/qcadooView/public/js/core/qcd/core/messagesController.js?ver=2019_10_03_15_48"></script>
    <script src="/qcadooView/public/js/crud/qcd/components/jqGrid/jquery.jqGrid.min.js?ver=2019_10_03_15_48"></script>
    <script src="/qcadooView/public/js/crud/qcd/components/jqGrid/angular.js?ver=2019_10_03_15_48"></script>
    <script src="/basic/public/js/genericLookupOptions.js?ver=2019_10_03_15_48"></script>

    <c:choose>
        <c:when test="${locale == 'pl'}">
            <script type="text/ecmascript" src="/qcadooView/public/js/crud/qcd/components/jqGrid/grid.locale-pl.js"></script>
        </c:when>
        <c:otherwise>
            <script type="text/ecmascript" src="/qcadooView/public/js/crud/qcd/components/jqGrid/grid.locale-en.js"></script>
        </c:otherwise>
    </c:choose>

    <link rel="stylesheet" type="text/css" media="screen" href="/basic/public/css/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/basic/public/css/_jquery-ui-1.8.5.custom.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/qcadooView/public/css/crud/components/window.css?ver=2019_10_03_15_48" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/qcadooView/public/css/crud/components/grid.css?ver=2019_10_03_15_48" type="text/css" />
    
    <link rel="stylesheet" type="text/css" media="screen" href="/basic/public/css/custom.css">

    <script type="text/javascript">
        var QCD = QCD || {};

        QCD.currentLang = '<c:out value="${locale}" />';

        QCD.translate = function (key) {
            return QCD.translations[key] || '[' + key + ']';
        };

        QCD.translations = {};
        <c:forEach items="${translationsMap}" var="translation">
        QCD.translations['<c:out value="${translation.key}" />'] = '<c:out value="${fn:replace(translation.value, '\\\'','\\\\\\'')}" escapeXml="false" />';
                                              </c:forEach>
                                              </script>

                                              <div class="windowContainer" style="background:#9b9b9b;" ng-app="gridApp" ng-controller="GridController" id="GridController">

                                              <div id="gridContainer" ng-init="init('${recordName}');">
                                              <ng-jq-grid config="config" data="data"></ng-jq-grid>
                                              <table id="grid"></table>
                                              <div id="jqGridPager"></div>
                                              </div>
                                              </div>
                                              </div>
