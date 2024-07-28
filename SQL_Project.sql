											-- Graduate Employment and Skills Analysis

USE sql_project;

			/*-- GraduatesInfo Table */
CREATE TABLE GraduatesInfo (
	GraduateID INT PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    GraduationYear INT NOT NULL,
    Degree VARCHAR(40) NOT NULL,
    Major VARCHAR(40) NOT NULL,
    CGPA DECIMAL(3,2) NOT NULL,
    Location VARCHAR(40) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    CHECK (Email LIKE '%@%.%') 
);

			-- EmploymentStatus Table
CREATE TABLE EmploymentStatus (
	StatusID INT PRIMARY KEY,
    GraduateID INT,
    Status VARCHAR(20),
    CONSTRAINT fk_EmploymentStatus_GraduateID
		FOREIGN KEY (GraduateID) 
        REFERENCES GraduatesInfo(GraduateID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

		-- JobDetails Table
CREATE TABLE JobDetails (
    JobID INT PRIMARY KEY,
    GraduateID INT,
    JobTitle VARCHAR(100) NOT NULL,
    Company VARCHAR(100) NOT NULL,
    Industry VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    Salary DECIMAL(10, 2),
    CONSTRAINT fk_JobDetails_GraduateID
		FOREIGN KEY (GraduateID) 
        REFERENCES GraduatesInfo(GraduateID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


		-- Skills Table
CREATE TABLE Skills (
    SkillID INT PRIMARY KEY,
    SkillName VARCHAR(50)
);

	-- GraduateSkills Table
CREATE TABLE GraduateSkills (
    GraduateID INT,
    SkillID INT,
    CONSTRAINT fk_GraduateSkills_GraduateID
		FOREIGN KEY (GraduateID) REFERENCES GraduatesINFO(GraduateID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    CONSTRAINT fk_GraduateSkills_SkillID    
		FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);


		-- ExtraCurriculars Table
CREATE TABLE ExtraCurriculars (
    CurricularID INT PRIMARY KEY,
    GraduateID INT,
    CurricularType VARCHAR(50), -- 'Internship', 'Extracurricular', etc.
    Description TEXT NOT NULL,
    CONSTRAINT fk_ExtraCurriculars_GraduateID
		FOREIGN KEY (GraduateID) 
        REFERENCES GraduatesInfo(GraduateID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- SHOW TABLES;

			-- GraduatesInfo Records
INSERT INTO GraduatesInfo (GraduateID, Name, Email, GraduationYear, Degree, Major, CGPA, Location, Gender) 
VALUES
	(1, 'Vaishnavi Kenjale', 'vaishnavikenjale02@gmail.com', 2024, 'B.Sc', 'Computer Science', 9.52, 'India', 'Female'),
	(2, 'Bob Smith', 'bob.smith@example.com', 2021, 'B.A.', 'Economics', 6.5, 'Los Angeles', 'Male'),
	(3, 'Charlie Brown', 'charlie.brown@example.com', 2023, 'B.Sc', 'Mathematics', 9.0, 'Chicago', 'Male'),
	(4, 'Diana Prince', 'diana.prince@example.com', 2022, 'B.A.', 'History', 8.9, 'New York', 'Female'),
	(5, 'Eve Adams', 'eve.adams@example.com', 2023, 'B.Sc', 'Biology', 6.6, 'San Francisco', 'Female'),
	(6, 'Frank Wright', 'frank.wright@example.com', 2022, 'B.Sc', 'Physics', 8.4, 'Seattle', 'Male'),
	(7, 'Grace Lee', 'grace.lee@example.com', 2021, 'B.Sc', 'Chemistry', 3.8, 'Boston', 'Female'),
	(8, 'Hank Green', 'hank.green@example.com', 2023, 'B.Sc', 'Engineering', 3.5, 'Austin', 'Male'),
	(9, 'Ivy Thomas', 'ivy.thomas@example.com', 2022, 'B.Sc', 'Environmental Science', 3.7, 'Denver', 'Female'),
	(10, 'Jack Black', 'jack.black@example.com', 2021, 'B.A.', 'Sociology', 3.4, 'Chicago', 'Male'),
	(11, 'Kelly White', 'kelly.white@example.com', 2023, 'B.Sc', 'Computer Science', 3.9, 'San Francisco', 'Female'),
	(12, 'Leo King', 'leo.king@example.com', 2022, 'B.A.', 'Philosophy', 7.6, 'New York', 'Male'),
	(13, 'Mia Brown', 'mia.brown@example.com', 2021, 'B.Sc', 'Biochemistry', 3.7, 'Los Angeles', 'Female'),
	(14, 'Noah Clark', 'noah.clark@example.com', 2023, 'B.Sc', 'Physics', 3.5, 'Seattle', 'Male'),
	(15, 'Olivia Wilson', 'olivia.wilson@example.com', 2022, 'B.Sc', 'Mathematics', 3.8, 'Boston', 'Female'),
	(16, 'Paul Harris', 'paul.harris@example.com', 2021, 'B.Sc', 'Engineering', 6.4, 'Austin', 'Male'),
	(17, 'Quinn Scott', 'quinn.scott@example.com', 2023, 'B.Sc', 'Biology', 5.6, 'Denver', 'Female'),
	(18, 'Ryan Davis', 'ryan.davis@example.com', 2022, 'B.Sc', 'Computer Science', 3.9, 'New York', 'Male'),
	(19, 'Sophia Moore', 'sophia.moore@example.com', 2021, 'B.A.', 'Economics', 7.7, 'Chicago', 'Female'),
	(20, 'Tom White', 'tom.white@example.com', 2023, 'B.Sc', 'Chemistry', 5.5, 'San Francisco', 'Male'),
	(21, 'Uma Green', 'uma.green@example.com', 2022, 'B.A.', 'History', 3.6, 'Boston', 'Female'),
	(22, 'Victor Blue', 'victor.blue@example.com', 2021, 'B.Sc', 'Physics', 9.4, 'Seattle', 'Male'),
	(23, 'Wendy Black', 'wendy.black@example.com', 2023, 'B.Sc', 'Environmental Science', 3.7, 'Denver', 'Female'),
	(24, 'Xander Grey', 'xander.grey@example.com', 2022, 'B.Sc', 'Computer Science', 3.9, 'New York', 'Male'),
	(25, 'Yara Pink', 'yara.pink@example.com', 2021, 'B.A.', 'Sociology', 3.6, 'Chicago', 'Female'),
	(26, 'Zane Silver', 'zane.silver@example.com', 2023, 'B.Sc', 'Mathematics', 3.8, 'Los Angeles', 'Male'),
	(27, 'Ava Brown', 'ava.brown@example.com', 2022, 'B.Sc', 'Biology', 6.7, 'San Francisco', 'Female'),
	(28, 'Ben Smith', 'ben.smith@example.com', 2021, 'B.Sc', 'Chemistry', 8.5, 'Boston', 'Male'),
	(29, 'Cara Jones', 'cara.jones@example.com', 2023, 'B.Sc', 'Physics', 3.6, 'Austin', 'Female'),
	(30, 'Dan Black', 'dan.black@example.com', 2022, 'B.Sc', 'Engineering', 9.9, 'Seattle', 'Male');
    
UPDATE GraduatesInfo
SET Location = 'New York'
WHERE GraduateID=1;

    SELECT * FROM GraduatesInfo;
    
				-- EmploymentStatus Records
INSERT INTO 
EmploymentStatus (StatusID, GraduateID, Status) 
VALUES
(1, 1, 'Employed'),
(2, 2, 'Unemployed'),
(3, 3, 'Employed'),
(4, 4, 'Unemployed'),
(5, 5, 'Employed'),
(6, 6, 'Employed'),
(7, 7, 'Unemployed'),
(8, 8, 'Employed'),
(9, 9, 'Employed'),
(10, 10, 'Unemployed'),
(11, 11, 'Employed'),
(12, 12, 'Unemployed'),
(13, 13, 'Employed'),
(14, 14, 'Unemployed'),
(15, 15, 'Employed'),
(16, 16, 'Employed'),
(17, 17, 'Unemployed'),
(18, 18, 'Employed'),
(19, 19, 'Employed'),
(20, 20, 'Unemployed'),
(21, 21, 'Employed'),
(22, 22, 'Unemployed'),
(23, 23, 'Employed'),
(24, 24, 'Employed'),
(25, 25, 'Unemployed'),
(26, 26, 'Employed'),
(27, 27, 'Employed'),
(28, 28, 'Unemployed'),
(29, 29, 'Employed'),
(30, 30, 'Employed');

UPDATE EmploymentStatus
SET Status = 'Unemployed'
WHERE GraduateID=18;

			-- JobDetails Records
INSERT INTO JobDetails (JobID, GraduateID, JobTitle, Company, Industry, StartDate, Salary) VALUES
(1, 1, 'Software Engineer', 'Tech Corp', 'Technology', '2024-01-15', 90000),
(2, 3, 'Data Analyst', 'Data Inc', 'Finance', '2023-06-01', 65000),
(3, 5, 'Research Scientist', 'BioLab', 'Biotechnology', '2023-07-20', 72000),
(4, 6, 'Physicist', 'Science World', 'Research', '2023-02-10', 80000),
(5, 8, 'Mechanical Engineer', 'EngWorks', 'Engineering', '2023-03-25', 75000),
(6, 9, 'Environmental Consultant', 'GreenEarth', 'Environmental Services', '2023-04-15', 68000),
(7, 11, 'Web Developer', 'WebSolutions', 'Technology', '2023-05-10', 83000),
(8, 13, 'Biochemist', 'HealthTech', 'Healthcare', '2023-08-01', 70000),
(9, 15, 'Mathematician', 'MathWorld', 'Education', '2023-09-15', 76000),
(10, 16, 'Electrical Engineer', 'Electric Co', 'Engineering', '2023-10-20', 78000),
(11, 18, 'Software Developer', 'SoftSolutions', 'Technology', '2023-11-05', 85000),
(12, 19, 'Economist', 'Finance Corp', 'Finance', '2023-12-01', 69000),
(13, 21, 'Historian', 'History House', 'Education', '2024-01-10', 71000),
(14, 23, 'Environmental Scientist', 'EcoLife', 'Environmental Services', '2024-02-15', 70000),
(15, 24, 'AI Specialist', 'AI Labs', 'Technology', '2024-03-05', 90000),
(16, 26, 'Mathematics Professor', 'University X', 'Education', '2024-04-20', 75000),
(17, 27, 'Geneticist', 'Genetics Lab', 'Healthcare', '2024-05-10', 72000),
(18, 29, 'Physics Researcher', 'Research Inc', 'Research', '2024-06-15', 80000),
(19, 30, 'Mechanical Engineer', 'BuildWorks', 'Engineering', '2024-07-01', 77000);


		-- Skills Records
INSERT INTO Skills (SkillID, SkillName) VALUES
(1, 'Python'),
(2, 'Data Analysis'),
(3, 'Machine Learning'),
(4, 'Project Management'),
(5, 'Communication'),
(6, 'Teamwork'),
(7, 'Problem Solving'),
(8, 'Java'),
(9, 'C++'),
(10, 'SQL'),
(11, 'Research'),
(12, 'Leadership'),
(13, 'C programming'),
(14, 'Artificial intelligence'),
(15, 'Machine Learning'),
(16, 'POWER BI'),
(17, 'Excel'),
(18, 'Digital marketing'),
(19, 'Cloud computing'),
(20, 'User experience design');


		-- GraduateSkills Records
INSERT INTO GraduateSkills (GraduateID, SkillID) VALUES
(1, 1), (1, 2), (1, 8), (1, 10), (1, 13), (1, 16), (1, 17), -- Vaishnavi Kenjale
(2, 2), (2, 4), (2, 5), -- Bob Smith
(3, 1), (3, 2), (3, 7), -- Charlie Brown
(4, 4), (4, 5), (4, 19), -- Diana Prince
(5, 11), (5, 7), (5, 8), -- Eve Adams
(6, 9), (6, 7), (6, 11), -- Frank Wright
(7, 2), (7, 4), (7, 5), -- Grace Lee
(8, 8), (8, 4), (8, 6), -- Hank Green
(9, 5), (9, 6), (9, 12), -- Ivy Thomas
(10, 4), (10, 5), (10, 6), -- Jack Black
(11, 1), (11, 8), (11, 10), -- Kelly White
(12, 2), (12, 4), (12, 5), -- Leo King
(13, 11), (13, 7), (13, 20), -- Mia Brown
(14, 9), (14, 17), (14, 11), -- Noah Clark
(15, 1), (15, 2), (15, 7), -- Olivia Wilson
(16, 8), (16, 4), (16, 6), -- Paul Harris
(17, 5), (17, 6), (17, 12), -- Quinn Scott
(19, 2), (19, 14), (19, 5), -- Sophia Moore
(20, 11), (20, 7), (20, 8), -- Tom White
(21, 4), (21, 15), (21, 6), -- Uma Green
(22, 9), (22, 7), (22, 11), -- Victor Blue
(23, 5), (23, 6), (23, 12), -- Wendy Black
(24, 1), (24, 3), (24, 10), -- Xander Grey
(25, 2), (25, 4), (25, 5), -- Yara Pink
(26, 1), (26, 16), (26, 7), -- Zane Silver
(27, 11), (27, 7), (27, 8), -- Ava Brown
(28, 9), (28, 7), (28, 11), -- Ben Smith
(29, 18), (29, 3), (29, 10), -- Cara Jones
(30, 8), (30, 4), (30, 6); -- Dan Black

			-- ExtraCurriculars  Records
INSERT INTO 
ExtraCurriculars (CurricularID, GraduateID, CurricularType, Description) 
VALUES
(1, 1, 'Internship', 'WEB DEVELOPER Internship at CodeClause'),
(2, 2, 'Extracurricular', 'Member of Economics Club'),
(3, 3, 'Internship', 'Data Analysis Internship at Data Inc'),
(4, 4, 'Extracurricular', 'History Society President'),
(5, 5, 'Research Project', 'Biology Research on Marine Life'),
(6, 6, 'Internship', 'Physics Internship at Science World'),
(7, 7, 'Extracurricular', 'Chemistry Club Member'),
(8, 8, 'Internship', 'Engineering Internship at EngWorks'),
(9, 9, 'Extracurricular', 'Environmental Club President'),
(10, 10, 'Research Project', 'Sociology Research on Urban Development'),
(11, 11, 'Internship', 'Web Development Internship at WebSolutions'),
(12, 12, 'Extracurricular', 'Philosophy Club Member'),
(13, 13, 'Research Project', 'Biochemistry Research on Enzymes'),
(14, 14, 'Internship', 'Physics Internship at Research Institute'),
(15, 15, 'Extracurricular', 'Mathematics Club President'),
(16, 16, 'Internship', 'Engineering Internship at Electric Co'),
(17, 17, 'Research Project', 'Biology Research on Genetics'),
(19, 19, 'Extracurricular', 'Economics Club Member'),
(20, 20, 'Research Project', 'Chemistry Research on Organic Compounds'),
(21, 21, 'Internship', 'History Internship at Museum of History'),
(22, 22, 'Extracurricular', 'Physics Club Member'),
(23, 23, 'Research Project', 'Environmental Science Research on Climate Change'),
(24, 24, 'Internship', 'AI Research Internship at AI Labs'),
(25, 25, 'Extracurricular', 'Sociology Club Member'),
(26, 26, 'Research Project', 'Mathematics Research on Algorithms'),
(27, 27, 'Internship', 'Genetics Internship at Genetics Lab'),
(28, 28, 'Extracurricular', 'Chemistry Club Member'),
(29, 29, 'Research Project', 'Physics Research on Quantum Mechanics'),
(30, 30, 'Internship', 'Engineering Internship at BuildWorks'),
(31, 1, 'Research Paper', 'The Economical Impact Of Toll Gates published in Shodhsamhita Journal'),
(32, 1, 'Statistics Project', 'Analyzed fast food consumption data by gender'),
(33, 1, 'Employability Skill Programme', 'Completed the program conducted by Mahindra Pride Classroom');


/* Count of Employed and Unemployed */
SELECT  Status, COUNT(*) AS "Count Of Graduates" 
FROM EmploymentStatus
GROUP BY Status
ORDER BY "Count Of Graduates" ; 

/* Graduate students in 2023  and CGPA is greater than 5. Order By CGPA in descending order.*/
SELECT Name, CONCAT(Degree, " ", Major) AS Stream, CGPA
FROM GraduatesInfo
WHERE GraduationYear = 2023 AND CGPA > 5
ORDER BY CGPA DESC;

/* Influence of CGPA on Employment by Gender */
SELECT g.CGPA, g.Gender, COUNT(es.GraduateID) AS Count
FROM GraduatesInfo g
JOIN EmploymentStatus es ON g.GraduateID = es.GraduateID
WHERE es.Status = 'Employed'
GROUP BY g.CGPA, g.Gender
ORDER BY g.CGPA DESC, g.Gender;

/* Write an SQL query to retrieve the name, concatenated degree and major as "Stream", CGPA, 
and salary (or 0 if not employed) 
for graduates from 2023 with CGPA greater than 5, sorted in descending order by salary. */
SELECT Name, CONCAT(Degree, " ", Major) AS Stream, CGPA, IFNULL(Salary, 0) AS Salary
FROM GraduatesInfo 
LEFT JOIN JobDetails
ON GraduatesInfo.GraduateID = JobDetails.GraduateID
WHERE GraduationYear = 2023 AND CGPA > 5
ORDER BY Salary DESC;


/* Write a SQL query to retrieve the name, concatenated degree and major, company, salary, 
comma-separated list of skills and list of extracurricular activities for the graduate*/
SELECT
    DISTINCT gi.Name,
    CONCAT(gi.Degree, " ", gi.Major) AS Degree,
    jd.Company,
    jd.Salary,
    (
        SELECT GROUP_CONCAT(DISTINCT s.SkillName SEPARATOR ', ')
        FROM GraduateSkills gs
        JOIN Skills s ON gs.SkillID = s.SkillID
        WHERE gs.GraduateID = gi.GraduateID
    ) AS SkillNames,
    (
        SELECT GROUP_CONCAT(DISTINCT ec.CurricularType SEPARATOR ', ')
        FROM ExtraCurriculars ec
        WHERE ec.GraduateID = gi.GraduateID
    ) AS ExtracurricularActivities
FROM
    GraduatesInfo gi
    JOIN JobDetails jd ON gi.GraduateID = jd.GraduateID
    JOIN GraduateSkills gs ON gi.GraduateID = gs.GraduateID
    LEFT JOIN ExtraCurriculars ec ON gi.GraduateID = ec.GraduateID
WHERE
    ec.CurricularType IS NOT NULL
ORDER BY
    jd.Salary;

/* Employment Rate by Location and Gender */
SELECT g.Location, g.Gender, 
       COUNT(CASE WHEN es.Status = 'Employed' THEN 1 END) * 100.0 / COUNT(*) AS EmploymentRate
FROM GraduatesInfo g
JOIN EmploymentStatus es ON g.GraduateID = es.GraduateID
GROUP BY g.Location, g.Gender;
-- Employment Rate By Location
SELECT gi.Location,
	ROUND(COUNT(CASE WHEN es.Status = 'Employed' THEN 1 END) * 100.0 / COUNT(*), 2) AS Employment_Rate
FROM GraduatesInfo gi
JOIN EmploymentStatus es ON gi.GraduateID = es.GraduateID
GROUP BY gi.Location
ORDER BY Employment_Rate DESC, Location;

SELECT
    g.Location,
    ROUND(AVG(CASE WHEN g.Gender = 'Male' AND e.Status = 'Employed' THEN 1 ELSE 0 END) * 100, 2) AS Male,
    ROUND(AVG(CASE WHEN g.Gender = 'Female' AND e.Status = 'Employed' THEN 1 ELSE 0 END) * 100, 2) AS Female
FROM
    GraduatesInfo g
LEFT JOIN
    EmploymentStatus e ON g.GraduateID = e.GraduateID
GROUP BY
    g.Location;
    
    
SELECT gi.Location,
ROUND(COUNT(CASE WHEN es.Status = 'Employed' AND gi.Gender = 'Male' THEN 1 END) * 100.0 / COUNT(*), 2) AS Male,
ROUND(COUNT(CASE WHEN es.Status = 'Employed' AND gi.Gender = 'Female' THEN 1 END) * 100.0 / COUNT(*), 2)AS Female
FROM GraduatesInfo gi
JOIN EmploymentStatus es 
ON gi.GraduateID = es.GraduateID
GROUP BY gi.Location;


SELECT * FROM Skills;


/*  The count of employed and total count of graduates for each gender, 
ordered by the count of employed graduates in descending order. */
SELECT
    a1.Gender,
    COUNT(CASE WHEN a2.Status = 'Employed' THEN 1 END) AS Count_Of_Employed,
    COUNT(a1.GraduateID) AS Total_Count
FROM
    GraduatesInfo a1
    LEFT JOIN EmploymentStatus a2 ON a1.GraduateID = a2.GraduateID
GROUP BY
    a1.Gender
ORDER BY
    Count_Of_Employed DESC;
    
-- Employment Rate by major

SELECT gi.Major,
	ROUND(COUNT(CASE WHEN es.Status = 'Employed' THEN 1 END) * 100.0 / COUNT(*), 2) AS Employment_Rate
FROM GraduatesInfo gi
JOIN EmploymentStatus es ON gi.GraduateID = es.GraduateID
GROUP BY gi.Major
ORDER BY Employment_Rate DESC;




-- TOP Skills - Write an SQL query to get the names of skills that graduates have if they have jobs paying more than $80,000. Make sure each skill name appears only once in the results.
SELECT s.SkillName
FROM Skills s
JOIN GraduateSkills gs
	ON s.SkillID = gs.SkillID
JOIN JobDetails jd
	ON jd.GraduateID = gs.GraduateID AND salary > 80000
GROUP BY s.SkillName;

-- Average Salary by Gender and Degree
SELECT g.Gender, g.Degree, FLOOR(AVG(j.Salary)) AS Average_Salary
FROM GraduatesInfo g
JOIN JobDetails j ON g.GraduateID = j.GraduateID
GROUP BY g.Gender, g.Degree
ORDER BY Average_Salary ;

-- graduates with internship experiences have higher employment rates or not
SELECT ROUND(AVG(CASE WHEN f.CurricularType = 'Internship' AND e.Status = 'Employed' THEN 1 ELSE 0 END) * 100, 2) AS InternshipEmploymentRate, 
ROUND(AVG(CASE WHEN f.CurricularType <> 'Internship' AND e.Status = 'Employed' THEN 1 ELSE 0 END) * 100, 2) AS NoInternshipEmploymentRate 
FROM ExtraCurriculars f 
JOIN EmploymentStatus e 
ON f.GraduateID = e.GraduateID;