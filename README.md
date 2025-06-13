# 🛍️ Moji Accessories & Gifts Website Clone

Cloned the Accessories & Gifts website to practice frontend and backend development.

---

## 📌 Features

### 👤 Role: Customer
- 📝 Sign up / Sign in
- 🛒 Cart Management (Add, update, remove products)
- 📦 Order Management (Create, cancel, track order status)
- 💳 Payment
- 🧾 Product (View and search for products by name)
- 👤 Edit Profile
### 🛠️ Role: Admin
- 🧾 Product Management (Add, update, delete products)
- 📦 Order Overview (View and manage all customer orders)
- 👤 User Management (View customer list, manage accounts)

---
## 🚀 Tech Stack

- **Frontend:** HTML, CSS, Javascript and Bootstrap
- **Backend:** Java Spring MVC
- **Database:** SQL Server

---

## 🛠️ Installation & Run

### ✅ Requirements
- **Java JDK 22**
- **Apache Tomcat 10.1+**
- **Maven 3.6+**
- **Frontend**: HTML, CSS, Bootstrap, JavaScript

---

### 🔧 Step-by-step Setup

#### 🥇 Step 1: Clone the Project
```bash
git clone https://github.com/sewaobe/ProjectWeb_Tool.git
cd ProjectWeb_Tool
```

#### 🥈 Step 2: Build the Backend Project with Maven
```bash
mvn clean package
````
#### 🥉 Step 3: Deploy to Apache Tomcat
```bash
# Replace the path with your actual Tomcat directory
cp target/ProjectWeb-1.0.war /path/to/apache-tomcat-10.1.x/webapps/
````
#### 🏁 Step 4: Start Apache Tomcat
```bash
# For Linux/macOS
/path/to/apache-tomcat-10.1.x/bin/startup.sh

# For Windows
path\to\apache-tomcat-10.1.x\bin\startup.bat
````
#### 🌍 Step 5: Open the Web App in Browser
```bash
http://localhost:8080/ProjectWeb
````
---

## 📸 Screenshots

### 👤 Role: Customer

#### 🔐 Login
<p align="center">
  <img src="./ScreenShot-LTW/Login.png" alt="Login Page" width="100%" style="max-width:600px;">
</p>

#### 📝 Register
<p align="center">
  <img src="./ScreenShot-LTW/Register.png" alt="Register Page" width="100%" style="max-width:600px;">
</p>

#### 👤 Profile
<p align="center">
  <img src="./ScreenShot-LTW/Profile.png" alt="Profile Page" width="100%" style="max-width:600px;">
</p>

#### 🏠 Home Page
<p align="center">
  <img src="./ScreenShot-LTW/Home.png" alt="Home Page" width="100%" style="max-width:600px;">
</p>

#### 🛒 Cart
<p align="center">
  <img src="./ScreenShot-LTW/Cart.png" alt="Cart Page" width="100%" style="max-width:600px;">
</p>

#### 💳 Payment
<p align="center">
  <img src="./ScreenShot-LTW/Checkout.png" alt="Payment Page" width="100%" style="max-width:600px;">
</p>

#### 📦 Order Tracking
<p align="center">
  <img src="./ScreenShot-LTW/OrderTracking.png" alt="Order Tracking" width="100%" style="max-width:600px;">
</p>

---

### 🛠️ Role: Admin

#### 📦 Order Management
<table>
  <tr>
    <td align="center"><strong>Desktop View</strong></td>
    <td align="center"><strong>Responsive View</strong></td>
  </tr>
  <tr>
    <td><img src="./ScreenShot-LTW/OrderManagement.png" alt="Order Management" width="100%" style="max-width:400px;"></td>
    <td><img src="./ScreenShot-LTW/OrderRespon.png" alt="Order Management Responsive" width="100%" style="max-width:400px;"></td>
  </tr>
</table>

##### Edit Order
<img src="./ScreenShot-LTW/EditOrder.png" alt="Edit Order Management" width="100%" style="max-width:400px;">

#### 📦 Product Management
<table>
  <tr>
    <td align="center"><strong>Desktop View</strong></td>
    <td align="center"><strong>Responsive View</strong></td>
  </tr>
  <tr>
    <td><img src="./ScreenShot-LTW/ProductManagement.png" alt="Product Management" width="100%" style="max-width:400px;"></td>
    <td><img src="./ScreenShot-LTW/ProductManaRespon.png" alt="Product Management Responsive" width="100%" style="max-width:400px;"></td>
  </tr>
</table>

##### Edit Product
<img src="./ScreenShot-LTW/EditProduct.png" alt="Edit Product Management" width="100%" style="max-width:400px;">

#### 👥 Customer Management
<table>
  <tr>
    <td align="center"><strong>Desktop View</strong></td>
    <td align="center"><strong>Responsive View</strong></td>
  </tr>
  <tr>
    <td><img src="./ScreenShot-LTW/CustomerManagement.png" alt="Customer Management" width="100%" style="max-width:400px;"></td>
    <td><img src="./ScreenShot-LTW/CustomerRespon.png" alt="Customer Management Responsive" width="100%" style="max-width:400px;"></td>
  </tr>
</table>
