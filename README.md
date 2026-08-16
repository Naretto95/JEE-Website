# GameStore

A video game e-commerce site built with **Spring Boot**, **JSP**, and **Spring Data JPA**. Browse a product catalog by category, manage a cart, place orders, and get in touch through a contact form — with a small admin capability to add and retire products.

Originally built as a school JEE project; the backend has since been reworked with a layered architecture (controller → service → repository), hashed passwords, and externalized configuration.

## Tech stack

- Java 8, Spring Boot 2.4
- Spring MVC + JSP/JSTL views
- Spring Data JPA / Hibernate
- MySQL + HikariCP connection pool
- Spring Mail (contact form notifications)
- BCrypt password hashing (`spring-security-crypto`)
- Maven

## Architecture

```
com.naretto.gamestore
├── controller/   HTTP endpoints — parse requests, delegate to services, pick a view
├── service/      Business logic and transaction boundaries
├── repository/   Spring Data JPA repositories
├── model/        JPA entities (User, Produit, Commande, LigneCommande, Commentaire)
└── enumeration/  Product categories
```

Views live under `src/main/webapp/WEB-INF/jsp` and are resolved by `WelcomeController`.

## Features

- Product catalog with categories (Action, Aventure, MMO, RPG)
- Cart: add/remove items, adjust quantities, persist an order
- User registration and login (BCrypt-hashed passwords)
- Order history on the user profile page
- Contact form with e-mail notification
- Admin-only product creation and soft-delete (accounts with `admin = 1`)

## Getting started

### Prerequisites

- JDK 8+
- Maven
- A running MySQL instance

### Configuration

The app reads its configuration from `src/main/resources/application.properties`, with sensible local defaults and environment-variable overrides for anything sensitive:

| Variable | Purpose | Default |
|---|---|---|
| `DB_URL` / `DB_USERNAME` / `DB_PASSWORD` | MySQL connection | `jdbc:mysql://localhost:3306/ecommerce...` / `root` / *(empty)* |
| `SERVER_PORT` | HTTP port | `8080` |
| `CONTACT_RECIPIENT_EMAIL` | Where contact-form messages are sent | site owner's address |
| `MAIL_USERNAME` / `MAIL_PASSWORD` | SMTP credentials for sending contact-form e-mails | *(empty — contact form won't send until set)* |

HTTPS is disabled by default; see the commented `server.ssl.*` block in `application.properties` if you want to enable it with your own keystore.

The database schema is created/updated automatically (`spring.jpa.hibernate.ddl-auto=update`) and seeded with a few demo products and a demo account (`rom@rom.com` / `rom`) from `data.sql`.

### Run

```bash
mvn spring-boot:run
```

Or build an executable jar and run it directly:

```bash
mvn clean package
java -jar target/gamestore-0.0.1-SNAPSHOT.jar
```

The site is then available at `http://localhost:8080/`.

## Security note

This repository previously committed a real SMTP password and SSL keystore password in plain text. They have been removed from the tracked configuration and replaced with environment-variable placeholders, but **if you forked or cloned this repo before that change, treat those credentials as compromised** — rotate the Gmail app password and regenerate the keystore.

## License

MIT — see [LICENSE](LICENSE).
