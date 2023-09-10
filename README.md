# Bed_Slots_Booking Web Application

Bed_Slots_Booking is a web application developed using Python with Flask framework and MySQL database. The application allows patients and hospitals to book and manage bed slots in hospitals. The interface is designed using HTML, CSS, Bootstrap, and JavaScript to ensure a user-friendly experience. This project is aimed at providing a convenient solution for managing hospital bed availability and streamlining the booking process for patients and healthcare providers.

## Getting Started

Follow these steps to set up and run the Bed_Slots_Booking web application on your local machine.

### Prerequisites

- Python (3.x recommended)
- Flask
- MySQL

### Installation

1. Clone the repository to your local machine
2.pip install -r requirements.txt
### Database Configuration

1. Install and configure XAMPP.

2. Start the XAMPP control panel and make sure the Apache and MySQL services are running.

3. Import the MySQL database:
- In the XAMPP control panel, click on "Admin" for the MySQL module. This will open phpMyAdmin in your web browser.
- Create a new database for the project.
- Select the newly created database in phpMyAdmin.
- Click on the "Import" tab.
- Choose the SQL file provided with the project and click "Go" to import the database schema and initial data.

### Set Environment Variables

Set any necessary environment variables in your local environment or in the project code for sensitive information like secret keys, database URLs, etc.

### Run the Application

Start the Flask application:
python main.py
