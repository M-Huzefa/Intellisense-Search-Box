<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="intellisense.aspx.cs" Inherits="IntellisenseSearchBox.intellisense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Intellisense Textbox</h1>
            <div class="con">
                <input id="textbox"/>
                <ul id="list"></ul>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        let char = document.getElementById("textbox");
        let ul = document.getElementById("list");
        char.addEventListener("input", function () {

            let charVal = char.value
            console.log(charVal)
            $.ajax({
                url: 'intellisense.aspx/search',
                type: 'post',
                data: JSON.stringify({ "charVal": charVal }),
                contentType: 'application/json',
                async: true,
                success: function (data) {
                    $("#list").empty()
                    if (data.d) {
                        let carlist = data.d;
                        for (let count = 0; count < carlist.length; count+=2) {
                            let element = document.createElement("li");
                            let link = document.createElement("a");
                            link.innerHTML = carlist[count];
                            element.appendChild(link);
                            ul.appendChild(element); 
                            $("ul li:last a").attr("href", carlist[count + 1]);
                            $("ul li:last a").attr("target", "_blank"); 
                        }
                    }
                }
            })
        })
    </script>
</body>
</html>