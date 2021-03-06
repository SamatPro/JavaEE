<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Приглашения</title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="js/bootstrap.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <script src="js/ajax.js"></script>
    <script src="js/consenting.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans+SC:400,700&amp;subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 logo">
                <a href="home"><img src="img/travel.png" width=350 alt="travel"></a>
            </div>
            <div class="col-lg-7 ml-auto">
                <li class="menu__item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${locale["select.language"]}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown3">
                        <a class="dropdown-item" href="?lang=Ru">${locale["russian-lang"]}</a>
                        <a class="dropdown-item" href="?lang=En">${locale["english-lang"]}</a>
                    </div>
                </li>
                <ul class="menu d-flex justify-content-center">
                    <li class="menu__item">
                        <a href="myInvitations">
                        Приглашения
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="orders">
                            Мои заказы
                        </a>
                    </li>
                    <li class="menu__item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Навигация
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                            <#list countries as country>
                                <a class="dropdown-item" href="/tours?country=${country.name}">${country.name}</a>
                            </#list>

                        </div>
                    </li>
                    <li class="menu__item">
                        <a href="signOut">
                            Выйти
                        </a>
                    </li>

                </ul>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 offer">
                <h1 class="offer__title">
                    ${clientFirstName} ${clientLastName}
                </h1>
                <div class="offer__intro">

                </div>
                <p class="offer__text">

                </p>
            </div>
            <div class="col-lg-2 ml-auto shuttle">
                <img src="img/plane.png" width=450>
            </div>
        </div>
    </div>
</header>
<section class="price">
    <div class="container">
        <div class="row priceTitle">
            <div class="row priceTitle">
                <h1>Приглашения</h1>
            </div>
        </div>

        <div class="card-deck mb-3 text-center">
            <#list coop as coop>
                <div class="card mb-4 box-shadow">
                    <div class="card-header">
                        <h1 class="my-0 font-weight-normal">${coop.order.client.firstName} ${coop.order.client.lastName}</h1>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title pricing-card-title">${coop.order.city.name}</h4>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>${coop.order.city.description}</li>
                        </ul>
                        <button type="button" class="btn btn-lg btn-block btn-outline-primary" onclick="consent(${coop.id}, true, this.id)" id="t${coop.id}">Принять</button>
                        <button type="button" class="btn btn-lg btn-block btn-outline-primary" onclick="consent(${coop.id}, false, this.id)" id="f${coop.id}">Удалить</button>

                    </div>
                </div>
            </#list>
        </div>

    </div>
</section>
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