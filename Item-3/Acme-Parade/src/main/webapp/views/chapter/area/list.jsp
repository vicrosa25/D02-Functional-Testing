<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<display:table name="areas" id="row" requestURI="${ requestUri }" pagesize="5" class="displaytag">

	
	<!-- Title -->
	<spring:message code="area.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />
	
	<!-- Brotherhoods -->
	<spring:message code="area.bros" var="brosHeader" />
	<display:column title="${brosHeader}">
		<jstl:forEach var="bro" items="${row.brotherhoods}" varStatus="loop">
			${bro.title}${!loop.last ? ',' : ''}&nbsp
		</jstl:forEach>
	</display:column>
     
</display:table>


















