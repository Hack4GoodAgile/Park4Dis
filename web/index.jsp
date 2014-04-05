<%@page import="java.util.List"%>
<%@page import="loaders.ZonesLoader"%>
<%@page import="loaders.ParkingLoader"%>
<%@page import="hivelibrarymodel.Parking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="parkfordis.model.ZonesMap"%>
<%@page import="parkfordis.model.LatLng"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>Park4Dis</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script>
            function initialize() {
                var myLatlng = new google.maps.LatLng(28.0726523, -15.45361290000000053);
                var mapOptions = {
                    zoom: 11,
                    center: myLatlng
                }
                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            <%
                if (request.getAttribute("parking") != null) {%>
            <%
                        Parking parking = (Parking) request.getAttribute("parking");
                        LatLng position = (LatLng) request.getAttribute("position");
            %>
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(<%=position.getLatitude()%>, <%=position.getLongitude()%>),
                    map: map,
                    title: 'Parking'
                });

                var infowindow = new google.maps.InfoWindow({
                    content: '<div>Hay <%=parking.getFreePlaces()%> plazas libres</div>'
                });
                google.maps.event.addListener(marker, 'click', function() {
                    infowindow.open(map, marker);
                });
            <%}%>
            }

            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    </head>
    <body>
    <center>
        <table border="0"><td width="600">
                <br>
                <form method="post" action="FrontController?command=Parking">
                    <input type='text' name="zone"/> <input type="submit" />
                </form>
            </td><td>
                <button class="search">Ajustes</button>
                <button class="search">Filtros</button>
                <button class="search2" width="35px">Reportar incidencia</button>
            </td>
        </table>
    </center>
    <hr>
    <div id="map-canvas"></div>
    <hr>
</body>
</html>