## Daily notes from 2023

	   https://templates-flatlogic.herokuapp.com/sing-app/html5/dashboard/visits.html

	    var baseURL;
        if (url.indexOf("?") !== -1) {
            baseURL = url.substr(0, url.indexOf("?"))
        } else {
            baseURL = url
        }
		
# Java
		
		import java.util.HashMap;
		import java.util.Map;
		import java.util.concurrent.Executors;
		import java.util.concurrent.ScheduledExecutorService;
		import java.util.concurrent.TimeUnit;

		public class Main {

			public static void main(String[] args) {
				// create a hashmap with some values
				Map<String, String> map = new HashMap<>();
				map.put("key1", "value1");
				map.put("key2", "value2");
				map.put("key3", "value3");
				System.out.println("Before: " + map);

				// create a scheduled executor service
				ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);

				// schedule a task that will set the values of the hashmap to null after 5 minutes
				executor.schedule(() -> {
					for (String key : map.keySet()) {
						map.put(key, null);
					}
					System.out.println("After: " + map);
				}, 5, TimeUnit.MINUTES);

				// shutdown the executor service
				executor.shutdown();
			}
		}



		import java.util.HashMap;
		import java.util.Map;
		import java.util.Timer;
		import java.util.TimerTask;

		public class Main {

			public static void main(String[] args) {
				// create a hashmap with some values
				Map<String, String> map = new HashMap<>();
				map.put("key1", "value1");
				map.put("key2", "value2");
				map.put("key3", "value3");
				System.out.println("Before: " + map);

				// create a timer and a timer task
				Timer timer = new Timer();
				TimerTask task = new TimerTask() {
					@Override
					public void run() {
						for (String key : map.keySet()) {
							map.put(key, null);
						}
						System.out.println("After: " + map);
					}
				};

				// schedule the task to run after 5 minutes
				timer.schedule(task, 5 * 60 * 1000);

				// cancel the timer after the task is done
				timer.cancel();
			}
		}
		
# Security/Binary Transparency  

		https://developer.mozilla.org/en-US/docs/Glossary/Base64
        
		https://wiki.mozilla.org/Security/Binary_Transparency
		
		<script>
            try {
                var systemThemeDark, theme = window.localStorage.getItem("theme"), systemThemeMode = window.localStorage.getItem("system-theme-mode");
                if (("true" === systemThemeMode || !theme) && window.matchMedia) {
                    var systemTheme = window.matchMedia("(prefers-color-scheme: dark)");
                    systemThemeDark = systemTheme && systemTheme.matches
                }
                var darkTheme = '"dark"' === theme || Boolean(systemThemeDark);
                darkTheme && document.body.classList.add("dark")
            } catch (e) {}
        </script>
		
		function r(e) {
			return e.includes("windows") ? "Windows" : e.includes("mac") ? "Mac OS" : e.includes("linux") ? "Linux" : "Unparsed"
		}
		
# JS And JQuery API`S 

        JavaScript: Fetch API :- 

		fetch("https://type.fit/api/quotes")
		  .then(function(response) {
			return response.json();
		  })
		  .then(function(data) {
			console.log(data);
        });
		
		JQuery :-
		
		const settings = {
		  "async": true,
		  "crossDomain": true,
		  "url": "https://type.fit/api/quotes",
		  "method": "GET"
		}

		$.ajax(settings).done(function (response) {
		  const data = JSON.parse(response);
		  console.log(data);
		});
		
# Add a paragraph and a heading to a div element:

		var div = document.getElementById('myDiv');
		var range = document.createRange();
		range.selectNode(div);
		var paragraph = document.createElement('p');
		paragraph.textContent = 'This is a paragraph.';
		var heading = document.createElement('h1');
		heading.textContent = 'This is a heading';
		range.insertNode(paragraph);
		range.insertNode(heading);

# Heading to a div element:

		var div = document.getElementById('myDiv');
		var paragraph = document.createElement('p');
		paragraph.textContent = 'This is a paragraph.';
		var heading = document.createElement('h1');
		heading.textContent = 'This is a heading';
		div.appendChild(paragraph);
		div.appendChild(heading);
		
# Paragraph and a heading to a div element:

		var div = document.getElementById('myDiv');
		div.innerHTML = '<p>This is a paragraph.</p><h1>This is a heading</h1>';
		
		let msgAppender = document.querySelector('#apk-disclaimer');
		let msgPara = "test";
		
		let msg_loader = document.createElement('div')
		msg_loader.setAttribute('style', 'font-size: 18px')
		let node = document.createTextNode(msgPara);
		
		msg_loader.appendChild(node);
		msgAppender.appendChild(msg_loader);