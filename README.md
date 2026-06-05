# 🚀 Relational E-Commerce Database Architecture (MVP)

A production-ready relational database design built with **PostgreSQL** that models core operational workflows found in platforms like Amazon and Flipkart. This project focuses heavily on database relationships, strict data integrity constraints, business analytics, and transactional safety.

---

## 🛠️ Tech Stack & Tools
* **Database Engine**: PostgreSQL
* **Database Client**: pgAdmin 4
* **Version Control**: Git / GitHub

---

## 📐 Database Schema Architecture

The database consists of 5 core tables structured to maintain absolute relational consistency:

1. **`users`**: Customer profiles containing secure authentication fields.
2. **`products`**: Live store catalog tracking unit pricing and real-time inventory.
3. **`orders`**: Customer baskets monitoring payment statuses and total expenditures.
4. **`order_items`**: The critical **Many-to-Many junction table** connecting orders and products. It captures the immutable `price_at_purchase` to protect historical records against future catalog price fluctuations.
5. **`payments`**: Enforces a strict **1:1 relationship** via unique key mapping to ensure a checkout basket can never be double-charged.

---

## ⚙️ Core Engineering Implementations

### 1. Data Integrity & System Constraints
* **Primary & Unique Keys**: Implemented to prevent system duplication errors (e.g., matching emails).
* **Domain Check Constraints**: Built-in guardrails that reject data entry anomalies, such as negative catalog pricing or negative stock quantities.
* **Auto-Generated Defaults**: System-level timestamp handling for automatic auditing records.

### 2. Analytical Queries
The business logic layer (`business_queries.sql`) features advanced aggregations to solve real-world e-commerce data queries, including:
* Deep-dive user purchase histories.
* Top-selling inventory performance reports (`SUM` & `GROUP BY`).
* Settle-state financial revenue calculations.
* Automated warehouse low-stock monitoring systems.

### 3. Database Transactions (`BEGIN / COMMIT / ROLLBACK`)
* **Successful Checkout Execution**: A multi-stage block that creates an order, items receipt records, and automatically decrements live product stock volumes simultaneously.
* **Failure Safety Rollback**: Implements explicit `ROLLBACK` mechanisms that cancel and clear partial checkout updates from the database engine instantly if an external payment gateway flag registers a failure.

---

## 📂 Repository File Structure
* `schema.sql` - The complete DDL blueprint creating tables, relationships, and data locks.
* `sample_data.sql` - High-volume seed script containing a mock dataset of 50 users, 50 products, and interconnected transaction flows.
* `business_queries.sql` - Operational analytics and multi-stage financial transaction testing scripts.
