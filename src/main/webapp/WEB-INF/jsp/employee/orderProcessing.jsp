<%--
  Created by IntelliJ IDEA.
  User: Самат
  Date: 10.11.2018
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${locale.get("signup.title")}</title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="js/bootstrap.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <script src="js/ajax.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans+SC:400,700&amp;subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 logo">
                <a href="adminPage"><img src="img/travel.png" width=350 alt="travel"></a>
            </div>
            <div class="col-lg-7 ml-auto">
                <li class="menu__item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${locale.get("select.language")}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown3">
                        <a class="dropdown-item" href="?lang=Ru">${locale.get("russian-lang")}</a>
                        <a class="dropdown-item" href="?lang=En">${locale.get("english-lang")}</a>
                    </div>
                </li>

                <ul class="menu d-flex justify-content-center">
                    <li class="menu__item">
                        <a href="<c:url value="orderProcessing"/>">
                            Обработка запросов
                        </a>
                    </li>

                    <li class="menu__item">
                        <a href="<c:url value="signOut"/>">
                            ${locale.get("log.out")}
                        </a>
                    </li>

                </ul>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 offer">
                <h1 class="offer__title">
                    <%if(request.getAttribute("employeeFirstName")!=null) {
                        out.print(request.getAttribute("employeeLastName")+" "+request.getAttribute("employeeFirstName"));
                    }else{
                        out.print("Anonimus");
                        response.sendRedirect("/signIn");
                    }
                    %>
                </h1>
                <div class="offer__intro">
                    <%--${locale.get("quote.exp")}--%>
                </div>
                <p class="offer__text">
                    <%--${locale.get("quote.author")}--%>
                </p>
            </div>
            <div class="col-lg-2 ml-auto shuttle">
                <img src="img/plane.png" width=450>
            </div>
        </div>
    </div>
</header>

<section class="features">
    <div class="container">
        <div class="row">





            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Last Name</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>City</th>
                    <th>Button</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <th scope="row">${order.id}</th>
                        <td><c:out value="${order.client.lastName}"></c:out></td>
                        <td><c:out value="${order.client.firstName}"></c:out></td>
                        <td><c:out value="${order.client.middleName}"></c:out></td>
                        <td><c:out value="${order.client.email}"></c:out></td>
                        <td><c:out value="${order.client.phoneNumber}"></c:out></td>
                        <td><c:out value="${order.city.name}"></c:out></td>
                        <td><button type="button" class="btn btn-success" id="t${order.id}" onclick="accept(${order.id}, this.id)">Принять</button>
                            <button type="button" class="btn btn-danger" id="f${order.id}" onclick="reject(${order.id}, this.id)">Отклонить</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>

<section class="contact">
    <div class="container">
        <div class="col-lg-12">
            <h1 align="center">${locale.get("signup.feedback")}</h1><br>
            <h3 align="center">${locale.get("question.text")} </h3>
            <button type="button" class="btn btn-primary btn-lg btn-block quest" data-toggle="modal" data-target="#questModal">${locale.get("send")}</button>
        </div>
    </div>
</section>

<div class="modal fade" id="questModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${locale.get("new.question")}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">${locale.get("your.number")}</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">${locale.get("message")}</label>
                        <textarea class="form-control" id="message-text"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">${locale.get("close")}</button>
                <button type="button" class="btn btn-primary">${locale.get("send")}</button>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="credits">
                    Made by Samat Zaydullin<br>
                    All rights reserved
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>

