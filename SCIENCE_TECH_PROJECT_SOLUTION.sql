CREATE DATABASE IF NOT EXISTS employee;

DESCRIBE emp_record_table;
DESCRIBE Proj_table;
DESCRIBE Data_science_team;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
FROM emp_record_table;

ALTER TABLE emp_record_table
ADD COLUMN DEPARTMENT VARCHAR(50);

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING < 2;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING > 4;

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME
FROM emp_record_table
WHERE DEPARTMENT = 'Finance';

SELECT 
    E1.EMP_ID AS Manager_ID, 
    CONCAT(E1.FIRST_NAME, ' ', E1.LAST_NAME) AS Manager_Name,
    COUNT(E2.EMP_ID) + 1 AS Num_Reporters
FROM 
    emp_record_table E1
LEFT JOIN 
    emp_record_table E2 ON E1.EMP_ID = E2.MANAGER_ID
GROUP BY 
    E1.EMP_ID, E1.FIRST_NAME, E1.LAST_NAME
HAVING 
    Num_Reporters > 1;
    
    
    SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEPARTMENT
FROM emp_record_table
WHERE DEPARTMENT = 'Healthcare'
UNION
SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEPARTMENT
FROM emp_record_table
WHERE DEPARTMENT = 'Finance';


SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    ROLE, 
    DEPARTMENT, 
    EMP_RATING,
    MAX(EMP_RATING) OVER(PARTITION BY DEPARTMENT) AS Max_Rating_For_Dept
FROM 
    emp_record_table;
    
    
    SELECT 
    ROLE,
    MIN(SALARY) AS Min_Salary,
    MAX(SALARY) AS Max_Salary
FROM 
    emp_record_table
GROUP BY 
    ROLE;
    
    
    SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EXP,
    RANK() OVER (ORDER BY EXP DESC) AS Experience_Rank
FROM 
    emp_record_table;
    
    
    
    CREATE VIEW high_salary_employees AS
SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    SALARY, 
    COUNTRY
FROM 
    emp_record_table
WHERE 
    SALARY > 6000;
    
    
    SELECT * FROM high_salary_employees;
    
    SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EXP
FROM 
    emp_record_table
WHERE 
    EXP > 10;
    
    DELIMITER //
CREATE PROCEDURE GetEmployeesWithExperienceMoreThanThreeYears()
BEGIN
    SELECT 
        EMP_ID, 
        FIRST_NAME, 
        LAST_NAME, 
        EXP
    FROM 
        emp_record_table
    WHERE 
        EXP > 3;
END //
DELIMITER ;


CALL GetEmployeesWithExperienceMoreThanThreeYears();



SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EXP,
    GetJobProfile(EXP) AS Job_Profile
FROM 
    emp_record_table
WHERE 
    DEPT = 'Data Science';
    
    CREATE INDEX idx_firstname ON employee (FIRST_NAME);
    CREATE INDEX idx_firstname ON your_database.employee (FIRST_NAME);
    
    SELECT 
    EMP_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    SALARY,
    EMP_RATING,
    (0.05 * SALARY * EMP_RATING) AS Bonus
FROM 
    emp_record_table;
    
    
    SELECT 
    CONTINENT,
    COUNTRY,
    AVG(SALARY) AS Average_Salary
FROM 
    emp_record_table
GROUP BY 
    CONTINENT, COUNTRY;