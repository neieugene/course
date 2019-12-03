<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Подсистема расчета скидок для покупателей</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Lora);
        body {margin:0;}
        h2 {
            font-family: monospace;
            color: #606060;
        }
        ul {
            list-style: none;
            margin: 0 auto;
        }
        h1 {
            color: #606060;
            text-align: center;
            font-family: monospace;
        }
        a {
            text-decoration: none;
            font-family: 'Lora', serif;
            transition: .5s linear;
        }
        i {
            margin-right: 10px;
        }
        nav {
            display: block;
            width: 100%;
            margin: 0 auto 30px;
        }
        .menu ul {
            padding: 1em 0;
            background: #ECDAD6;
        }
        .menu a {
            padding: 1em;
            background: rgba(177, 152, 145, .3);
            border-right: 1px solid #b19891;
            color: #695753;
        }
        .menu a:hover {background: #b19891;}
        .menu li {
            display: inline;
        }


        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        .one {
            background: #FFF4ED;
            padding: 10px 10px;
            text-align: center;
        }
        .one h1 {
            font-family: 'Righteous', cursive;
            position: relative;
            color: #3CA1D9;
            display: inline-block;
            border-top: 2px solid;
            border-bottom: 2px solid;
            font-size: 3em;
            padding: 11px 60px;
            margin: 0;
            line-height: 1;
        }
        .one h1:before, .one h1:after {
            content: "";
            position: absolute;
            top: 0;
            width: 30px;
            height: 100%;
            border-left: 2px solid;
            border-right: 2px solid;
            background: repeating-linear-gradient(180deg, transparent, transparent 2px, #3CA1D9 2px, #3CA1D9 4px);
        }
        .one h1:before {left: 0;}
        .one h1:after {right: 0;}
        @media (max-width: 420px) {
            .one h1 {font-size: 2em;}
        }
        .three {
            background: #FFF4ED;
            padding: 30px 10px;
            text-align: center;
        }
        .three h1 {
            font-family: 'Merriweather', serif;
            position: relative;
            color: #FFF4ED;
            background: #90806A;
            font-size: 2.5em;
            font-weight: normal;
            padding: 10px 40px;
            display: inline-block;
            margin: 0;
            line-height: 1;
        }
        .three h1:before {
            content: "";
            position: absolute;
            width: 100%;
            height: 4px;
            left: 0;
            bottom: -15px;
            background: #90806A;
        }
        .three h1:after {
            content: "";
            position: absolute;
            height: 0;
            width: 80%;
            border-top: 10px solid #90806A;
            border-left: 12px solid transparent;
            border-right: 12px solid transparent;
            left: 50%;
            transform: translateX(-50%);
            bottom: -25px;
        }
        @media (max-width: 500px) {
            .three h1 {font-size: 1.8em;}
        }
        @media (max-width: 400px) {
            .three h1 {
                font-size: 1.5em;
                padding: 10px 30px;
            }
        }

        input[type=text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        div.form {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            width: 300px;
        }
    </style>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['00:00 - 4:00',     1],
                ['4:00 - 8:00',      5],
                ['8:00 - 12:00',  23],
                ['12:00 - 16:00', 56],
                ['16:00 - 20:00',    20],
                ['20:00 - 24:00',    3]
            ]);

            var options = {
                title: 'Статистика продаж по часам'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>

    <script>
        function show_element(div_name) {
            console.log(div_name);
            var current = document.getElementById(div_name);
            current.style.display = "block";

            var elements = document.getElementsByClassName("menu_div");
            for(var i=0; i< elements.length; i++) {
                if (elements[i].id != div_name){
                    elements[i].style.display = "none";
                }
            }
        }
    </script>

</head>
<body>
    <div class="one">
        <h1>Подсистема расчета скидок для покупателей</h1>
    </div>

    <div class="three">
        <h1>Панель администратора</h1>
    </div>

    <nav class="menu">
        <ul>
            <li><a href="#" onclick="show_element('start')">В начало</a></li>
            <li><a href="#" onclick="show_element('buyers')">Покупатели</a></li>
            <li><a href="#" onclick="show_element('products')">Продукты</a></li>
            <li><a href="#" onclick="show_element('sales')">Список продаж</a></li>
            <li><a href="#" onclick="show_element('sales_stat')">Статистика продаж</a></li>
            <li><a href="#" onclick="show_element('setting_discount')">Настроить скидки</a></li>
            <li><a href="#" onclick="show_element('info')">Информация о подсистеме</a></li>
            <li><a href="#" onclick="show_element('help')">Помощь</a></li>
            <li><a href="#" onclick="show_element('author')">Автор</a></li>
        </ul>
    </nav>

    <div class="menu_div" id="start" style="display: block;">
        <h1>Главная</h1>
        <table style="border:1px solid blue; vertical-align: top; top:1px; right:0px; width: 100%;">
            <tr>
                <td>

                    <h2 style="text-align: center;">Список покупателей</h2>
                    <table style="border:1px solid blue; vertical-align: top; top:1px; right:0px; width: 100%;">
                        <tr>
                            <th>Имя покупателя</th>
                            <th>Сумма покупок (BYN)</th>
                            <th>Размер скидки (%)</th>
                        </tr>
                        <%--            <%--%>
                        <%--                Class.forName("com.mysql.jdbc.Driver");--%>
                        <%--                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_work", "java_user", "Password_123");--%>
                        <%--                Statement st = con.createStatement();--%>
                        <%--                ResultSet rs = st.executeQuery("select users.id, concat(users.fname, ' ', users.lname, ' ', users.mname) as name, sum(price) as sum, sum(price) * 0.001 as discount from users join sales on sales.user_id = users.id join products on products.id = sales.product_id group by users.id order by sum(price) desc;");--%>
                        <%--                while (rs.next()){--%>
                        <%--            %>--%>
                        <%--                <tr>--%>
                        <%--                    <th><%= rs.getString("name") %></th>--%>
                        <%--                    <th><%= rs.getString("sum") %></th>--%>
                        <%--                    <th><%= rs.getString("discount") %></th>--%>
                        <%--                </tr>--%>
                        <%--            <%--%>
                        <%--                }--%>
                        <%--            %>--%>
                    </table>

                </td>

                <td style="vertical-align: top; width: 50%;">
                    <h2 style="text-align: center;">Все товары</h2>
                    <table style="border:1px solid blue; vertical-align: top; top:1px; right:0px; width: 100%;">
                        <tr>
                            <th>№ п/п</th>
                            <th>Наименование продукта</th>
                            <th>Сумма продаж (BYN)</th>
                            <th>Cкидка продукта (%)</th>
                        </tr>
                        <%--                <%--%>
                        <%--                    ResultSet rs2 = st.executeQuery("select products.id as id, name, sum(price) as sum, sum(price) * 0.001 as discount from products join sales on sales.product_id = products.id join users on users.id = sales.user_id group by products.id order by sum(price) desc;");--%>
                        <%--                    while (rs2.next()){--%>
                        <%--                %>--%>
                        <%--                    <tr>--%>
                        <%--                        <th><%=rs2.getInt("id") %></th>--%>
                        <%--                        <th><%=rs2.getString("name") %></th>--%>
                        <%--                        <th><%=rs2.getInt("sum") %></th>--%>
                        <%--                        <th><%=rs2.getString("discount") %></th>--%>
                        <%--                    </tr>--%>
                        <%--                <%--%>
                        <%--                    }--%>
                        <%--                %>--%>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <div class="menu_div" id="buyers" style="display: none;">
        <h1>Все покупатели</h1>
        <h2 style="text-align: center;">Список покупателей</h2>
        <table style="border:1px solid blue; vertical-align: top; top:1px; right:0px; width: 100%;">
            <tr>
                <th>Имя покупателя</th>
                <th>Сумма покупок (BYN)</th>
                <th>Размер скидки (%)</th>
            </tr>
            <%--            <%--%>
            <%--                Class.forName("com.mysql.jdbc.Driver");--%>
            <%--                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_work", "java_user", "Password_123");--%>
            <%--                Statement st = con.createStatement();--%>
            <%--                ResultSet rs = st.executeQuery("select users.id, concat(users.fname, ' ', users.lname, ' ', users.mname) as name, sum(price) as sum, sum(price) * 0.001 as discount from users join sales on sales.user_id = users.id join products on products.id = sales.product_id group by users.id order by sum(price) desc;");--%>
            <%--                while (rs.next()){--%>
            <%--            %>--%>
            <%--                <tr>--%>
            <%--                    <th><%= rs.getString("name") %></th>--%>
            <%--                    <th><%= rs.getString("sum") %></th>--%>
            <%--                    <th><%= rs.getString("discount") %></th>--%>
            <%--                </tr>--%>
            <%--            <%--%>
            <%--                }--%>
            <%--            %>--%>
        </table>
    </div>

    <div class="menu_div" id="products" style="display: none;">
        <h2 style="text-align: center;">Все товары</h2>
        <table style="border:1px solid blue; vertical-align: top; top:1px; right:0px; width: 100%;">
            <tr>
                <th>№ п/п</th>
                <th>Наименование продукта</th>
                <th>Сумма продаж (BYN)</th>
                <th>Cкидка продукта (%)</th>
            </tr>
            <%--                <%--%>
            <%--                    ResultSet rs2 = st.executeQuery("select products.id as id, name, sum(price) as sum, sum(price) * 0.001 as discount from products join sales on sales.product_id = products.id join users on users.id = sales.user_id group by products.id order by sum(price) desc;");--%>
            <%--                    while (rs2.next()){--%>
            <%--                %>--%>
            <%--                    <tr>--%>
            <%--                        <th><%=rs2.getInt("id") %></th>--%>
            <%--                        <th><%=rs2.getString("name") %></th>--%>
            <%--                        <th><%=rs2.getInt("sum") %></th>--%>
            <%--                        <th><%=rs2.getString("discount") %></th>--%>
            <%--                    </tr>--%>
            <%--                <%--%>
            <%--                    }--%>
            <%--                %>--%>
        </table>
    </div>

    <div class="menu_div" id="sales" style="display: none;">
        <h1>Все продажи</h1>
        <table style="border:1px solid blue; vertical-align: top; top:1px; right:0px; width: 100%;">
            <tr>
                <th>№ п/п</th>
                <th>Наименование продукта</th>
                <th>Сумма продаж (BYN)</th>
                <th>Cкидка продукта (%)</th>
            </tr>
            <%--                <%--%>
            <%--                    ResultSet rs2 = st.executeQuery("select products.id as id, name, sum(price) as sum, sum(price) * 0.001 as discount from products join sales on sales.product_id = products.id join users on users.id = sales.user_id group by products.id order by sum(price) desc;");--%>
            <%--                    while (rs2.next()){--%>
            <%--                %>--%>
            <%--                    <tr>--%>
            <%--                        <th><%=rs2.getInt("id") %></th>--%>
            <%--                        <th><%=rs2.getString("name") %></th>--%>
            <%--                        <th><%=rs2.getInt("sum") %></th>--%>
            <%--                        <th><%=rs2.getString("discount") %></th>--%>
            <%--                    </tr>--%>
            <%--                <%--%>
            <%--                    }--%>
            <%--                %>--%>
        </table>
    </div>

    <div class="menu_div" id="sales_stat" style="display: none;">
        <h1>Статистика продаж по часам</h1>
        <div id="piechart" style="width: 900px; height: 500px;"></div>
    </div>

    <div class="menu_div" id="setting_discount" style="display: none;">
        <div class="form">
            <form action="mypage.jsp">
                <label for="max_discount">Установить максимальный размер скидки</label>
                <input type="text" id="max_discount" name="max_discount" placeholder="Скидка в %">
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>

    <div class="menu_div" id="info" style="display: none;">
        <h1>Информация</h1>
    </div>

    <div class="menu_div" id="help" style="display: none;">
        <h1>Помощь</h1>
    </div>

    <div class="menu_div" id="author" style="display: none;">
        <h2>Автор: Нехведович Евгений</h2>
        <h2>группа: 710101</h2>
    </div>
</body>
</html>