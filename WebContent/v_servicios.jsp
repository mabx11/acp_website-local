<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" 
         import="datos.Dt_RolOpciones, vistas.VW_RolUsuario, java.util.*;"%>

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

</head>

<body>

<!-- ======= Header ======= -->
<%@ include file="/menu/v_header.jsp" %>
<!-- End Header -->

<main id="main">

    <!-- Empty seccion for space-->
    <div id="empty" class="empty">
    </div>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <div class="container" data-aos="fade-up">

            
            <!-- Termina boton de edicion-->

            <div>

                <div class="row gx-0">

                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up"
                         data-aos-delay="200">
                        <div id="Content-vision" class="Content-vision content">
                            <div>
                                <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik0xMjUuNjE0LDIwMS44MzZjLTMzLjE4MiwwLTYwLjE3OCwyNi45OTUtNjAuMTc4LDYwLjE3OGMwLDMzLjE4MywyNi45OTYsNjAuMTc4LDYwLjE3OCw2MC4xNzgNCgkJCXM2MC4xNzgtMjYuOTk1LDYwLjE3OC02MC4xNzhDMTg1Ljc5MiwyMjguODMxLDE1OC43OTcsMjAxLjgzNiwxMjUuNjE0LDIwMS44MzZ6IE0xMjUuNjE0LDI5Mi4xMDQNCgkJCWMtMTYuNTkyLDAtMzAuMDkxLTEzLjQ5OC0zMC4wOTEtMzAuMDkxYzAtMTYuNTkyLDEzLjQ5OC0zMC4wOTEsMzAuMDkxLTMwLjA5MWMxNi41OTIsMCwzMC4wOTEsMTMuNDk4LDMwLjA5MSwzMC4wOTENCgkJCUMxNTUuNzA1LDI3OC42MDYsMTQyLjIwNywyOTIuMTA0LDEyNS42MTQsMjkyLjEwNHoiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCgk8Zz4NCgkJPHJlY3QgeD0iMjY3LjA1IiB5PSIyMTcuMiIgd2lkdGg9IjYwLjE3IiBoZWlnaHQ9IjMwLjA5Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQoJPGc+DQoJCTxyZWN0IHg9IjM1Ny4zMSIgeT0iMjE3LjIiIHdpZHRoPSI2MC4xNyIgaGVpZ2h0PSIzMC4wOSIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KCTxnPg0KCQk8cmVjdCB4PSIyNjcuMDUiIHk9IjI3Ny4zOCIgd2lkdGg9IjYwLjE3IiBoZWlnaHQ9IjMwLjA5Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQoJPGc+DQoJCTxyZWN0IHg9IjM1Ny4zMSIgeT0iMjc3LjM4IiB3aWR0aD0iNjAuMTciIGhlaWdodD0iMzAuMDkiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCgk8Zz4NCgkJPHJlY3QgeD0iMjY3LjA1IiB5PSI5OC4yMyIgd2lkdGg9IjYwLjE3IiBoZWlnaHQ9IjMwLjA5Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQoJPGc+DQoJCTxyZWN0IHg9IjM1Ny4zMSIgeT0iOTguMjMiIHdpZHRoPSI2MC4xNyIgaGVpZ2h0PSIzMC4wOSIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KCTxnPg0KCQk8cmVjdCB4PSIyNjcuMDUiIHk9IjE1OC40IiB3aWR0aD0iNjAuMTciIGhlaWdodD0iMzAuMDkiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCgk8Zz4NCgkJPHJlY3QgeD0iMzU3LjMxIiB5PSIxNTguNCIgd2lkdGg9IjYwLjE3IiBoZWlnaHQ9IjMwLjA5Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00NTEuNTg3LDMwLjE0VjBIMjMwLjkzNHYzMC4yOTNoLTYxLjE4djExNC4zNzRjLTEzLjczNy01LjE4NC0yOC42MS04LjAyOS00NC4xMzktOC4wMjkNCgkJCWMtNjkuMTMzLDAtMTI1LjM3Nyw1Ni4yNDQtMTI1LjM3NywxMjUuMzc3YzAsMjguMzE4LDE4LjY5NSw3NC43NDcsNTcuMTUzLDE0MS45MzhjMjcuNTU0LDQ4LjEzNyw1NS41MDIsODkuMzM3LDU1Ljc4MSw4OS43NDgNCgkJCUwxMjUuNjEzLDUxMmwxMi40NDEtMTguMjk5YzAuMjI0LTAuMzMxLDE4LjM4Ny0yNy4xMDYsMzkuODM4LTYyLjY1MUg1MTEuNzZWMzAuMzQ0aDAuMDAxTDQ1MS41ODcsMzAuMTR6IE0xMjUuNjE0LDQ1OC4wMTMNCgkJCWMtMzQuODQyLTUzLjY5My05NS4yODktMTU1LjMtOTUuMjg5LTE5NS45OTljMC01Mi41NDMsNDIuNzQ2LTk1LjI4OSw5NS4yODktOTUuMjg5YzUyLjU0NCwwLDk1LjI5LDQyLjc0Niw5NS4yOSw5NS4yODkNCgkJCUMyMjAuOTA0LDMwMi43MTMsMTYwLjQ1OCw0MDQuMzIsMTI1LjYxNCw0NTguMDEzeiBNNDgxLjY3NSw0MDAuOTYySDM1Ny4zMTN2LTYyLjE4NmgtMzAuMDg3djYyLjE4NkgxOTUuNTM4DQoJCQljMzcuMy02NS41NzIsNTUuNDU0LTExMS4wNTMsNTUuNDU0LTEzOC45NDhjMC00MS4zNzYtMjAuMTUyLTc4LjEyOS01MS4xNTEtMTAwLjk3N1Y2MC4zODFoNjEuMThWMzAuMDg4aDE2MC40OHYzMC4wMzcNCgkJCWw2MC4xNzQsMC4yMDVWNDAwLjk2MnoiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg=="/>
                            </div>
                            <div>
                                <h2>Visitas guiadas</h2>
                                <p style="padding: 0 20px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                                    sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim
                                    veniam.
                                <p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up"
                         data-aos-delay="200">
                        <div id="Content-vision" class="Content-vision content">
                            <div>
                                <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTQ5NyA0MDEuNjY3Yy00MTUuNjg0IDAtMzk3LjE0OS4wNzctMzk3LjE3NS0uMTM5LTQuNTU2LTM2LjQ4My00LjM3My0zNC4xNDktNC4wNzYtMzQuMTkzIDE5OS40Ny0xLjAzNy0yNzcuNDkyLjA2NSAzNjguMDcxLjA2NSAyNi44OTYgMCA0Ny4xOC0yMC4zNzcgNDcuMTgtNDcuNHYtMjAzLjI1YzAtMTkuNy0xNi4wMjUtMzUuNzU1LTM1LjcyNS0zNS43OWwtMTI0LjE3OS0uMjE0di0zMS43NDZjMC0xNy42NDUtMTQuMzU1LTMyLTMyLTMyaC0yOS45NzJjLTE3LjY0IDAtMzEuOTkgMTQuMzUxLTMxLjk5IDMxLjk5djMxLjU5NGwtMTMzLjIxLS4yMzItOS45ODUtNTQuOTkyYy0yLjY2Ny0xNC42OTQtMTUuNDQzLTI1LjM2LTMwLjM3OC0yNS4zNmgtNjguNTYxYy04LjI4NCAwLTE1IDYuNzE2LTE1IDE1czYuNzE2IDE1IDE1IDE1YzcyLjU5NSAwIDY5LjIxOS0uMzk5IDY5LjQyMi43MTkgMTYuMjc1IDg5LjYzMiA1LjkxNyAyNi45ODggNDkuNTggMzA2LjQxNmwtMzguMzg5LjJjLTE4LjAyNy4wNjktMzIuMDYgMTUuODkzLTI5LjgxIDMzLjg5OWw0LjI1MiAzNC4wMTZjMS44ODMgMTUuMDYgMTQuNzQ4IDI2LjQxNyAyOS45MjUgMjYuNDE3aDI2LjYyYy0xOC44IDM2LjUwNCA3LjgyNyA4MC4zMzMgNDkuMDY3IDgwLjMzMyA0MS4yMjEgMCA2Ny44NzYtNDMuODEzIDQ5LjA2Ny04MC4zMzNoMTQyLjg2NmMtMTguODAxIDM2LjUwNCA3LjgyNyA4MC4zMzMgNDkuMDY3IDgwLjMzMyA0MS4yMiAwIDY3Ljg3NS00My44MTEgNDkuMDY2LTgwLjMzM2gzMS4yNjdjOC4yODQgMCAxNS02LjcxNiAxNS0xNXMtNi43MTYtMTUtMTUtMTV6bS0yMDkuODY1LTM1Mi42NzdjMC0xLjA5Ny44OTMtMS45OSAxLjk5LTEuOTloMjkuOTcyYzEuMTAzIDAgMiAuODk3IDIgMnYxMTFjMCA4LjI4NCA2LjcxNiAxNSAxNSAxNWgyMi4yNzZsLTQ2Ljc1IDQ2Ljc3OWMtNC4xNDkgNC4xNTEtMTAuODY2IDQuMTUxLTE1LjAxNSAwbC00Ni43NTEtNDYuNzc5aDIyLjI3N2M4LjI4NCAwIDE1LTYuNzE2IDE1LTE1di0xMTEuMDF6bS0zMCA2MS41OTR2MzQuNDE2aC0yNS4wMzljLTIwLjEyNiAwLTMwLjI1MiAyNC4zOTQtMTYuMDE0IDM4LjY0NGw1OS4zMDggNTkuMzQyYzE1Ljg3NCAxNS44ODMgNDEuNTc2IDE1Ljg4NSA1Ny40NTIgMGw1OS4zMDctNTkuMzQyYzE0LjIyOS0xNC4yMzcgNC4xMy0zOC42NDQtMTYuMDEzLTM4LjY0NGgtMjUuMDM5di0zNC4yNTRsMTI0LjEyNy4yMTRjMy4xODYuMDA1IDUuNzc2IDIuNjAzIDUuNzc2IDUuNzl2MjAzLjI1YzAgMTAuNDA3LTYuOTA0IDE3LjQtMTcuMTggMTcuNGgtMjk5LjQxMmwtMzUuNDc3LTIyNy4wMzl6bS01Ni4zMDIgMzQ2LjI0OWMwIDEzLjg3Ny0xMS4yOSAyNS4xNjctMjUuMTY3IDI1LjE2N3MtMjUuMTY2LTExLjI5LTI1LjE2Ni0yNS4xNjcgMTEuMjktMjUuMTY3IDI1LjE2Ny0yNS4xNjcgMjUuMTY2IDExLjI5MSAyNS4xNjYgMjUuMTY3em0yNDEgMGMwIDEzLjg3Ny0xMS4yODkgMjUuMTY3LTI1LjE2NiAyNS4xNjdzLTI1LjE2Ny0xMS4yOS0yNS4xNjctMjUuMTY3IDExLjI5LTI1LjE2NyAyNS4xNjctMjUuMTY3IDI1LjE2NiAxMS4yOTEgMjUuMTY2IDI1LjE2N3oiLz48L2c+PC9zdmc+"/>
                            </div>
                            <div>
                                <h2>Venta de semillas</h2>
                                <p style="padding: 0 20px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                                    sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim
                                    veniam.
                                <p>
                            </div>
                        </div>
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