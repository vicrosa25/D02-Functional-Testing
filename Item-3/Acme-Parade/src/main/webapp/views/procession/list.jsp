<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<style type="text/css">
.tableColumnSubmitted {
	background-color: grey;
	color: Black;
}

.tableColumnAccepted {
	background-color: LimeGreen;
	color: Black;
}

.tableColumnRejected {
	background-color: FireBrick;
	color: White;
}

.tableColumnBlack {
	background-color: white;
	color: black;
}
</style>


<display:table name="processions" id="row" requestURI="${uri}" pagesize="5" class="displaytag">

	<!-- Row color -->
 	<jstl:if test="${not empty bro}">
	<jstl:choose>
		<jstl:when test="${row.status == 'SUBMITTED'}">
			<jstl:set var="css" value="tableColumnSubmitted" />
		</jstl:when>

		<jstl:when test="${row.status == 'APPROVED'}">
			<jstl:set var="css" value="tableColumnAccepted" />
		</jstl:when>

		<jstl:when test="${row.status == 'REJECTED'}">
			<jstl:set var="css" value="tableColumnRejected" />
		</jstl:when>

		<jstl:otherwise>
			<jstl:set var="css" value="tableColumnBlack" />
		</jstl:otherwise>
	</jstl:choose>
	</jstl:if>
	<jstl:if test="${row.draftMode}">
		<jstl:set var="css" value="tableColumnBlack" />
	</jstl:if>
	
	
	
	
	<security:authorize access="hasRole('BROTHERHOOD')">
	<jstl:if test="${not empty bro}">
		<spring:message code="procession.edit" var="editHeader" />
		<display:column title="${editHeader}" class="${css}">
			<a href="procession/brotherhood/edit.do?processionId=${row.id}"> <spring:message code="procession.edit" /></a>
		</display:column>
	</jstl:if>
	</security:authorize>

	<!-- title -->
	<spring:message code="procession.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" class="${css}"/>

	<!-- ticker -->
	<spring:message code="procession.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}" class="${css}"/>

	<!-- description -->
	<spring:message code="procession.description" var="descriptionHeader" />
	<display:column property="description" title="${ descriptionHeader }" class="${css}"/>

	<!-- moment -->
	<spring:message code="procession.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}" format="{0,date,dd/MM/yyyy}" class="${css}"/>

	<!-- brotherhood -->
	<spring:message code="procession.brotherhood" var="brotherhoodHeader" />
	<display:column property="brotherhood.title" title="${brotherhoodHeader}" class="${css}"/>
	
	<!-- draftMode -->
<%-- 	<spring:message code="procession.draftMode" var="draftModeHeader" /> --%>
<%-- 	<display:column property="draftMode" title="${draftModeHeader}" /> --%>

	<security:authorize access="hasRole('BROTHERHOOD')">
	<jstl:if test="${not empty bro}">
		<spring:message code="procession.delete" var="deleteHeader" />
		<spring:message code="path.manage" var="pathHeader" />
		<spring:message code="procession.status" var="statusHeader" />
		
		<display:column property="status" title="${statusHeader}" class="${css}"/>
		
		<display:column title="${pathHeader}" class="${css}">
			<a href="path/brotherhood/list.do?processionId=${row.id}"> <spring:message code="path.list" /></a>
		</display:column>
		
		<display:column title="${copyHeader}" class="${css}">
			<a href="procession/brotherhood/copy.do?processionId=${row.id}"> <spring:message code="procession.copy" /></a>
		</display:column>
		
		<display:column title="${deleteHeader}" class="${css}">
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