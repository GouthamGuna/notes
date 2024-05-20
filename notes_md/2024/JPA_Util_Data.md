# H2 DB
    spring.datasource.url=jdbc:h2:file:C:/temp/test
    spring.datasource.username=sa
    spring.datasource.password=
    spring.datasource.driverClassName=org.h2.Driver
    spring.jpa.database-platform=org.hibernate.dialect.H2Dialect

# MySQL
    spring.datasource.url=jdbc:mysql://localhost:3306/test
    spring.datasource.username=dbuser
    spring.datasource.password=dbpass
    spring.datasource.driver-class-name=com.mysql.jdbc.Driver
    spring.jpa.database-platform=org.hibernate.dialect.MySQL5InnoDBDialect

# Oracle
    spring.datasource.url=jdbc:oracle:thin:@localhost:1521:orcl
    spring.datasource.username=dbuser
    spring.datasource.password=dbpass
    spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
    spring.jpa.database-platform=org.hibernate.dialect.Oracle10gDialect

# SQL Server
    spring.datasource.url=jdbc:sqlserver://localhost;databaseName=springbootdb
    spring.datasource.username=dbuser
    spring.datasource.password=dbpass
    spring.datasource.driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver
    spring.jpa.hibernate.dialect=org.hibernate.dialect.SQLServer2012Dialect

    import org.springframework.boot.jdbc.DataSourceBuilder;
    import org.springframework.context.annotation.Bean;
    import org.springframework.context.annotation.Configuration;

## DataSource Configuration

    import javax.sql.DataSource;

    @Configuration
    public class MyDataSourceConfiguration {

        @Bean
        @ConfigurationProperties("app.datasource")
        public DataSource dataSource() {
            return DataSourceBuilder.create().build();
        }
    }

## Custom DataSource Configuration

    import org.springframework.context.annotation.Bean;
    import org.springframework.context.annotation.Configuration;
    import org.springframework.context.annotation.Lazy;
    import org.springframework.context.annotation.Scope;
    import org.springframework.beans.factory.config.ConfigurableBeanFactory;
    import org.springframework.boot.jdbc.DataSourceBuilder;
    import javax.sql.DataSource;
    import org.springframework.jdbc.core.JdbcTemplate;

    @Configuration
    public class CustomDataSourceConfiguration {

        @Lazy
        @Bean
        @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
        public DataSource customDataSource() {
            DataSourceBuilder dsBuilder = DataSourceBuilder.create();
            dsBuilder.driverClassName("oracle.jdbc.driver.OracleDriver");
            
            // Obtain the database settings (URL, username, password) from an external source
            CustomDatabaseSettings dbSettings = ...; // Implement this based on your use case
            dsBuilder.url(dbSettings.jdbcUrl());
            dsBuilder.username(dbSettings.username());
            dsBuilder.password(dbSettings.password());
            
            return dsBuilder.build();
        }

        @Lazy
        @Bean("customJdbcTemplate")
        public JdbcTemplate customJdbcTemplate() {
            return new JdbcTemplate(customDataSource());
        }
    }

## Jdbc Template Example

 `JdbcTemplate` is a convenient and powerful abstraction provided by the Spring Framework that simplifies working
 with Java Database Connectivity (JDBC). It offers methods to execute queries, update statements, insert
 statements, etc., without writing boilerplate JDBC code. Here are some use case scenarios for `JdbcTemplate` in
 various coding situations:

 1. Executing simple select query and mapping results to a list of objects:

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public List<User> findAllUsers() {
    String sql = "SELECT id, name FROM users";
    return jdbcTemplate.query(sql, (rs, rowNum) -> new User(rs.getInt("id"), rs.getString("name")));
}
```

2. Executing update and checking number of affected rows:

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public void deactivateUserWithId(int userId) {
    String sql = "UPDATE users SET active=0 WHERE id=?";
    int updatedRows = jdbcTemplate.update(sql, userId);

    if (updatedRows > 0) {
        // Handle the update success case here...
    } else {
        // Handle the no-row-affected case here...
    }
}
```

3. Executing batch updates:

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public void deactivateUsersBatch(List<Integer> userIds) {
    String sql = "UPDATE users SET active=0 WHERE id IN (?, ?, ...)";

    List<Object[]> params = new ArrayList<>();
    for (int userId : userIds) {
        params.add(new Object[]{userId});
    }

    jdbcTemplate.batchUpdate(sql, params);
}
```

4. Using named parameters in queries:

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public void deactivateUserWithName(String userName) {
    String sql = "UPDATE users SET active=0 WHERE name=?";
    int updatedRows = jdbcTemplate.update(sql, userName);

    if (updatedRows > 0) {
        // Handle the update success case here...
    } else {
        // Handle the no-row-affected case here...
    }
}
```

