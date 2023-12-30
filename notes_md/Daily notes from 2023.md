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
