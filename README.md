Secure & Community-Driven Handicraft Marketplace
Relational Database Design for a Scalable E-Commerce Platform | MySQL, Power BI

Project Overview
This project designs and implements a full relational database to power an online marketplace connecting rural artisans with global buyers. The database supports end-to-end business operations including user management, product listings, order processing, payments, shipments, and business analytics.
Built for BUAN 6320 — Database Foundations for Business Analytics at the University of Texas at Dallas.

Business Problem
Skilled artisans in small villages create exceptional handmade crafts but remain disconnected from larger markets. This platform bridges that gap by providing:

A secure space for artisans to register, list, and sell products
A seamless shopping experience for buyers
Data-driven insights for business decision-making


Database Structure
The schema is organized across 16 core tables spanning 4 business domains:
DomainTablesCustomer & OrdersCustomers, Orders, Order_Items, Shopping_Cart, Wishlist, ReviewsProducts & StockProducts, Categories, Inventory, DiscountsPayments & LogisticsPayments, ShipmentsGovernanceAdmin, Transaction_Logs, Sales
Entity Relationship Diagram
The ER diagram is available in localhandicraft-ER diagram.pdf

Tools & Technologies

Database: MySQL
Visualization: Power BI
Features: Stored Procedures, Functions, Triggers, Views, Complex Queries
Security: AES encryption, bcrypt password hashing, role-based access, IP restrictions


Files in this Repository
Local-handicraft-database/
│
├── localhandicraft.sql                    # Full database schema + sample data
├── Complex queries for localhandicraft.sql # 12 advanced business queries
├── localhandicraft-ER diagram.pdf         # Entity Relationship Diagram
└── README.md

Key Features Implemented
12 Complex Business Queries
#Business QuestionValue1Monthly Revenue + Most-Used Payment MethodFinance trend analysis2Late-Shipment LeaderboardOperations improvement3Promotion CoverageMarketing campaign reach4Discounted Low-Stock Best-SellersInventory restocking alerts5Vendor Performance Dashboard (30 Days)Supplier management6Top 5 Customers (Last 6 Months)Loyalty & VIP targeting7Payment & Delivery Health CheckRisk & customer service8High-Rated Reviews vs Shipping SpeedSLA optimization9Daily Sales Trend by Category (15 Days)Merchandising decisions10Abandoned Cart SnapshotRevenue recovery11Top-Revenue Product (All Time)Flagship product promotion12High-Price SKUs by Stock & VendorLuxury inventory management
5 Stored Procedures

Get_Customer_Order_Summary — 360° customer dashboard
UpdateProductStock — atomic inventory decrement with error handling
GetSalesSummaryByMonth — monthly KPI report
AddNewProduct — secure product insertion for admins
GetTopSellingProducts — parameterized top-N product list

5 Functions

Calculate_Customer_Purchase_Score — assigns Bronze/Silver/Gold/Platinum loyalty tier
Get_Customer_Order_Status_Summary — classifies customers by order activity
GetTotalOrderAmount — calculates order total from line items
IsProductInStock — Boolean availability check for UI
GetAverageOrderValue — per-customer KPI for marketing segmentation

5 Triggers

prevent_order_if_insufficient_stock — blocks overselling at source
after_order_insert_log_transaction — immutable audit trail for every order
trg_restock_after_order_delete — restores stock on order cancellation
validate_payment_amount — ensures payment matches order total
trg_validate_discount_dates — prevents invalid promotion date ranges

4 Views

vw_vendor_performance_summary — vendor KPI dashboard
vw_customer_purchase_summary — customer spending overview
customer_order_summary_view — full customer order profile
OrderSummary — order-level financial reporting


Business Insights Enabled

Projected 12–18% conversion improvement through abandoned cart recovery and pricing optimization
20% reduction in overselling risk via inventory validation triggers
Real-time vendor rankings and revenue tracking via Power BI dashboards
Customer loyalty segmentation (Bronze → Platinum) enabling targeted marketing


How to Run
1. Clone this repository
bashgit clone https://github.com/annuchoudhary29/Local-handicraft-database.git
2. Import the database in MySQL
sqlSOURCE localhandicraft.sql;
3. Run complex queries
sqlSOURCE "Complex queries for localhandicraft.sql";
4. View the ER diagram
Open localhandicraft-ER diagram.pdf to explore the full database schema.

Demo Video
Watch the full project walkthrough: YouTube Demo

Author
Annu Choudhary
MS in Business Analytics & AI — University of Texas at Dallas (Dec 2026)
LinkedIn · GitHub
