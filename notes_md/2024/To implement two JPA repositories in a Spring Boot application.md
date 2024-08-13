To implement two JPA repositories in a Spring Boot application, you need to configure each repository separately. This is especially useful when you have multiple data sources. Here’s a step-by-step guide:

### Step 1: Add Dependencies
Ensure you have the necessary dependencies in your `pom.xml` file:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>runtime</scope>
</dependency>
```

### Step 2: Create Entity Classes
Define your entity classes for each database.

```java
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    // getters and setters
}

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private double price;
    // getters and setters
}
```

### Step 3: Create Repository Interfaces
Create repository interfaces for each entity.

```java
public interface UserRepository extends JpaRepository<User, Long> {
}

public interface ProductRepository extends JpaRepository<Product, Long> {
}
```

### Step 4: Configure Data Sources
Configure the data sources in your `application.properties` file.

```properties
# DataSource for User
spring.datasource.user.url=jdbc:h2:mem:userdb
spring.datasource.user.username=sa
spring.datasource.user.password=password
spring.datasource.user.driver-class-name=org.h2.Driver

# DataSource for Product
spring.datasource.product.url=jdbc:h2:mem:productdb
spring.datasource.product.username=sa
spring.datasource.product.password=password
spring.datasource.product.driver-class-name=org.h2.Driver
```

### Step 5: Create Configuration Classes
Create configuration classes for each data source.

```java
@Configuration
@EnableJpaRepositories(
    basePackages = "com.example.user",
    entityManagerFactoryRef = "userEntityManagerFactory",
    transactionManagerRef = "userTransactionManager"
)
public class UserDataSourceConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.user")
    public DataSource userDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean userEntityManagerFactory(
            @Qualifier("userDataSource") DataSource dataSource,
            EntityManagerFactoryBuilder builder) {
        return builder
                .dataSource(dataSource)
                .packages(User.class)
                .persistenceUnit("user")
                .build();
    }

    @Bean
    public PlatformTransactionManager userTransactionManager(
            @Qualifier("userEntityManagerFactory") EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }
}

@Configuration
@EnableJpaRepositories(
    basePackages = "com.example.product",
    entityManagerFactoryRef = "productEntityManagerFactory",
    transactionManagerRef = "productTransactionManager"
)
public class ProductDataSourceConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.product")
    public DataSource productDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean productEntityManagerFactory(
            @Qualifier("productDataSource") DataSource dataSource,
            EntityManagerFactoryBuilder builder) {
        return builder
                .dataSource(dataSource)
                .packages(Product.class)
                .persistenceUnit("product")
                .build();
    }

    @Bean
    public PlatformTransactionManager productTransactionManager(
            @Qualifier("productEntityManagerFactory") EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }
}
```

### Step 6: Use Repositories in Your Service
Inject and use the repositories in your service classes.

```java
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    // Service methods
}

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    // Service methods
}
```

This setup allows you to manage two separate JPA repositories with different data sources in a Spring Boot application⁴⁵.

Do you have any specific questions about this setup or need further details on any step?

Source: Conversation with Copilot, 8/13/2024
(1) Spring Boot JpaRepository with Example - GeeksforGeeks. https://www.geeksforgeeks.org/spring-boot-jparepository-with-example/.
(2) Spring JPA – Multiple Databases | Baeldung. https://www.baeldung.com/spring-data-jpa-multiple-databases.
(3) Spring Boot Quick Start 28 - Creating a Spring Data JPA Repository. https://www.youtube.com/watch?v=z3HnFBzn7DI.
(4) Spring Data JPA Tutorial - #13 - Steps to Create Spring Data JPA Repository - ProductRepository. https://www.youtube.com/watch?v=4CwlFoIdGo4.
(5) Spring Boot & Spring Data JPA – Complete Course. https://www.youtube.com/watch?v=5rNk7m_zlAg.
(6) java - Multiple base repositories in Spring Data JPA - Stack Overflow. https://stackoverflow.com/questions/42781264/multiple-base-repositories-in-spring-data-jpa.
(7) How to Use Jpa Repository in Spring Boot. https://springjava.com/spring-data-jpa/how-to-use-jpa-repository-in-spring-boot/.
(8) Spring Boot JpaRepository Example - HowToDoInJava. https://howtodoinjava.com/spring-boot/spring-boot-jparepository-example/.
(9) github.com. https://github.com/HarishReddyP/test/tree/1ce630d7b96d991e3df7b857265107b87c78377b/spring-microservices-v2-main%2F03.microservices%2F01-step-by-step-changes%2Fmicroservices-v2-1.md.
(10) github.com. https://github.com/gopipolana/springboot/tree/47fbf7ad9541d6e3a29408c2279cb9c7b77539a4/05.Spring-Boot-Advanced%2FStep18.md.
(11) github.com. https://github.com/Sangamesh84/Sangamesh/tree/9a115cb9a01d76dafc39972ccf643e4ae2bdacaa/zzz-h2-in-memory-db-demo%2Freadme.md.