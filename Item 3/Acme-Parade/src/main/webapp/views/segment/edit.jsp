<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="segment/brotherhood/edit.do" modelAttribute="segment">
	
	<%-- Hidden properties from prune--%>
	<form:hidden path="id" />
	<form:hidden path="version" />

	<%-- Origin--%>
	<spring:message code="segment.origin.form"/>
	<acme:numberbox code="segment.latitude" path="originLatitude" />
	<br>
	
	<acme:numberbox code="segment.longitude" path="originLongitude" />
	<br>
	
	<acme:numberbox code="segment.longitude" path="originLongitude" />
	<br>

		<%-- time --%>
	<form:label path="originTime"><spring:message code="segment.origin.time" /></form:label>
	<form:input path="originTime" placeholder="dd/mm/yyyy HH:mm" format="{0,date,dd/MM/yyyy HH:mm}" />	
	<form:errors class="error" path="originTime" />
	<br><br>

	<%-- Destination--%>
	<spring:message code="segment.destination.form"/>
	<acme:numberbox code="segment.latitude" path="destinationLatitude" />
	<br>
	
	<acme:numberbox code="segment.longitude" path="destinationLongitude" />
	<br>

		<%-- time --%>
	<form:label path="destinationTime"><spring:message code="segment.time" /></form:label>
	<form:input path="originTime" placeholder="dd/mm/yyyy HH:mm" format="{0,date,dd/MM/yyyy HH:mm}" />	
	<form:errors class="error" path="originTime" />
	<br><br>
</form:form>