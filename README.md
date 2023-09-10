# Bed_Slots_Booking Web Application

Bed_Slots_Booking is a web application developed using Python with the Flask framework and MySQL database. The application allows patients and hospitals to book and manage bed slots in hospitals. The interface is designed using HTML, CSS, Bootstrap, and JavaScript to ensure a user-friendly experience. This project is aimed at providing a convenient solution for managing hospital bed availability and streamlining the booking process for patients and healthcare providers.

## Getting Started

Follow these steps to set up and run the Bed_Slots_Booking web application on your local machine.

### Prerequisites

Before you begin, make sure you have the following software installed on your system:

- Python (3.x recommended)
- Flask
- MySQL

### Installation

1. **Clone the Repository:**
   - Clone the Bed_Slots_Booking repository to your local machine:

     ```
     git clone https://github.com/your-username/Bed_Slots_Booking.git
     ```

2. **Install Dependencies:**
   - Navigate to the project directory and install the required Python dependencies using pip:

     ```
     cd Bed_Slots_Booking
     pip install -r requirements.txt
     ```

### Database Configuration

1. **Install and Configure XAMPP:**
   - Download and install XAMPP from the official website.

2. **Start XAMPP Services:**
   - Launch the XAMPP control panel and ensure that both Apache and MySQL services are running.

3. **Import the MySQL Database:**
   - Access phpMyAdmin by clicking "Admin" for the MySQL module in the XAMPP control panel. This will open phpMyAdmin in your web browser.
   - Create a new database for the project.
   - Select the newly created database in phpMyAdmin.
   - Click on the "Import" tab.
   - Choose the provided SQL file (found in the project's database folder) and click "Go" to import the database schema and initial data.

### Set Environment Variables

It's essential to keep sensitive information like secret keys and database URLs secure. To do this, set any necessary environment variables either in your local environment or in the project code.

### Run the Application

Start the Flask application:
 ```
python main.py
 ```
**Access the Website:**
   - Open a web browser and navigate to `http://localhost:5000`

