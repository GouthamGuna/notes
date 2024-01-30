### January Month Notes:-

 * [Java API Call-Function](#Java API CALL)

# Java API CALL

		* HttpRequest

			HttpRequest request = HttpRequest.newBuilder()
			.uri(URI.create("https://solve-sudoku.p.rapidapi.com/"))
			.header("content-type", "application/json")
			.header("X-RapidAPI-Key", "<API KEY>")
			.header("X-RapidAPI-Host", "solve-sudoku.p.rapidapi.com")
			.method("POST", HttpRequest.BodyPublishers.ofString("{\r\n    \"puzzle\": \"2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3\"\r\n}"))
			.build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			System.out.println(response.body());
			
		* AsyncHttpClient	
		
			AsyncHttpClient client = new DefaultAsyncHttpClient();
			client.prepare("POST", "https://solve-sudoku.p.rapidapi.com/")
				.setHeader("content-type", "application/json")
				.setHeader("X-RapidAPI-Key", "<API KEY>")
				.setHeader("X-RapidAPI-Host", "solve-sudoku.p.rapidapi.com")
				.setBody("{\r\n    \"puzzle\": \"2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3\"\r\n}")
				.execute()
				.toCompletableFuture()
				.thenAccept(System.out::println)
				.join();

			client.close();