-- Create Students table
CREATE TABLE Students (
    Student_No INT PRIMARY KEY,
    Forename VARCHAR(50),
    Surname VARCHAR(50)
);

-- Insert sample data into Students table
INSERT INTO Students (Student_No, Forename, Surname)
VALUES
    (1, 'John', 'Doe'),
    (2, 'Jane', 'Smith'),
    (3, 'Emile', 'Zola');

-- Create Marks table
CREATE TABLE Marks (
    Student_No INT,
    Module_Name VARCHAR(50),
    Mark INT,
    FOREIGN KEY (Student_No) REFERENCES Students(Student_No)
);

-- Insert sample data into Marks table
INSERT INTO Marks (Student_No, Module_Name, Mark)
VALUES
    (1, 'Math', 90),
    (1, 'Science', 75),
    (2, 'Math', 85),
    (2, 'Science', 70),
    (3, 'Math', 95),
    (3, 'Science', 80);
