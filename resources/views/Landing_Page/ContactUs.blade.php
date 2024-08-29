@extends('back.layout.EcommerceLayout.headerfooter-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Vet')
@section('content')
<!-- map section -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mapping</title>
    <!-- Add Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <!-- Add Leaflet JavaScript -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>
        /* Adjust map container size */
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Map container -->
    <div id="map"></div>

    <script>
        // Initialize the map with coordinates of Central Bark Veterinary Clinic
        var map = L.map('map').setView([10.2367562, 123.780205], 17);

        // Add the base OpenStreetMap layer
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
        }).addTo(map);

        // Add a marker for Central Bark Veterinary Clinic
        var marker = L.marker([10.2367509, 123.7827799]).addTo(map)
            .bindPopup("<b>Central Bark Veterinary Clinic</b><br>Located here. <br><a href='https://www.google.com/maps/place/Central+Bark+Veterinary+Clinic/@10.2367562,123.780205,17z/data=!4m14!1m7!3m6!1s0x33a977b93e3881bf:0x80da9a87587027e7!2sCentral+Bark+Veterinary+Clinic!8m2!3d10.2367509!4d123.7827799!16s%2Fg%2F11jbln8y0j!3m5!1s0x33a977b93e3881bf:0x80da9a87587027e7!8m2!3d10.2367509!4d123.7827799!16s%2Fg%2F11jbln8y0j?entry=ttu'>View on Google Maps</a>")
            .openPopup();
    </script>
</body>
</html>
@endsection
