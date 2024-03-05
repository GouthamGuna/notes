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

## To calculate the thread running time in Java

		// Get the start time in nanoseconds
		long startTime = System.nanoTime();

		// Execute the thread
		thread.start();

		// Wait for the thread to finish
		thread.join();

		// Get the end time in nanoseconds
		long endTime = System.nanoTime();

		// Calculate the elapsed time in nanoseconds
		long elapsedTime = endTime - startTime;


## To validate the request and response in jQuery	


		// Make an Ajax request to the server with the month parameter
		$.ajax({
		  url: "some_url",
		  data: {month: some_month},
		  beforeSend: function(request) {
			// Validate the request parameter
			if (some_month < 1 || some_month > 12) {
			  // Cancel the request if the month is invalid
			  request.abort();
			  // Show an error message
			  alert("Invalid month");
			}
			else {
			  // Show the loader before sending the request
			  $("#loader").show();
			}
		  },
		  success: function(response) {
			// Hide the loader after receiving the response
			$("#loader").hide();
			// Validate the response data
			if (response.status == "ok") {
			  // Display the results
			  $("#results").html(response.data);
			}
			else {
			  // Show an error message
			  alert("Something went wrong");
			}
		  }
		});
		
		
		<div class="cnd-avatar-preview">  <figure class="cnd-image-preview" style="background-image: url('/recruit/EntityImageAttach.do?actionName=readCandidateImage')"></figure>  </div>
		
## Spring MVC header auth token

 To validate the spring MVC header auth token, you need to implement a filter that can intercept the incoming requests and check the validity of the token. You can use the Spring Security framework to help you with this task.

 Create a custom authentication filter that extends the `AbstractAuthenticationProcessingFilter` class. This filter will extract the token from the request header and use an authentication manager to authenticate it. You can also handle the success and failure scenarios in this filter.
	
	public class TokenAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

		// The name of the header that contains the token
		private static final String AUTH_HEADER = "X-Auth-Token";

		public TokenAuthenticationFilter() {
			// Set the URL that this filter will be applied to
			super("/api/**");
		}

		@Override
		public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
				throws AuthenticationException, IOException, ServletException {
			// Get the token from the header
			String token = request.getHeader(AUTH_HEADER);
			// If the token is null or empty, throw an exception
			if (token == null || token.isEmpty()) {
				throw new BadCredentialsException("Missing or invalid token");
			}
			// Create a token authentication object with the token
			TokenAuthentication tokenAuthentication = new TokenAuthentication(token);
			// Use the authentication manager to authenticate the token
			return getAuthenticationManager().authenticate(tokenAuthentication);
		}

		@Override
		protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
				Authentication authResult) throws IOException, ServletException {
			// If the authentication is successful, set the security context and proceed with the request
			SecurityContextHolder.getContext().setAuthentication(authResult);
			chain.doFilter(request, response);
		}

		@Override
		protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
				AuthenticationException failed) throws IOException, ServletException {
			// If the authentication fails, send an error response
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, failed.getMessage());
		}
	}

Create a custom authentication provider that implements the `AuthenticationProvider` interface. This provider will validate the token and return an authenticated user object if the token is valid. You can use a service or a repository to access the token data from the database.

	public class TokenAuthenticationProvider implements AuthenticationProvider {

		// A service or a repository that can get the token data from the database
		private TokenService tokenService;

		public TokenAuthenticationProvider(TokenService tokenService) {
			this.tokenService = tokenService;
		}

		@Override
		public Authentication authenticate(Authentication authentication) throws AuthenticationException {
			// Cast the authentication object to a token authentication object
			TokenAuthentication tokenAuthentication = (TokenAuthentication) authentication;
			// Get the token from the authentication object
			String token = tokenAuthentication.getToken();
			// Get the token data from the service or the repository
			TokenData tokenData = tokenService.getTokenData(token);
			// If the token data is null or expired, throw an exception
			if (tokenData == null || tokenData.isExpired()) {
				throw new BadCredentialsException("Invalid or expired token");
			}
			// Get the user details from the token data
			UserDetails userDetails = tokenData.getUserDetails();
			// Create a new token authentication object with the user details and the authorities
			TokenAuthentication newTokenAuthentication = new TokenAuthentication(token, userDetails,
					userDetails.getAuthorities());
			// Set the authenticated flag to true
			newTokenAuthentication.setAuthenticated(true);
			// Return the new token authentication object
			return newTokenAuthentication;
		}

		@Override
		public boolean supports(Class<?> authentication) {
			// Return true if the authentication class is TokenAuthentication
			return TokenAuthentication.class.equals(authentication);
		}
	}
	
Register the custom filter and provider in the security configuration class. You can use the `HttpSecurity` object to add the filter to the filter chain and the `AuthenticationManagerBuilder` object to add the provider to the authentication manager.

	@Configuration
	@EnableWebSecurity
	public class SecurityConfig extends WebSecurityConfigurerAdapter {

		// A service or a repository that can get the token data from the database
		private TokenService tokenService;

		public SecurityConfig(TokenService tokenService) {
			this.tokenService = tokenService;
		}

		@Override
		protected void configure(HttpSecurity http) throws Exception {
			// Disable CSRF protection
			http.csrf().disable();
			// Add the custom filter to the filter chain
			http.addFilterBefore(new TokenAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
			// Configure the authorization rules
			http.authorizeRequests()
					.antMatchers("/api/**").authenticated()
					.anyRequest().permitAll();
		}

		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			// Add the custom provider to the authentication manager
			auth.authenticationProvider(new TokenAuthenticationProvider(tokenService));
		}
	}
	
[REF](https://www.baeldung.com/security-spring)