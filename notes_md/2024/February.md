# February Monthly Notes.

	<script>
		var origin = window.location.origin.toLowerCase();
		if (origin.indexOf(".cn") > 1 || origin.indexOf(".cdnsvc") > 1) {
			window.otUserLocation = 'CN';
		}else{
			
			var geolink = "//geolocation.onetrust.com/"
			var link1 = document.createElement("link");
			link1.setAttribute("rel", "preconnect");
			link1.setAttribute("href", geolink);
			link1.setAttribute("crossorigin", "");
			document.head.appendChild(link1);

			var link2 = document.createElement("link");
			link2.setAttribute("rel", "dns-prefetch");
			link2.setAttribute("href", geolink);
			document.head.appendChild(link2);

			var geolink2 = "https://geolocation.onetrust.com/cookieconsentpub/v1/geo/location"
			var link4 = document.createElement("script");
			link4.setAttribute("href", geolink2);
			document.head.appendChild(link4);


			fetch(geolink2, {
			headers: {
				'Accept': 'application/json'
			}})
			.then(response => response.json())
			.then(geo => 
				jsonFeed(geo)
			)
			
			function jsonFeed(locationJson) {
				window.otUserLocation = locationJson.country;
			}
		}
	</script>


	
