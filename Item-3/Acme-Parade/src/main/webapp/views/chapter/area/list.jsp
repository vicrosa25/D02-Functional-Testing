<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<display:table name="areas" id="row" requestURI="${ requestUri }" pagesize="5" class="displaytag">

	
	<!-- Title -->
	<spring:message code="area.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />
	
		
	<!-- Brotherhoods -->
	<spring:message code="area.bros" var="broHeader" />
	<display:column>
		<jstl:if test="${ not empty row.brotherhoods }">
			<a href="chapter/area/brotherhood/list.do?areaId=${row.id}"> <spring:message code="area.bros" /></a>
		</jstl:if>
		<jstl:if test="${ empty row.brotherhoods }">
			N/A
		</jstl:if>
	</display:column>
     
</display:table>

<acme:back code="chapter.back"/>


















