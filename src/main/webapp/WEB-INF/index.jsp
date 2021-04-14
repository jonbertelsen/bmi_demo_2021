<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Forside
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col-sm-4"></div>

            <div class="col-sm-4">

                <div class="text-center">
                    <h1>BMI beregner</h1>
                </div>

                <form method="post" action="${pageContext.request.contextPath}/fc/bmiresult">
                    <div class="form-group">
                        <label for="height">Højde i cm: </label>
                        <input id="height" name="height" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="weight">Vægt i kg: </label>
                        <input id="weight" name="weight" type="text" class="form-control"/><br/>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="male" name="gender" value="male">
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="female" name="gender" value="female">
                        <label class="form-check-label" for="female">Female</label>
                    </div>

                    <div class="form-group mt-2">
                        <label class="form-check-label" for="sport">Din primære idræt:</label>

                        <select class="form-control" name="sport" id="sport">
                            <c:forEach var="sport" items="${applicationScope.sportList}">
                                 <option value="${sport.sport_id}">${sport.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <br/>

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="hobby1" name="hobby" value="1">
                        <label  class="form-check-label" for="vehicle1"> Jeg går op i sund kost</label><br>
                        <input class="form-check-input" type="checkbox" id="hobby2" name="hobby" value="2">
                        <label  class="form-check-label" for="vehicle2"> Jeg har et sommerhus</label><br>
                        <input class="form-check-input" type="checkbox" id="hobby3" name="hobby" value="3">
                        <label  class="form-check-label" for="vehicle3"> Jeg har et kæledyr</label><br><br>
                    </div>

                    <c:if test="${requestScope.error != null}">
                        <p style="color:red;">
                                ${requestScope.error}
                        </p>
                    </c:if>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Beregn BMI</button>
                    </div>
                </form>


            </div>

            <div class="col-sm-4"></div>
        </div>


        <div>

            <c:if test="${sessionScope.role == 'employee' }">
            <p style="font-size: larger">This is what you can do,
                since your are logged in as an employee</p>
            <p><a href="fc/employeepage">Employee Page</a>
                </c:if>

                <c:if test="${sessionScope.role == 'customer' }">
            <p style="font-size: larger">This is what you can do, since your
                are logged in as a customer</p>
            <p><a href="fc/customerpage">Customer Page</a>
                </c:if>

        </div>

    </jsp:body>
</t:genericpage>