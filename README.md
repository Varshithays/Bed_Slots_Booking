# Hospital Bed Slot Booking System (DBMS)

[![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Framework-Flask-lightgrey.svg)](https://flask.palletsprojects.com/)
[![MySQL](https://img.shields.io/badge/Database-MySQL-orange.svg)](https://www.mysql.com/)
[![Frontend](https://img.shields.io/badge/Frontend-Bootstrap%20%26%20JS-purple.svg)]()

## 📌 Project Overview
The **Hospital Bed Slot Booking System** is a full-stack web application designed to streamline healthcare logistics by managing hospital bed availability in real-time. Built during my academic tenure, this project focuses on solving the critical challenge of bed scarcity by providing a transparent platform for patients to book slots and for hospitals to manage their inventory efficiently.



## 🚀 Key Features
* **Dual User Roles:** Separate portals for **Patients** (to search and book) and **Hospitals** (to manage slots).
* **Real-time Availability:** Instant updates on bed counts when a booking is confirmed or cancelled.
* **Automated Data Integrity:** Utilizes MySQL **Triggers** to prevent over-booking and **Stored Procedures** for complex data retrieval.
* **User-Centric UI:** Responsive dashboard built with **Bootstrap** for ease of use during medical emergencies.

## 🛠️ Tech Stack
* **Backend:** Python (Flask Framework)
* **Database:** MySQL (Managed via XAMPP/phpMyAdmin)
* **Frontend:** HTML5, CSS3, JavaScript, Bootstrap
* **Logic:** Advanced SQL (Triggers, Stored Procedures, CRUD Operations)

## 📊 Database Design
The project implements a robust relational schema to ensure data consistency.



**Key Database Logic:**
* **Triggers:** Automatically decrease the available bed count when a patient's booking is approved.
* **Stored Procedures:** Used for generating hospital-wise occupancy reports.
* **ACID Compliance:** Ensures transactions (bookings) are processed reliably.

## 🚦 Getting Started

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/Varshithays/Bed_Slots_Booking.git](https://github.com/Varshithays/Bed_Slots_Booking.git)

```

2. **Setup Database:**
* Open XAMPP Control Panel and start **Apache** and **MySQL**.
* Go to `phpMyAdmin` and create a database named `bedslots`.
* Import the `bedslots.sql` file provided in the repository.


3. **Install Dependencies:**
```bash
pip install -r requirements.txt

```


4. **Run Application:**
```bash
python main.py

```


Access at: `http://localhost:5000`

## ✅ Key Learnings

* Developed deep proficiency in **Flask-SQLAlchemy** for ORM (Object-Relational Mapping).
* Gained experience in **Database Normalization** and optimizing query performance.
* Focused on UI/UX principles to ensure the application is accessible for non-technical users in healthcare settings.

**Would you like me to help you draft a "Portfolio Summary" for your website that ties all four of these projects together?**

```
