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
