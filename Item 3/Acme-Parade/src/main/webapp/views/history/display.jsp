<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<spring:message code="history.title" var="titleHeader" />
<spring:message code="history.description" var="descriptionHeader" />
<spring:message code="brotherhood.picture" var="pictureNameHeader" />
<spring:message code="history.pictures.view" var="viewPicturesHeader" />
<spring:message code="history.edit" var="editHeader" />

<!-- Inception Record -->
	<display:table name="history.inceptionRecord"  id="row" >
		<display:column property="title" title="${titleHeader}" sortable="false" />
		
		<display:column property="description" title="${desscriptionHeader}" sortable="false" />
		
	<display:caption><spring:message code="history.inceptionRecord"/></display:caption>
	</display:table>
	
<!-- Inception Pictures -->
	<jstl:if test="${not empty history.inceptionRecord.pictures}">
	<display:table name="history.pictures"  id="row" >
		
		<display:column title="${pictureNameHeader}" sortable="false" >
			<img src="${row.link}" width="50%" height="200"/>
		</display:column>
				
	<display:caption><spring:message code="brotherhood.pictures"/></display:caption>
	</display:table>
	</jstl:if>
	
	<jstl:if test="${not empty bro}">
		<a href="history/brotherhood/inceptionRecord.do">
			<spring:message code="history.record.edit"/>
		</a>
	</jstl:if>
	
	
<!-- Period Records -->	
<br>
<jstl:if test="${not empty history.periodRecords}">
<display:table name="history.periodRecords"  id="row" >
	<display:column property="title" title="${titleHeader}" sortable="false" />
		
	<display:column property="description" title="${desscriptionHeader}" sortable="false" />
	
	<spring:message code="history.startYear" var="startYearHeader" />
	<display:column property="startDate" title="${startDateHeader}" sortable="false" />

	<spring:message code="history.endYear" var="endYearHeader" />
	<display:column property="endDate" title="${endDateHeader}" sortable="false" />
	
	<jstl:if test="${not empty row.pictures}">
	<display:column  title="${viewPicturesHeader}" sortable="false">
			<a href="history/viewPictures.do?recordId=${row.id}">
				<spring:message code="history.pictures.view" />
			</a>
	</display:column>
	</jstl:if>
	
	<jstl:if test="${not empty bro}">
	<display:column title="${editHeader}">
		<a href="history/brotherhood/periodRecord/edit.do?periodRecordId=${row.id}">
			<spring:message code="history.edit"/>
		</a>
	</display:column>
	</jstl:if>
	
<display:caption><spring:message code="history.periodRecords"/></display:caption>
</display:table>
</jstl:if>
	
<jstl:if test="${not empty bro}">
	<a href="history/brotherhood/periodRecord/create.do">
		<spring:message code="history.record.edit"/>
	</a>
</jstl:if>
	
	
<!-- Legal Records -->	
<br>
<jstl:if test="${not empty history.legalRecords}">
<display:table name="history.legalRecords"  id="row" >
	<display:column property="title" title="${titleHeader}" sortable="false" />
		
	<display:column property="description" title="${desscriptionHeader}" sortable="false" />
	
	<spring:message code="history.legalName" var="legalNameHeader" />
	<display:column property="legalName" title="${legalNameHeader}" sortable="false" />

	<spring:message code="history.vat" var="VatHeader" />
	<display:column property="vat" title="${VatHeader}" sortable="false" />
	
	<spring:message code="history.laws" var="lawsHeader" />
	<display:column property="laws" title="${lawsHeader}" sortable="false" />
	
	<jstl:if test="${not empty bro}">
	<display:column title="${editHeader}">
		<a href="history/brotherhood/legalRecord/edit.do?legalRecordId=${row.id}">
			<spring:message code="history.edit"/>
		</a>
	</display:column>
	</jstl:if>
	
<display:caption><spring:message code="history.legalRecords"/></display:caption>
</display:table>
</jstl:if>
	
<jstl:if test="${not empty bro}">
	<a href="history/brotherhood/legalRecord/create.do">
		<spring:message code="history.record.edit"/>
	</a>
</jstl:if>
	
	
<!-- Link Records -->	
<br>
<jstl:if test="${not empty history.linkRecords}">
<display:table name="history.linkRecords"  id="row" >
	<display:column property="title" title="${titleHeader}" sortable="false" />
		
	<display:column property="description" title="${desscriptionHeader}" sortable="false" />
	
	<spring:message code="brotherhood.title" var="titleLinkHeader" />
	<display:column property="link.title" title="${titleLinkHeader}" sortable="false" />

	<display:column>
		<a href="brotherhood/history/display.do?brotherhoodId=${row.link.id}">
			<spring:message code="brotherhood.history" />
		</a>
	</display:column>
	
	<jstl:if test="${not empty bro}">
	<display:column title="${editHeader}">
		<a href="history/brotherhood/linkRecord/edit.do?linkRecordId=${row.id}">
			<spring:message code="history.edit"/>
		</a>
	</display:column>
	</jstl:if>
<display:caption><spring:message code="history.legalRecords"/></display:caption>
</display:table>
</jstl:if>
	
<jstl:if test="${not empty bro}">
	<a href="history/brotherhood/linkRecord/create.do">
		<spring:message code="history.record.edit"/>
	</a>
</jstl:if>
	
	
<!-- Misc Records -->	
<br>
<jstl:if test="${not empty history.miscellaneousRecords}">
<display:table name="history.miscellaneousRecords"  id="row" >
	<display:column property="title" title="${titleHeader}" sortable="false" />
		
	<display:column property="description" title="${desscriptionHeader}" sortable="false" />
	
	<jstl:if test="${not empty bro}">
	<display:column title="${editHeader}">
		<a href="history/brotherhood/miscellaneousRecord/edit.do?miscellaneousRecordId=${row.id}">
			<spring:message code="history.edit"/>
		</a>
	</display:column>
	</jstl:if>
		
<display:caption><spring:message code="history.miscellaneousRecords"/></display:caption>
</display:table>
</jstl:if>
	
<jstl:if test="${not empty bro}">
	<a href="history/brotherhood/miscellaneousRecord/create.do">
		<spring:message code="history.record.edit"/>
	</a>
</jstl:if>