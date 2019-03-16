<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<display:table name="chapters" id="row" requestURI="${ requestUri }" pagesize="5" class="displaytag">

	<!-- Title -->
	<spring:message code="chapter.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />
	
	
	<!-- Area -->
	<spring:message code="chapter.link.area" var="areaHeader" />
	<display:column>
		<jstl:if test="${ row.area != null }">
			<a href="chapter/area/list.do?areaId=${row.area.id}"> <spring:message code="chapter.link.area" /></a>
		</jstl:if>
		<jstl:if test="${ row.area == null }">
			N/A
		</jstl:if>
	</display:column>

</display:table>




