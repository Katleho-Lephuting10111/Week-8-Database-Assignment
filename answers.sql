
-- Table: Membership_Plans

CREATE TABLE Membership_Plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(8,2) NOT NULL,
    duration_months INT NOT NULL,
    description TEXT
);

-- Table: Members

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    join_date DATE DEFAULT CURRENT_DATE,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES Membership_Plans(plan_id)
);


-- Table: Trainers


CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);


-- Table: Classes

CREATE TABLE Classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(100) NOT NULL,
    schedule_time DATETIME NOT NULL,
    trainer_id INT,
    max_capacity INT DEFAULT 20,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);


-- Table: Class_Bookings (Many-to-Many)

CREATE TABLE Class_Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    class_id INT,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    UNIQUE(member_id, class_id)
);


-- Table: Payments

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    amount DECIMAL(8,2) NOT NULL,
    payment_date DATE DEFAULT CURRENT_DATE,
    method ENUM('Cash', 'Card', 'Online') NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);