<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<display:table name="processions" id="row" requestURI="${uri}" pagesize="5" class="displaytag">

	<security:authorize access="hasRole('BROTHERHOOD')">
	<jstl:if test="${not empty bro}">
		<spring:message code="procession.edit" var="editHeader" />
		<display:column title="${editHeader}">
			<a href="procession/brotherhood/edit.do?processionId=${row.id}"> <spring:message code="procession.edit" /></a>
		</display:column>
	</jstl:if>
	</security:authorize>

	<!-- title -->
	<spring:message code="procession.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />

	<!-- ticker -->
	<spring:message code="procession.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}" />

	<!-- description -->
	<spring:message code="procession.description" var="descriptionHeader" />
	<display:column property="description" title="${ descriptionHeader }" />

	<!-- moment -->
	<spring:message code="procession.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}" format="{0,date,dd/MM/yyyy}" />

	<!-- brotherhood -->
	<spring:message code="procession.brotherhood" var="brotherhoodHeader" />
	<display:column property="brotherhood.title" title="${brotherhoodHeader}" />
	
	<!-- draftMode -->
<%-- 	<spring:message code="procession.draftMode" var="draftModeHeader" /> --%>
<%-- 	<display:column property="draftMode" title="${draftModeHeader}" /> --%>

	<security:authorize access="hasRole('BROTHERHOOD')">
	<jstl:if test="${not empty bro}">
		<spring:message code="procession.delete" var="deleteHeader" />
		<spring:message code="path.list" var="pathHeader" />
		
		<display:column title="${pathHeader}">
			<a href="path/brotherhood/list.do?processionId=${row.id}"> <spring:message code="path.list" /></a>
		</display:column>
		
		<display:column title="${copyHeader}">
			<a href="procession/brotherhood/copy.do?processionId=${row.id}"> <spring:message code="procession.copy" /></a>
		</display:column>
		
		<display:column title="${deleteHeader}">
			<a href="procession/brotherhood/delete.do?processionId=${row.id}"> <spring:message code="procession.delete" /></a>
		</display:column>
	</jstl:if>
	</security:authorize>

</display:table>

<security:authorize access="hasRole('BROTHERHOOD')">
<jstl:if test="${not empty bro}">
	<a href=procession/brotherhood/create.do><spring:message code="procession.create" /></a>
</jstl:if>
</security:authorize>

<security:authorize access="isAnonymous()">
	<acme:cancel code="member.goback" url="/brotherhood/list.do" />
</security:authorize>