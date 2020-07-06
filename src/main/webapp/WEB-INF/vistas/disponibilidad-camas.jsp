<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Reportes</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        #navbar-top:hover {
            text-decoration: none;
        }

        .container-chart {
            margin-top: 10em;
        }

    </style>
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-dark sticky-top bg-primary flex-md-nowrap p-0 shadow">
    <%--    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">COVIDTEST</a>--%>
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="home">
        <img src="img/share2.png" width="35" height="35" class="d-inline-block align-top" alt="logo">
        AsignAR
    </a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
            data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!--   <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search"> -->
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a href="logout" class="btn btn-dark ml-5" role="button"
               aria-disabled="true">Log out</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="bienvenido">
                            <span data-feather="home"></span>
                            Home Instituci�n
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="#">
                            <span data-feather="inbox"></span>
                            Disponibilidad Camas
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="posiblesinfectados">
                            <span data-feather="users"></span>
                            Lista de Espera
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="grafico-pacientes">
                            <span data-feather="bar-chart-2"></span>
                            Reportes
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="container m-5">
                <form action="internar" method="get">

                    <div class="table-responsive">


                        <table class="table table-striped table-sm">
                            <tr>
                                <th>Id</th>
                                <th>Descripci�n</th>
                                <th>Acci�n</th>
                            </tr>
                            <c:forEach items="${camas}" var="cama">
                                <tr>
                                    <th><c:out value="${cama.getId()}"/></th>
                                    <td><c:out value="${cama.getDescripcion()}"/></td>
                                    <td>
                                        <div class="form-action">
                                            <button type="submit" class="btn btn-sm btn-outline-secondary">Internar
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </form>
            </div>

        </main>

    </div>
</div>

</main>

</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="../assets/dist/js/bootstrap.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>
