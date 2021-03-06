<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Genero, datos.Dt_Genero, entidades.Home, datos.Dt_Home, vistas.*, datos.Dt_RolOpciones, java.util.*;" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>PWACP - Portal Web Arboreto Carmelo Palma</title>

    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/logo.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: FlexStart - v1.1.1
    * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

	<div class="banner">
	<!-- ======= Header ======= -->
	<%@ include file="/menu/v_header.jsp" %>
	<!-- End Header -->
	</div>

<main id="main">

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">

            
            <div>

                <div class="row gx-0">

                    <%
                        ArrayList<Home> listHome = new ArrayList<Home>();
                        Dt_Home dth = new Dt_Home();
                        listHome = dth.listaHome();
                    %>

                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up"
                         data-aos-delay="200">
                        <div class="content">
                            <div id="Content-vision" class="Content-vision">
                                <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik01MDkuNjIyLDQ2NC44MjNMNDAyLjAwNCwyODkuOTEyYy0yLjk0My00Ljc4Mi04LjA1Mi03LjYzNy0xMy42NjctNy42MzdjLTUuNjE0LDAtMTAuNzIzLDIuODU2LTEzLjY2NCw3LjYzNw0KCQkJbC0xMy45NzIsMjIuNzA5Yy0yLjE3NCwzLjUzMy0xLjA3Miw4LjE2LDIuNDYxLDEwLjMzNGMzLjUzNSwyLjE3Myw4LjE2LDEuMDcyLDEwLjMzNS0yLjQ2MWwxMy45NzItMjIuNzENCgkJCWMwLjA3NC0wLjEyLDAuMjk5LTAuNDg2LDAuODctMC40ODZjMC41NzEsMCwwLjc5NywwLjM2NiwwLjg3MSwwLjQ4NmwxMDcuNjE4LDE3NC45MTFjMC4wODYsMC4xMzksMC4zMTQsMC41MSwwLjAyMiwxLjAzMw0KCQkJYy0wLjI5MiwwLjUyMy0wLjcyOCwwLjUyMy0wLjg5MiwwLjUyM2gtNTkuNkwyNjkuNjY1LDIwMy4zMzNjLTEuNDk3LTIuNDM0LTMuNTU3LTQuMzY1LTUuOTU4LTUuNjc4DQoJCQljMC4wMDMsMC4wMDEsMC4wMDYsMC4wMDMsMC4wMDgsMC4wMDR2LTUwLjk4YzYuMjUxLDEuNjk1LDEyLjM0LDIuNDE5LDE4LjI5NywyLjQxOWMxNy4xMzIsMCwzMy4xNzUtNS45NTUsNDguODctMTEuNzgxDQoJCQljMjEuNzQ4LTguMDczLDQyLjI5LTE1LjY5OCw2NC41MDgtNi43ODhjMi44NjUsMS4xNDksNi4xMDMsMC44MDMsOC42Ni0wLjkyN2MyLjU2MS0xLjczMiw0LjA4OS00LjYxMSw0LjA4OS03LjcwMVYzNy4wNDQNCgkJCWMwLTMuNzQtMi4yMTktNy4xMDEtNS42NS04LjU2MWMtMjguMjAzLTEyLjAyNy01Mi45MjctMi44NTEtNzYuODM2LDYuMDIzYy0yMi4zOTgsOC4zMTQtNDMuNTUzLDE2LjE2Ny02Ni41ODgsNS44NzINCgkJCWMtMi4zMjUtMS4wMzktNS4wMTYtMC44MjktNy4xNTIsMC41NTVjLTIuMTM2LDEuMzg1LTMuNDI1LDMuNzU3LTMuNDI1LDYuMzAzdjAuMjc5Yy0wLjEyOSwwLjU1OS0wLjIwMywxLjEzOC0wLjIwMywxLjczNnYxNDguNDA4DQoJCQljLTIuMzk3LDEuMzEzLTQuNDU1LDMuMjQzLTUuOTUxLDUuNjc0bC03OS4xMzksMTI4LjYyM2wtMjUuODY4LTQyLjA0M2MtMi45NDItNC43ODItOC4wNTEtNy42MzctMTMuNjY2LTcuNjM3DQoJCQljLTUuNjE0LDAtMTAuNzIzLDIuODU1LTEzLjY2NSw3LjYzN0wyLjM3Nyw0NjQuODIzYy0zLjA0Myw0Ljk0NS0zLjE3MywxMS4xNjYtMC4zNDEsMTYuMjM1YzIuODMyLDUuMDY5LDguMTk5LDguMjE4LDE0LjAwNiw4LjIxOA0KCQkJaDQ3OS45MTVjNS44MDcsMCwxMS4xNzQtMy4xNDksMTQuMDA2LTguMjE4QzUxMi43OTYsNDc1Ljk4OSw1MTIuNjY1LDQ2OS43NjcsNTA5LjYyMiw0NjQuODIzeiBNMjYzLjUxMiw1Ny45MDENCgkJCWMyNC4zMTcsNi42Nyw0Ni4xNTgtMS40MzcsNjcuMzctOS4zMTFjMjAuOTg1LTcuNzksNDAuODY3LTE1LjE2OCw2Mi4yMzQtNy42NDJ2NzIuOTg1Yy0yNC4zOS02LjY4OC00Ni4yNTMsMS40MjgtNjcuNDYyLDkuMw0KCQkJYy0yMC45NSw3Ljc3Ni00MC44MTMsMTUuMTQ5LTYyLjE0Miw3LjY0NlY1Ny45MDF6IE05My4yODIsNDc0LjI1MmwyNS43NzEtNDEuODg1YzIuMTc0LTMuNTMzLDEuMDcyLTguMTYtMi40NjEtMTAuMzM0DQoJCQljLTMuNTM0LTIuMTczLTguMTYtMS4wNzItMTAuMzM0LDIuNDYxbC0zMC42MTUsNDkuNzU4aC01OS42Yy0wLjE2NCwwLTAuNiwwLTAuODkyLTAuNTIzcy0wLjA2NS0wLjg5MywwLjAyMi0xLjAzM2wxMDcuNjE5LTE3NC45MQ0KCQkJYzAuMDc0LTAuMTIsMC4yOTktMC40ODYsMC44Ny0wLjQ4NmMwLjU3MSwwLDAuNzk2LDAuMzY2LDAuODcsMC40ODZsMjkuODQ0LDQ4LjUwNGwtMjkuNzk5LDQ4LjQzMQ0KCQkJYy0yLjE3NCwzLjUzMy0xLjA3Miw4LjE2LDIuNDYxLDEwLjMzNGMzLjUzNSwyLjE3NCw4LjE2MSwxLjA3MiwxMC4zMzQtMi40NjFMMjU1LjEzLDIxMS4yMDVjMC4wNzQtMC4xMiwwLjI5OS0wLjQ4NiwwLjg3LTAuNDg2DQoJCQljMC41NywwLDAuNzk1LDAuMzY2LDAuODcsMC40ODZsMTYxLjg0OCwyNjMuMDQ3SDkzLjI4MnoiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg=="/>
                                <h2>Misi?n</h2>
                            </div>

                            <%
                                for (Home ho : listHome) {
                            %>
                            <p><%=ho.getMision() %>
                            </p>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up"
                         data-aos-delay="200">
                        <div class="content">
                            <div id="Content-vision" class="Content-vision">
                                <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTI1NiAxMzQuMDEzYy02Ny4yNjQgMC0xMjEuOTg3IDU0LjcyNC0xMjEuOTg3IDEyMS45ODdzNTQuNzIzIDEyMS45ODcgMTIxLjk4NyAxMjEuOTg3IDEyMS45ODctNTQuNzIzIDEyMS45ODctMTIxLjk4Ny01NC43MjMtMTIxLjk4Ny0xMjEuOTg3LTEyMS45ODd6bTEwMS4wOTcgMTA4LjQ4NGMtMTIuMDA5IDMuMjItMzMuMjgzIDYuODE1LTQzLjczMS00LjE2OC0yLjU4LTIuNzE2LTQuNzk1LTUuNTMyLTYuOTM3LTguMjU2LTYuMDMxLTcuNjY4LTEyLjg2Ni0xNi4zNTktMjYuMTUxLTE4LjM1NC0xMS43NTYtMS43NjQtMjAuMzY2IDMuNTc2LTI2LjY1NSA3LjQ3My0yLjc2NyAxLjcxNi02LjIwNiAzLjg0LTcuNDYyIDMuNTI2LTI2LjU1OS02Ljg4NC0yNC42NC0yOC4yMDQtMTkuNzEyLTUzLjI4My45MDYtNC42MTMgMS42NDMtOC4zNjIgMS44ODMtMTEuNjA4IDguODAyLTIuNDg0IDE4LjA4Mi0zLjgxMyAyNy42NjgtMy44MTMgNTEuNjU5LS4wMDEgOTQuNDcgMzguNjA2IDEwMS4wOTcgODguNDgzem0tMTUwLjUxMy03NS42OTNjLTIuMTI1IDEwLjg1LTQuNzYxIDI1LjMwMy0xLjk0MiAzOS4xNjQgMy43NDQgMTguNDA0IDE2LjM2NSAzMC44OTEgMzYuNTA0IDM2LjExIDkuNTM0IDIuNDcgMTcuMDA2LTIuMTY1IDIzLjAxMi01Ljg4NiA1LjM3LTMuMzI5IDguODc4LTUuMzM5IDEzLjE1My00LjY5NCA1LjIxNi43ODIgNy44NzYgMy45MTkgMTMuMzk2IDEwLjkzOSAyLjMxMyAyLjk0IDQuOTM0IDYuMjczIDguMTYzIDkuNjcyIDkuODU2IDEwLjM1OSAyMy40MTcgMTMuNTY1IDM2LjQzMiAxMy41NjUgOC4wMjQtLjAwMSAxNS44NC0xLjIyIDIyLjQ1LTIuNzMzLS44NTQgMTIuNjQ1LTQuMDIzIDI0LjY2Ni05LjA4NiAzNS42NC02LjY2Ni01LjA0NC0xNC43NzgtMTEuMDQxLTE5LjA2NS0xMy42NzctMTQuMzgyLTguODQxLTI3Ljk2LTExLjM2LTQwLjM1Ny03LjQ4NC0xOS40MTggNi4wNjktMzAuMTc5IDI2LjE2Ni0zNi41ODUgNDAuNzU2LTcuMjE1IDE2LjQzNi0yMC41OCAyNS40MzQtMzMuOTQ4IDMyLjcwOS0uMDE2LjAwOC0uMDMxLjAxOC0uMDQ3LjAyNi03LjQ5Ni0yLjk1OS0xNC41Ni02Ljc4Mi0yMS4wNy0xMS4zNDUuNjQyLS4zNjYgMS4yODQtLjczMSAxLjkyMy0xLjA5NCAxMS44NTctNi43MjkgMjUuMjk3LTE0LjM1OCAyNS4xMDctMjkuMjktLjA5Ny03LjYxMi01LjAzOS0xMy42NDUtMTAuMjctMjAuMDMxLTQuNDQ3LTUuNDMtOS40ODgtMTEuNTgzLTExLjQ3Ny0xOC42OTYtMi4wOC03LjQzOS0zLjE5Ni0xNi4wNy0zLjMxNy0yNS42NTMtLjI0OC0xOS43MTQtOS45NzQtMzcuNjYyLTI1Ljk2NS00OC44MzIgOC43My0xMS45NDkgMTkuOTkyLTIxLjkzNyAzMi45ODktMjkuMTY2em0tNTIuNTcxIDg5LjE5NmMwLTE1LjI0NCAzLjM2Mi0yOS43MTggOS4zODQtNDIuNzE5IDkuOTggNy41NDkgMTYuMDA4IDE5LjEyNyAxNi4xNjggMzEuNzczLjE0MyAxMS4zMTggMS41MDcgMjEuNjc3IDQuMDU0IDMwLjc4NiAzLjExOCAxMS4xNTUgOS44NTQgMTkuMzc4IDE1LjI2NiAyNS45ODUgMi4xODIgMi42NjMgNS4xMzggNi4yNzEgNS43MjggNy44NjEtLjQxNyAzLjEzNi05LjE0MSA4LjA4Ny0xNC45NjYgMTEuMzkzLTIuNjQ5IDEuNTA0LTUuMzQ1IDMuMDM0LTcuOTgzIDQuNjc2LTE3LjE0LTE4LjI1My0yNy42NTEtNDIuOC0yNy42NTEtNjkuNzU1em0xMDEuOTg3IDEwMS45ODdjLTMuNDU0IDAtNi44NjgtLjE3My0xMC4yMzUtLjUxIDkuMTI3LTYuOTM4IDE4LjkwMi0xNi44OTkgMjUuMjA4LTMxLjI2MiA0LjgzNC0xMS4wMTIgMTIuNjA3LTI2LjA3MSAyNC4yMzktMjkuNzA3IDYuNjMyLTIuMDcyIDE0LjY3OS0uMjQ0IDIzLjkxNyA1LjQzNCAzLjcwOSAyLjI4MSAxMi4xNDQgOC41NCAxOS4zMzUgMTQuMDA1LTE4LjU2MiAyNS40NjMtNDguNjEzIDQyLjA0LTgyLjQ2NCA0Mi4wNHoiLz48cGF0aCBkPSJtNTEwLjE1OSAyNTAuMjE4Yy0xLjE1Mi0xLjYyNi0yOC43MzgtNDAuMjczLTczLjYzNS03OS40NTUtMjYuNDk1LTIzLjEyMy01My41MjMtNDEuNTc2LTgwLjMzMy01NC44NDgtMzMuOTM5LTE2LjgwMi02Ny42NDgtMjUuMzItMTAwLjE5LTI1LjMycy02Ni4yNTEgOC41MTktMTAwLjE5IDI1LjMyYy0yNi44MSAxMy4yNzItNTMuODM4IDMxLjcyNS04MC4zMzMgNTQuODQ4LTQ0Ljg5OCAzOS4xODItNzIuNDg0IDc3LjgyOS03My42MzcgNzkuNDU1LTIuNDU1IDMuNDY0LTIuNDU1IDguMTAxIDAgMTEuNTY0IDEuMTUyIDEuNjI2IDI4LjczOCA0MC4yNzIgNzMuNjM1IDc5LjQ1NSAyNi40OTUgMjMuMTIzIDUzLjUyMyA0MS41NzYgODAuMzMzIDU0Ljg0OCAzMy45MzkgMTYuODAyIDY3LjY0OCAyNS4zMiAxMDAuMTkgMjUuMzJzNjYuMjUxLTguNTE5IDEwMC4xOS0yNS4zMmMyNi44MS0xMy4yNzIgNTMuODM4LTMxLjcyNSA4MC4zMzMtNTQuODQ4IDQ0Ljg5Ny0zOS4xODMgNzIuNDgzLTc3LjgyOSA3My42MzUtNzkuNDU1IDIuNDU3LTMuNDY0IDIuNDU3LTguMS4wMDItMTEuNTY0em0tODYuNzg2IDc1Ljk1Yy0zOS4zMjkgMzQuMzIzLTEwMC4yOSA3NS4yMzctMTY3LjM3MyA3NS4yMzctNjYuOTQzIDAtMTI3Ljc4Ni00MC43NTUtMTY3LjAzOC03NC45NDQtMzMuMjg5LTI4Ljk5NS01Ny4xNTItNTguMzQ1LTY2LjQ3Ni03MC40NjQgOS4yNzctMTIuMDY4IDMyLjk1OS00MS4yMDcgNjYuMTQxLTcwLjE2NSAzOS4zMjktMzQuMzIzIDEwMC4yOS03NS4yMzcgMTY3LjM3My03NS4yMzcgNjYuOTQzIDAgMTI3Ljc4NiA0MC43NTUgMTY3LjAzOCA3NC45NDQgMzMuMjg5IDI4Ljk5NSA1Ny4xNTEgNTguMzQzIDY2LjQ3NiA3MC40NjQtOS4yNzggMTIuMDY4LTMyLjk2IDQxLjIwNy02Ni4xNDEgNzAuMTY1eiIvPjxwYXRoIGQ9Im0yNTYgNjkuMjA2YzUuNTIzIDAgMTAtNC40NzggMTAtMTB2LTE1LjMxNWMwLTUuNTIyLTQuNDc3LTEwLTEwLTEwcy0xMCA0LjQ3OC0xMCAxMHYxNS4zMTZjMCA1LjUyMiA0LjQ3NyA5Ljk5OSAxMCA5Ljk5OXoiLz48cGF0aCBkPSJtMTA4LjAzNiAxMTAuMzU0YzEuOTUzIDEuOTUyIDQuNTEyIDIuOTI5IDcuMDcxIDIuOTI5czUuMTE5LS45NzcgNy4wNzEtMi45MjljMy45MDUtMy45MDUgMy45MDUtMTAuMjM3IDAtMTQuMTQzbC0xMC44My0xMC44M2MtMy45MDUtMy45MDQtMTAuMjM3LTMuOTA0LTE0LjE0MyAwLTMuOTA1IDMuOTA1LTMuOTA1IDEwLjIzNyAwIDE0LjE0M3oiLz48cGF0aCBkPSJtMzk2Ljg5MyAxMTMuMjgyYzIuNTU5IDAgNS4xMTktLjk3NyA3LjA3MS0yLjkyOWwxMC44My0xMC44M2MzLjkwNS0zLjkwNSAzLjkwNS0xMC4yMzcgMC0xNC4xNDMtMy45MDUtMy45MDQtMTAuMjM3LTMuOTA0LTE0LjE0MiAwbC0xMC44MyAxMC44M2MtMy45MDUgMy45MDUtMy45MDUgMTAuMjM3IDAgMTQuMTQzIDEuOTUyIDEuOTUzIDQuNTEyIDIuOTI5IDcuMDcxIDIuOTI5eiIvPjxwYXRoIGQ9Im0yNTYgNDQyLjc5NGMtNS41MjMgMC0xMCA0LjQ3OC0xMCAxMHYxNS4zMTVjMCA1LjUyMiA0LjQ3NyAxMCAxMCAxMHMxMC00LjQ3OCAxMC0xMHYtMTUuMzE1YzAtNS41MjItNC40NzctMTAtMTAtMTB6Ii8+PHBhdGggZD0ibTQwMy45NjQgNDAxLjY0N2MtMy45MDUtMy45MDQtMTAuMjM3LTMuOTA0LTE0LjE0MyAwLTMuOTA1IDMuOTA1LTMuOTA1IDEwLjIzNyAwIDE0LjE0M2wxMC44MyAxMC44M2MxLjk1MyAxLjk1MiA0LjUxMiAyLjkyOSA3LjA3MSAyLjkyOXM1LjExOS0uOTc3IDcuMDcxLTIuOTI5YzMuOTA1LTMuOTA1IDMuOTA1LTEwLjIzNyAwLTE0LjE0MnoiLz48cGF0aCBkPSJtMTA4LjAzNiA0MDEuNjQ3LTEwLjgzIDEwLjgzYy0zLjkwNSAzLjkwNS0zLjkwNSAxMC4yMzcgMCAxNC4xNDIgMS45NTMgMS45NTIgNC41MTIgMi45MjkgNy4wNzEgMi45MjlzNS4xMTktLjk3NyA3LjA3MS0yLjkyOWwxMC44My0xMC44M2MzLjkwNS0zLjkwNSAzLjkwNS0xMC4yMzcgMC0xNC4xNDMtMy45MDUtMy45MDQtMTAuMjM3LTMuOTA0LTE0LjE0Mi4wMDF6Ii8+PC9nPjwvc3ZnPg=="/>
                                <h2>Visi?n</h2>
                            </div>

                            <%
                                for (Home ho : listHome) {
                            %>
                            <p><%=ho.getVision() %>
                            </p>
                            <%
                                }
                            %>
                        </div>
                    </div>

                </div>

                <!-- <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
                  <img src="assets/img/about.jpg" class="img-fluid" alt="">
                </div> -->

                <div>
                    <div class="content">

                        <div id="Content-vision" class="Content-vision">
                            <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTExNSAxNTNoMjA3LjMwNWM0LjE0MiAwIDcuNS0zLjM1OCA3LjUtNy41cy0zLjM1OC03LjUtNy41LTcuNWgtMjA3LjMwNWMtNC4xNDIgMC03LjUgMy4zNTgtNy41IDcuNXMzLjM1OCA3LjUgNy41IDcuNXptMjgyIDc1aC0yODJjLTQuMTQyIDAtNy41IDMuMzU4LTcuNSA3LjVzMy4zNTggNy41IDcuNSA3LjVoMjgyYzQuMTQyIDAgNy41LTMuMzU4IDcuNS03LjVzLTMuMzU4LTcuNS03LjUtNy41em0wLTQ1aC0yODJjLTQuMTQyIDAtNy41IDMuMzU4LTcuNSA3LjVzMy4zNTggNy41IDcuNSA3LjVoMjgyYzQuMTQyIDAgNy41LTMuMzU4IDcuNS03LjVzLTMuMzU4LTcuNS03LjUtNy41em0wLTQ1aC0zOS42OTVjLTQuMTQyIDAtNy41IDMuMzU4LTcuNSA3LjVzMy4zNTggNy41IDcuNSA3LjVoMzkuNjk1YzQuMTQyIDAgNy41LTMuMzU4IDcuNS03LjVzLTMuMzU4LTcuNS03LjUtNy41em0xMTUtNzQuNXYtMTljLS4wMjEtNy45OTctNy4wODQtMTQuMzM0LTE1LjE0LTEzLjUtMS41MjQtMTcuMzQ2LTE2LjEyNC0zMS0zMy44Ni0zMXMtMzIuMzM1IDEzLjY1My0zMy44NiAzMWMtNy45NjEtLjU2My0xNS4xMzUgNS4yNTYtMTUuMTQgMTMuNXYxOWMtLjA1MiA3Ljg1OCA3LjA0IDE0LjMzNiAxNSAxMy41djguMzQ1aC0yNDAuNjAzYy0zLjYwNiAwLTYuOTk2IDEuNDA0LTkuNTQ2IDMuOTU0bC03LjkzOSA3LjkzOS03LjkzOS03LjkzOWMtMi41NS0yLjU1LTUuOTQtMy45NTQtOS41NDYtMy45NTRoLTcwLjQyN3YtOC4zNDVjNy44NDUuNDIzIDE1LjA0NS01LjI1IDE1LTEzLjV2LTE5Yy0uMDQzLTcuODU4LTcuMDM3LTE0LjQ0LTE1LjE0LTEzLjUtMS41MjQtMTcuMzQ2LTE2LjEyNC0zMS0zMy44Ni0zMXMtMzIuMzM1IDEzLjY1NC0zMy44NiAzMWMtNy45NjctLjU3NS0xNS4xMzYgNS4yNjUtMTUuMTQgMTMuNXYxOWMtLjA0OSA3Ljg1OCA3LjA0IDE0LjMzNiAxNSAxMy41djE4OC4wMDhjMCA0LjE0MyAzLjM1OCA3LjUgNy41IDcuNXM3LjUtMy4zNTcgNy41LTcuNXYtMTg4LjAwOGgzOHYzNThoLTM4di0xMzQuOTkzYzAtNC4xNDMtMy4zNTgtNy41LTcuNS03LjVzLTcuNSAzLjM1Ny03LjUgNy41djEzNC45OTNjLTcuOTE5LS41MTEtMTQuOTk3IDUuMzE3LTE1IDEzLjV2MTljLS4wNTYgNy44OCA3LjEzNSAxNC40MTcgMTUuMTQgMTMuNSAxLjUyNSAxNy4zNDcgMTYuMTI0IDMxIDMzLjg2IDMxczMyLjMzNS0xMy42NTMgMzMuODYtMzFjNy45MjUuNTU2IDE1LjE3Ny01LjI0OCAxNS4xNC0xMy41di0xOWMtLjAzNi03Ljc5MS02Ljk1Mi0xNC4zOTItMTUtMTMuNXYtOC4zNDVoMjY3LjIzOGMzLjYwNyAwIDYuOTk4LTEuNDA1IDkuNTQ2LTMuOTU0bDcuOTM5LTcuOTM5IDcuOTM3IDcuOTM3YzIuNTQ5IDIuNTUyIDUuOTQgMy45NTcgOS41NDggMy45NTdoNDMuNzkydjguMzQ0Yy03LjkxMy0uNS0xNC45OTYgNS4zMDktMTUgMTMuNXYxOWMtLjA1OSA3Ljg4IDcuMTM1IDE0LjQxNyAxNS4xNCAxMy41IDEuNTI1IDE3LjM0NyAxNi4xMjQgMzEgMzMuODYgMzFzMzIuMzM1LTEzLjY1MyAzMy44Ni0zMWM3LjkyLjU1NiAxNS4xNzgtNS4yNDggMTUuMTQtMTMuNXYtMTljLS4wMS04LjE5NS03LjA0Ni0xNC4wOTMtMTUtMTMuNXYtMzU4YzcuODgzLjUzMiAxNS4wMzUtNS4zMyAxNS0xMy41em0tNDktNDguNWM5LjQ1MyAwIDE3LjI5NCA2Ljk0NyAxOC43MzkgMTZoLTM3LjQ3OWMxLjQ0Ny05LjA1MiA5LjI4Ny0xNiAxOC43NC0xNnptLTQxNCAwYzkuNDUzIDAgMTcuMjk0IDYuOTQ3IDE4LjczOSAxNmgtMzcuNDc4YzEuNDQ2LTkuMDUyIDkuMjg2LTE2IDE4LjczOS0xNnptMCA0ODJjLTkuNDUzIDAtMTcuMjk0LTYuOTQ3LTE4Ljc0LTE2aDM3LjQ4Yy0xLjQ0NiA5LjA1My05LjI4NiAxNi0xOC43NCAxNnptMzQtMzFoLTY4di0xNmg2OHptLTY4LTQwNHYtMTZoNjh2MTZ6bTM3MC44MyAzNDkuNjU2LTguNTYyLTguNTYyYy01LjI2NC01LjI2Mi0xMy44MjgtNS4yNjMtMTkuMDkxIDBsLTguNTYxIDguNTYyaC0yNjYuNjE2di0zMTEuMzExaDY5LjgwNWw4LjU2MSA4LjU2MWM1LjI2NCA1LjI2NCAxMy44MjggNS4yNjQgMTkuMDkyIDBsOC41NjEtOC41NjFoMjM5Ljk4MXYzMTEuMzExem03Ny4xNyA4NS4zNDRjLTkuNDUzIDAtMTcuMjk0LTYuOTQ3LTE4LjczOS0xNmgzNy40NzljLTEuNDQ2IDkuMDUzLTkuMjg2IDE2LTE4Ljc0IDE2em0zNC0zMWgtNjh2LTE2aDY4em0tNTMtMzF2LTM1OGgzOHYzNTh6bS0xNS0zNzN2LTE2aDY4djE2em0tMzIgMjU2aC0yODJjLTQuMTQyIDAtNy41IDMuMzU3LTcuNSA3LjVzMy4zNTggNy41IDcuNSA3LjVoMjgyYzQuMTQyIDAgNy41LTMuMzU3IDcuNS03LjVzLTMuMzU4LTcuNS03LjUtNy41em0tOTAgNDVoLTE5MmMtNC4xNDIgMC03LjUgMy4zNTctNy41IDcuNXMzLjM1OCA3LjUgNy41IDcuNWgxOTJjNC4xNDIgMCA3LjUtMy4zNTcgNy41LTcuNXMtMy4zNTgtNy41LTcuNS03LjV6bTkwLTkwaC0yODJjLTQuMTQyIDAtNy41IDMuMzU3LTcuNSA3LjVzMy4zNTggNy41IDcuNSA3LjVoMjgyYzQuMTQyIDAgNy41LTMuMzU3IDcuNS03LjVzLTMuMzU4LTcuNS03LjUtNy41eiIvPjwvZz48L3N2Zz4="/>
                            <h2>Historia</h2>
                        </div>

                        <%
                            for (Home ho : listHome) {
                        %>
                        <p><%=ho.getHistoria() %>
                        </p>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>

    </section>
    <!-- End Inicio Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="/menu/footer.jsp" %>
<!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/purecounter/purecounter.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>