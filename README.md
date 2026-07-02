# QUICK FOODS | Food Delivery Web Application 🍔🚀

A fully dynamic, database-driven Java Web Application that models a food delivery marketplace. Built natively using standard Java Servlets, JSP templates, and an asynchronous memory-driven Cart engine, the platform interfaces directly with a MySQL relational schema to simulate live transaction pipelines.

---

## 🎥 System Demonstration

<img width="764" height="406" alt="Recording+2026-07-02+122020+(1) (1)" src="https://github.com/user-attachments/assets/c97efd13-f79d-49cd-bf9f-955770bb5850" />





## ✨ System Architecture & Workflow

### 1. Dynamic Restaurant Marketplace
The application entry point utilizes `Servlet.java` to interact with a centralized `RestaurantDAOImpl`[cite: 4, 14]. It safely constructs and executes data statements over an established `DBConnection` context pool[cite: 5, 14], parsing active entity profiles into standard Java collections to render dynamic grid layouts[cite: 4, 25].

<img width="1920" height="1020" alt="Screenshot 2026-07-02 125535" src="https://github.com/user-attachments/assets/11a011d5-1758-4a05-8c0b-c8fafa61ba46" />


### 2. Context-Aware Menu Resolution
When an end-user triggers a deep link on a restaurant element, `MenuServlet.java` extracts the relational parameter keys from the HTTP request scope[cite: 2]. It cross-references structural dependency records using `MenuDAOImpl` to deliver context-isolated dish inventories on a per-restaurant basis[cite: 2, 11].

<img width="1920" height="1020" alt="Screenshot 2026-07-02 125550" src="https://github.com/user-attachments/assets/1ec23dca-b5c3-4084-b1cb-818825aa8154" />


### 3. Stateful Shopping Cart Engine
State management is handled in memory via `CartServlet.java` and encapsulated inside `Cart.java` using a robust key-value mapping strategy (`Map<Integer, CartItem>`)[cite: 1, 16]. 
* **Stateful Isolation Rule:** The system establishes an implicit business rule that restricts operations to a singular active establishment session instance[cite: 1]. If an item with a foreign origin parameter is detected, the cart isolates the transaction scope to enforce consistency[cite: 1].

<img width="1920" height="1020" alt="Screenshot 2026-07-02 125638" src="https://github.com/user-attachments/assets/afe6e31f-8b1a-4d9e-9b92-154c3b119c54" />


### 4. Transaction Pipelines & Checkout Fulfillment
When processing a purchase through `checkout.jsp`[cite: 23, 24], `OrderServlet` intercepts data structures asynchronously via an HTTP POST request[cite: 3, 24]. The servlet initiates atomic database actions[cite: 3]:
1. Saves a master history record via `OrderDAOImpl` using generated database auto-increment identity tokens[cite: 3, 12].
2. Loops through the cart items to commit granular rows using `OrderItemDAOImpl`[cite: 3, 13].
3. Empties the operational cart session reference[cite: 3] before serving individual order details on `ordersuccess.jsp`[cite: 3, 27].

Checkout page-:
<img width="1920" height="1020" alt="Screenshot 2026-07-02 125649" src="https://github.com/user-attachments/assets/307fcb01-b4ac-4083-94c5-6d775b78fe07" />

Order Successful Page-:
<img width="1920" height="1020" alt="Screenshot 2026-07-02 125708" src="https://github.com/user-attachments/assets/63dbeaa7-58c4-48e4-a248-4c778bcb572b" />



## 🛠️ Technology Stack & Dependencies

* **Backend Engine:** Core Java (JDK 8+)
* **Enterprise Layer:** Java Servlets API, JavaServer Pages (JSP)[cite: 1, 23]
* **Database Driver:** MySQL Connector/J (`com.mysql.cj.jdbc.Driver`)
* **Web Container:** Apache Tomcat (v10+ optimized via `jakarta.servlet` packages)[cite: 1]
* **Presentation Tier:** HTML5, CSS3 Grid Layout profiles, Google Poppins/Segoe Typography engines[cite: 23, 25, 26]

---

## 📂 Project Package Structure


```src/main/java/
 ├── com.tap.connection/
 │    └── DBConnection.java          # Relational data connection pool handle
 ├── com.tap.dao/
 │    ├── RestaurantDAO.java         # Interface abstraction layers
 │    ├── MenuDAO.java
 │    ├── UserDAO.java
 │    ├── OrderDAO.java
 │    └── OrderItemDAO.java
 ├── com.tap.daoimpl/
 │    ├── RestaurantDAOImpl.java     # JDBC concrete implementation queries
 │    ├── MenuDAOImpl.java
 │    ├── UserDAOImpl.java
 │    ├── OrderDAOImpl.java
 │    └── OrderItemDAOImpl.java
 ├── com.tap.model/
 │    ├── Restaurant.java            # POJO data entity blueprints
 │    ├── Menu.java
 │    ├── User.java
 │    ├── Cart.java                  # Cart state domain controller
 │    ├── CartItem.java
 │    ├── Order.java
 │    └── OrderItem.java
 └── com.tap/
      ├── Servlet.java               # Home controller handler mapping
      ├── MenuServlet.java           # Menu interaction routing context
      ├── CartServlet.java           # Shopping cart transactional lifecycle
      └── OrderServlet.java          # Order checkout state pipeline manager
```

🚀 Setting Up the Application Locally
1. Database Configuration
Import or execute your schema scripts in your local MySQL instance.

Open DBConnection.java[cite: 5] and update the connection criteria string, username, and password parameters matching your local server settings:

Java
private static String URL = "jdbc:mysql://localhost:3306/onlinefooddeliveryapp";
private static String USERNAME = "MYSQL_USERNAME";
private static String PASSWORD = "MYSQL_PASSWORD";


2. Deployment on Apache Tomcat
   i. Clone this repository into your IDE workspace (Eclipse Enterprise Edition recommended).

  ii. Ensure your target Server Runtime configuration is pointing to an active Apache Tomcat v10.x         instance.

 iii. Right-click the root project node, click Run As -> Run on Server.

  iv. Access the web interface dashboard inside your local browser instance context using the             default routing handle: http://localhost:8080/onlinefooddeliveryapp/home.


---

### 💡 Summary Checklist for Making Media Content

To keep your files organized, create a folder named `images` in your root project directory, with a subfolder inside it named `screenshots`. Here is exactly what you need to create:

| File Name | Format | Target Location/Dimension | Duration |
| :--- | :--- | :--- | :--- |
| `system-walkthrough.gif` | **GIF** | Under the main `## System Demonstration` header. Full desktop browser layout frame width. | **12-15 seconds** |
| `home-marketplace.png` | **PNG** | Under `### 1. Dynamic Restaurant Marketplace`. Clear view of restaurant cards. | *Static* |
| `restaurant-menu.png` | **PNG** | Under `### 2. Context-Aware Menu Resolution`. Showing individual menu elements. | *Static* |
| `cart-management.gif` | **PNG** | Under `### 3. Stateful Shopping Cart Engine`. Focused crop on the numeric quantity increment button workflows. | *Static* |
| `order-success.png` | **PNG** | Under `### 4. Transaction Pipelines & Checkout Fulfillment`. Capture the entire confirmation summary card. | *Static*





