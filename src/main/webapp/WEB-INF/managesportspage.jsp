<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         List of sports
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>

        <div class="row">
        <div class="col-sm-4"></div>

        <div class="col-sm-4">

        <h1>Hello ${sessionScope.email} </h1>
        <h3>This is a list of all sports:</h3>

        <form action="${pageContext.request.contextPath}/fc/managesports" method="post">
            <table class="table">
                <thead><th>Id</th><th>Name</th><th></th><th></th></thead>
                <c:forEach var="sportItem" items="${applicationScope.sportList}">
                    <tr>
                        <td>${sportItem.sport_id}</td>
                        <td>${sportItem.name}</td>
                        <td><button class="btn btn-danger btn-sm" type="submit" name="delete" value="${sportItem.sport_id}" >Fjern</button></td>
                        <td><button class="btn btn-primary btn-sm" type="submit" name="edit" value="${sportItem.sport_id}" >Rediger</button></td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${not empty requestScope.error}">
                <br/>
                <p style="color:red;font-size: large">${requestScope.error}</p>
            </c:if>
        </form>

        </div>
        <div class="col-sm-4">

    </jsp:body>
</t:genericpage>
