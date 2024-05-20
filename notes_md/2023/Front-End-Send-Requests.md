# Front-End to Back-End send Requests. 	
		
## HttpRequest

		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create("https://solve-sudoku.p.rapidapi.com/"))
				.header("content-type", "application/json")
				.header("X-RapidAPI-Key", "<API-KEY>")
				.header("X-RapidAPI-Host", "solve-sudoku.p.rapidapi.com")
				.method("POST", HttpRequest.BodyPublishers
				.ofString("{"puzzle": "2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3"}"))
				.build();
		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		System.out.println(response.body());
		
## AsyncHttpClient

		AsyncHttpClient client = new DefaultAsyncHttpClient();
		client.prepare("POST", "https://solve-sudoku.p.rapidapi.com/")
			.setHeader("content-type", "application/json")
			.setHeader("X-RapidAPI-Key", "<API-KEY>")
			.setHeader("X-RapidAPI-Host", "solve-sudoku.p.rapidapi.com")
			.setBody("{"puzzle": "2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3"}")
			.execute()
			.toCompletableFuture()
			.thenAccept(System.out::println)
			.join();

		client.close();
		
## Ajax
		
		const settings = {
			async: true,
			crossDomain: true,
			url: 'https://solve-sudoku.p.rapidapi.com/',
			method: 'POST',
			headers: {
				'content-type': 'application/json',
				'X-RapidAPI-Key': '<API-KEY>',
				'X-RapidAPI-Host': 'solve-sudoku.p.rapidapi.com'
			},
			processData: false,
			data: '{"puzzle": "2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3"}'
		};

		$.ajax(settings).done(function (response) {
			console.log(response);
		});
		
## Fetch API		
		
		
		const url = 'https://solve-sudoku.p.rapidapi.com/';
		const options = {
			method: 'POST',
			headers: {
				'content-type': 'application/json',
				'X-RapidAPI-Key': '<API-KEY>',
				'X-RapidAPI-Host': 'solve-sudoku.p.rapidapi.com'
			},
			body: {
				puzzle: '2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3'
			}
		};

		try {
			const response = await fetch(url, options);
			const result = await response.text();
			console.log(result);
		} catch (error) {
			console.error(error);
		}
		
## Axios
		
		import axios from 'axios';

		const options = {
		  method: 'POST',
		  url: 'https://solve-sudoku.p.rapidapi.com/',
		  headers: {
			'content-type': 'application/json',
			'X-RapidAPI-Key': '<API-KEY>',
			'X-RapidAPI-Host': 'solve-sudoku.p.rapidapi.com'
		  },
		  data: {
			puzzle: '2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3'
		  }
		};

		try {
			const response = await axios.request(options);
			console.log(response.data);
		} catch (error) {
			console.error(error);
		}
		
## XMLHttpRequest

		const data = JSON.stringify({
			puzzle: '2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3'
		});
	
		const xhr = new XMLHttpRequest();
		xhr.withCredentials = true;

		xhr.addEventListener('readystatechange', function () {
			if (this.readyState === this.DONE) {
				console.log(this.responseText);
			}
		});

		xhr.open('POST', 'https://solve-sudoku.p.rapidapi.com/');
		xhr.setRequestHeader('content-type', 'application/json');
		xhr.setRequestHeader('X-RapidAPI-Key', '<API-KEY>');
		xhr.setRequestHeader('X-RapidAPI-Host', 'solve-sudoku.p.rapidapi.com');

		xhr.send(data);
		
## GO	
		
		package main

		import (
			"fmt"
			"net/http"
			"io"
		)

		func main() {

			url := "https://privatix-temp-mail-v1.p.rapidapi.com/request/delete/id/%7Bmail_id%7D/"

			req, _ := http.NewRequest("GET", url, nil)

			req.Header.Add("X-RapidAPI-Key", "SIGN-UP-FOR-KEY")
			req.Header.Add("X-RapidAPI-Host", "privatix-temp-mail-v1.p.rapidapi.com")

			res, _ := http.DefaultClient.Do(req)

			defer res.Body.Close()
			body, _ := io.ReadAll(res.Body)

			fmt.Println(res)
			fmt.Println(string(body))

		}