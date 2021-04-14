<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         List of BMI Entries
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>

        <div class="row">
        <div class="col-sm-4"></div>

        <div class="col-sm-4">

        <h1>Hello ${sessionScope.email} </h1>
        This is a list of all your BMI Entries in the database so far:

        <table class="table">
            <tr><thead><th>Id</th><th>BMI</th><th>Højde</th><th>Vægt</th><th>Køn</th></thead></tr>
            <c:forEach var="bmiEntry" items="${requestScope.bmiEntryList}">
                <tr>
                    <td>${bmiEntry.id}</td>
                    <td>${bmiEntry.bmi}</td>
                    <td>${bmiEntry.height}</td>
                    <td>${bmiEntry.weight}</td>
                    <td>${bmiEntry.gender}</td>
                </tr>
            </c:forEach>

        </table>

        </div>
        <div class="col-sm-4">

    </jsp:body>
</t:genericpage>