5. Executing complex queries with parameters and mapping to objects:

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public List<Order> findOrdersByCustomerId(int customerId) {
    String sql = "SELECT o.id, c.name AS customer_name, SUM(o.amount) as total FROM orders o JOIN customers c ON
o.customer_id=c.id WHERE c.id=? GROUP BY o.id";

    return jdbcTemplate.query(sql, new Object[]{customerId}, (rs, rowNum) -> new Order(rs.getInt("id"),
rs.getString("customer_name"), rs.getDouble("total")));
}
```

In these examples, `JdbcTemplate` greatly simplifies the process of interacting with a database by handling exception
management and converting JDBC results into Java objects.

## Dealing with Multiple Databases

When dealing with multiple databases and needing to retrieve user credentials based on a domain name provided by the client,
you'll likely have an orchestration layer in your application that handles these operations. Instead of directly using
`DataSourceBuilder`, which is more suited for configuring JDBC data sources, we'll focus on creating a strategy to fetch and
manage user details across different databases with proper security considerations.

Here's how you can approach this problem:

1. Design an abstraction layer that allows switching between multiple data sources based on domain names or other criteria. For
example, create a `DatabaseManager` class responsible for interacting with various databases and returning the relevant user
information.

```java
public class DatabaseManager {
    private Map<String, DataSource> dataSources; // key: domain name, value: JDBC DataSource

    public DatabaseManager() {
        this.dataSources = new HashMap<>();
    }

    public void addDataSource(String domainName, DataSource ds) {
        if (domainName != null && !domainName.trim().isEmpty()) {
            dataSources.put(domainName, ds);
        }
    }

    public Map<String, User> getUsersByDomain(String domainName) {
        return dataSources.entrySet()
                .stream()
                .filter(entry -> entry.getKey().equalsIgnoreCase(domainName))
                .map(Map.Entry::getValue)
                .collect(Collectors.toMap(Map.Entry::getKey, ds -> this.retrieveUsersFromDataSource(ds)));
    }

    private List<User> retrieveUsersFromDataSource(DataSource dataSource) {
        try (Connection conn = dataSource.getConnection()) {
            // Assume there's a predefined SQL query to fetch user information by domain name
            String sqlQuery = "SELECT id, username, password FROM users WHERE domainName=?";

            return jdbcTemplate.query(sqlQuery, new Object[]{domainName},
                    (rs -> {
                        List<User> resultList = new ArrayList<>();
                        while (rs.next()) {
                            User user = new User();
                            // Assuming username and password are stored in a specific format
                            String[] rowData = Arrays.copyOf(new Object[]{rs}, 3);
                            user.setUsername(rowData[0]);
                            user.setPasswordHash(rowData[1]); // Store the hashed password instead of plain text for security
reasons
                            resultList.add(user);
                        }
                        return resultList;
                    }));
    } catch (SQLException e) {
        throw new RuntimeException("Error retrieving users", e);
    }
    // ... Additional error handling if necessary
}
}
```
2. Use the `DatabaseManager` to handle client requests by passing in their domain name and obtaining a list of associated users
from all relevant databases:

```java
@RestController
public class UserController {

    private final DatabaseManager databaseManager;

    public UserController(DatabaseManager databaseManager) {
        this.databaseManager = databaseManager;
    }

    @PostMapping("/users/{domainName}")
    public List<User> getUsers(@PathVariable String domainName, Principal principal) {
        Map<String, User> usersByDomainMap = databaseManager.getUsersByDomain(domainName);

        // Assuming the client's original credentials (username and password) are retrieved through Spring Security or another
authentication mechanism:
        String username = ((UsernamePasswordAuthenticationToken) principal).getName();
        char[] passwordHash = ...; // Retrieve hashed password from your user details store

        List<User> usersList = usersByDomainMap.getOrDefault(domainName, Collections.emptyList());

        for (User user : usersList) {
            if (user.getUsername().equals(username)) {
                // Compare the provided password with hashed value and handle authentication logic accordingly
            }
        }

        return usersList;
    }
}
```
3. Security Note: Avoid storing plain-text passwords in your databases. Instead, store only their corresponding hash values
using a secure hashing algorithm like bcrypt or Argon2. When verifying user credentials, compare the provided password with its
stored hash rather than comparing plain text passwords directly.