-- ============================================================
--  SQL MASTERY JOURNEY — PHASE 1: FOUNDATIONS
--  Author   : [Your Name]
--  Database : MySQL
--  Topics   : SELECT, WHERE, ORDER BY, LIMIT, LIKE, IN,
--             BETWEEN, NULL handling, Aggregate Functions,
--             GROUP BY, HAVING, CASE WHEN, Subqueries,
--             Date Functions, String Functions
-- ============================================================


-- ============================================================
--  DATABASE SETUP
-- ============================================================

CREATE DATABASE IF NOT EXISTS sql_practice;
USE sql_practice;

-- Employees table
CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    department  VARCHAR(50),
    salary      DECIMAL(10,2),
    hire_date   DATE,
    city        VARCHAR(50),
    manager_id  INT
);

INSERT INTO employees VALUES
(1,  'Alice',   'Smith',    'HR',      55000, '2019-03-15', 'New York', NULL),
(2,  'Bob',     'Jones',    'IT',      72000, '2018-07-01', 'London',   1),
(3,  'Carol',   'White',    'IT',      68000, '2020-01-10', 'New York', 1),
(4,  'David',   'Brown',    'Sales',   45000, '2021-06-20', 'Chicago',  1),
(5,  'Eva',     'Davis',    'HR',      60000, '2017-11-05', 'London',   1),
(6,  'Frank',   'Miller',   'Sales',   51000, '2022-02-28', 'Chicago',  2),
(7,  'Grace',   'Wilson',   'IT',      79000, '2016-09-14', 'New York', 2),
(8,  'Henry',   'Moore',    'Finance', 83000, '2015-04-22', 'London',   2),
(9,  'Iris',    'Taylor',   'Finance', 77000, '2019-08-30', 'Chicago',  3),
(10, 'Jack',    'Anderson', 'Sales',   49000, '2020-12-01', 'New York', 3),
(11, 'Karen',   'Thomas',   'HR',      53000, '2023-01-17', 'Chicago',  3),
(12, 'Leo',     'Jackson',  'IT',      91000, '2014-05-09', 'London',   4),
(13, 'Mia',     'Harris',   'Finance', 70000, '2021-03-25', 'New York', 4),
(14, 'Nate',    'Martin',   'Sales',   47000, '2022-09-11', 'London',   4),
(15, 'Olivia',  'Garcia',   'HR',      62000, '2018-12-03', 'Chicago',  5);

-- Products table
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    price         DECIMAL(10,2),
    stock         INT
);

INSERT INTO products VALUES
(1,  'Laptop',        'Electronics', 899.99, 30),
(2,  'Mouse',         'Electronics',  25.00, 200),
(3,  'Desk Chair',    'Furniture',   299.99,  50),
(4,  'Notebook',      'Stationery',    4.99, 500),
(5,  'Monitor',       'Electronics', 399.99,  45),
(6,  'Standing Desk', 'Furniture',   549.99,  20),
(7,  'Pen Pack',      'Stationery',    8.99, 300),
(8,  'Headphones',    'Electronics', 149.99,  80),
(9,  'Bookshelf',     'Furniture',   199.99,  15),
(10, 'Webcam',        'Electronics',  89.99,  60);


-- ============================================================
--  PHASE 1 — EASY QUESTIONS (Q1–Q50)
-- ============================================================

-- Q1: Retrieve all columns and rows from employees
SELECT * FROM employees;

-- Q2: Retrieve first_name, last_name, salary from employees
SELECT first_name, last_name, salary FROM employees;

-- Q3: Retrieve all columns from products where category = 'Electronics'
SELECT * FROM products WHERE category = 'Electronics';

-- Q4: Retrieve first_name, last_name, department of IT employees
SELECT first_name, last_name, department
FROM employees
WHERE department = 'IT';

-- Q5: Retrieve all columns where salary > 65000
SELECT * FROM employees WHERE salary > 65000;

-- Q6: Retrieve first_name, last_name, salary where salary BETWEEN 50000 AND 70000
SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

-- Q7: Retrieve all columns where city IN ('London', 'Chicago')
SELECT * FROM employees WHERE city IN ('London', 'Chicago');

-- Q8: Retrieve first_name, last_name, department where department <> 'Sales'
SELECT first_name, last_name, department
FROM employees
WHERE department <> 'Sales';

-- Q9: Retrieve all columns where manager_id IS NULL
SELECT * FROM employees WHERE manager_id IS NULL;

-- Q10: Retrieve first_name, last_name, hire_date where hired after 2020-01-01, ordered by hire_date ASC
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '2020-01-01'
ORDER BY hire_date ASC;

-- Q11: Retrieve all columns from products ordered by price DESC
SELECT * FROM products ORDER BY price DESC;

-- Q12: Retrieve first_name, last_name, salary ordered by department ASC then salary DESC
SELECT first_name, last_name, salary
FROM employees
ORDER BY department ASC, salary DESC;

-- Q13: Top 5 highest paid employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Q14: Products with price <= 100, ordered by price ASC, top 3
SELECT product_name, price
FROM products
WHERE price <= 100
ORDER BY price ASC
LIMIT 3;

-- Q15: Distinct department values
SELECT DISTINCT department FROM employees;

-- Q16: Employees whose first_name starts with 'A'
SELECT * FROM employees WHERE first_name LIKE 'A%';

-- Q17: Employees whose last_name contains 'o'
SELECT first_name, last_name, salary
FROM employees
WHERE last_name LIKE '%o%';

-- Q18: Employees with salary > 60000 AND city = 'New York'
SELECT * FROM employees
WHERE salary > 60000 AND city = 'New York';

-- Q19: Employees in HR department OR earning more than 80000
SELECT first_name, last_name, department, salary
FROM employees
WHERE department = 'HR' OR salary > 80000;

-- Q20: Employees not in London with salary BETWEEN 50000 AND 75000
SELECT * FROM employees
WHERE city <> 'London' AND salary BETWEEN 50000 AND 75000;

-- Q21: first_name and monthly_salary (salary/12 rounded to 2dp)
SELECT first_name, ROUND(salary / 12, 2) AS monthly_salary
FROM employees;

-- Q22: full_name using CONCAT with space
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- Q23: Products where stock > 50 AND category <> 'Furniture'
SELECT * FROM products
WHERE stock > 50 AND category <> 'Furniture';

-- Q24: product_name, price, discounted_price (10% off)
SELECT product_name, price, ROUND(price * 0.90, 2) AS discounted_price
FROM products;

-- Q25: Employees hired in 2020 or later using YEAR()
SELECT first_name, last_name, hire_date
FROM employees
WHERE YEAR(hire_date) >= 2020;

-- Q26: Finance or HR employees in London
SELECT * FROM employees
WHERE department IN ('Finance', 'HR') AND city = 'London';

-- Q27: Products with price NOT BETWEEN 50 AND 400
SELECT product_name, price
FROM products
WHERE price NOT BETWEEN 50 AND 400;

-- Q28: first_name, last_name, salary, tax (20% of salary)
SELECT first_name, last_name, salary,
       ROUND(salary * 0.20, 2) AS tax
FROM employees;

-- Q29: Employees whose first_name ends with 'a'
SELECT * FROM employees WHERE first_name LIKE '%a';

-- Q30: Chicago employees ordered by last_name ASC
SELECT first_name, last_name, city, department
FROM employees
WHERE city = 'Chicago'
ORDER BY last_name ASC;

-- Q31: first_name and last_name in UPPERCASE
SELECT UPPER(first_name) AS first_upper,
       UPPER(last_name)  AS last_upper
FROM employees;

-- Q32: product_name in lowercase
SELECT LOWER(product_name) AS product_lower FROM products;

-- Q33: first_name and its length, ordered by name_length DESC
SELECT first_name, LENGTH(first_name) AS name_length
FROM employees
ORDER BY name_length DESC;

-- Q34: manager_id with IFNULL — show 'No Manager' if NULL
SELECT first_name, last_name,
       IFNULL(manager_id, 'No Manager') AS manager
FROM employees;

-- Q35: product_name, price, stock, total_value ordered by total_value DESC
SELECT product_name, price, stock,
       (price * stock) AS total_value
FROM products
ORDER BY total_value DESC;

-- Q36: Employees where manager_id IS NOT NULL
SELECT * FROM employees WHERE manager_id IS NOT NULL;

-- Q37: Employees NOT IN HR or Finance
SELECT first_name, last_name, department
FROM employees
WHERE department NOT IN ('HR', 'Finance');

-- Q38: Employees whose last_name does NOT start with 'M'
SELECT first_name, last_name
FROM employees
WHERE last_name NOT LIKE 'M%';

-- Q39: hire_year extracted using YEAR()
SELECT first_name, last_name, hire_date,
       YEAR(hire_date) AS hire_year
FROM employees;

-- Q40: hire_month using MONTH(), ordered by hire_month ASC
SELECT first_name, last_name, hire_date,
       MONTH(hire_date) AS hire_month
FROM employees
ORDER BY hire_month ASC;

-- Q41: salary_grade using CASE WHEN
SELECT first_name, last_name, salary,
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium'
        WHEN salary > 70000 THEN 'High'
    END AS salary_grade
FROM employees;

-- Q42: stock_status using CASE WHEN
SELECT product_name, stock,
    CASE
        WHEN stock < 25 THEN 'Low Stock'
        WHEN stock BETWEEN 25 AND 100 THEN 'Normal'
        WHEN stock > 100 THEN 'High Stock'
    END AS stock_status
FROM products;

-- Q43: days_employed using DATEDIFF
SELECT first_name, last_name, hire_date,
       DATEDIFF(NOW(), hire_date) AS days_employed
FROM employees;

-- Q44: salary_after_bonus ($5000 flat bonus)
SELECT first_name, last_name, salary,
       salary + 5000 AS salary_after_bonus
FROM employees;

-- Q45: fake email using CONCAT + LOWER
SELECT first_name, last_name,
       LOWER(CONCAT(first_name, '.', last_name, '@company.com')) AS email
FROM employees;

-- Q46: price_range using CASE WHEN, ordered by price ASC
SELECT product_name, price,
    CASE
        WHEN price < 50 THEN 'Budget'
        WHEN price BETWEEN 50 AND 500 THEN 'Mid Range'
        WHEN price > 500 THEN 'Premium'
    END AS price_range
FROM products
ORDER BY price ASC;

-- Q47: Employees in New York or London with salary > 60000
SELECT first_name, last_name, city
FROM employees
WHERE city IN ('New York', 'London') AND salary > 60000;

-- Q48: hire_month_name using MONTHNAME()
SELECT first_name, last_name, hire_date,
       MONTHNAME(hire_date) AS hire_month_name
FROM employees;

-- Q49: Total number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Q50: Salary > 55000, not Chicago, last_name contains 's', ordered by salary DESC
SELECT first_name, last_name, salary, department
FROM employees
WHERE salary > 55000
  AND city <> 'Chicago'
  AND last_name LIKE '%s%'
ORDER BY salary DESC;


-- ============================================================
--  PHASE 1 — MEDIUM QUESTIONS (Q51–Q80)
-- ============================================================

-- Q51: Total and average salary across the company
SELECT SUM(salary) AS total_salary,
       ROUND(AVG(salary), 2) AS avg_salary
FROM employees;

-- Q52: Max, min, avg salary per department
SELECT department,
       MAX(salary) AS max_sal,
       MIN(salary) AS min_sal,
       ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department;

-- Q53: Employee count per city, ordered by count DESC
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
ORDER BY employee_count DESC;

-- Q54: Total salary per department where total > 150000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 150000
ORDER BY total_salary DESC;

-- Q55: Departments with more than 3 employees
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- Q56: Cities where avg salary > 60000
SELECT city, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY city
HAVING AVG(salary) > 60000
ORDER BY avg_salary DESC;

-- Q57: Departments with emp_count > 2 AND total_salary > 180000
SELECT department,
       COUNT(*) AS emp_count,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING COUNT(*) > 2 AND SUM(salary) > 180000
ORDER BY total_salary DESC;

-- Q58: salary_vs_avg using subquery in CASE WHEN
SELECT first_name, last_name, salary,
    CASE
        WHEN salary > (SELECT AVG(salary) FROM employees) THEN 'Above Average'
        WHEN salary < (SELECT AVG(salary) FROM employees) THEN 'Below Average'
        ELSE 'Average'
    END AS salary_vs_avg
FROM employees;

-- Q59: Category summary — count, avg price, total stock
SELECT category,
       COUNT(*) AS product_count,
       ROUND(AVG(price), 2) AS avg_price,
       SUM(stock) AS total_stock
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- Q60: experience level using YEAR() difference
SELECT first_name, last_name, hire_date,
    CASE
        WHEN (YEAR(NOW()) - YEAR(hire_date)) < 3  THEN 'Junior'
        WHEN (YEAR(NOW()) - YEAR(hire_date)) BETWEEN 3 AND 6 THEN 'Mid Level'
        WHEN (YEAR(NOW()) - YEAR(hire_date)) > 6  THEN 'Senior'
    END AS experience
FROM employees;

-- Q61: dept_avg using correlated subquery in SELECT
SELECT first_name, last_name, salary, department,
    (SELECT ROUND(AVG(salary), 2)
     FROM employees e2
     WHERE e2.department = e1.department) AS dept_avg
FROM employees e1;

-- Q62: Employees earning more than their dept average
SELECT first_name, last_name, salary, department
FROM employees e1
WHERE salary > (SELECT AVG(salary)
                FROM employees e2
                WHERE e2.department = e1.department);

-- Q63: Recent hires (after 2019) count per department, more than 1
SELECT department,
       COUNT(CASE WHEN YEAR(hire_date) > 2019 THEN 1 END) AS recent_hires
FROM employees
GROUP BY department
HAVING COUNT(CASE WHEN YEAR(hire_date) > 2019 THEN 1 END) > 1
ORDER BY recent_hires DESC;

-- Q64: Salary position in department — Highest, Lowest, Middle
SELECT first_name, last_name, salary,
    CASE
        WHEN salary = (SELECT MAX(salary) FROM employees e2
                       WHERE e2.department = e1.department) THEN 'Highest'
        WHEN salary = (SELECT MIN(salary) FROM employees e2
                       WHERE e2.department = e1.department) THEN 'Lowest'
        ELSE 'Middle'
    END AS salary_rank_in_dept
FROM employees e1;

-- Q65: Days to next work anniversary
SELECT first_name, last_name, hire_date,
    DATEDIFF(
        DATE_ADD(hire_date, INTERVAL (YEAR(NOW()) - YEAR(hire_date) + 1) YEAR),
        NOW()
    ) AS days_to_next_anniversary
FROM employees;

-- Q66: Salary difference from company max
SELECT first_name, last_name, salary, department,
       (SELECT MAX(salary) FROM employees) - salary AS salary_diff_from_max
FROM employees
ORDER BY salary_diff_from_max ASC;

-- Q67: Price difference from category average
SELECT product_name, price, category,
       ROUND(price - (SELECT AVG(price) FROM products p2
                      WHERE p2.category = p1.category), 2) AS price_diff_from_category_avg
FROM products p1
ORDER BY category ASC;

-- Q68: Percentage of department total salary
SELECT first_name, last_name, department, salary,
    ROUND((salary / (SELECT SUM(salary) FROM employees e2
                     WHERE e2.department = e1.department)) * 100, 2) AS pct_of_dept_total
FROM employees e1;

-- Q69: Quarter hired using CASE WHEN + MONTH()
SELECT first_name, last_name, hire_date,
    CASE
        WHEN MONTH(hire_date) BETWEEN 1  AND 3  THEN 'Q1'
        WHEN MONTH(hire_date) BETWEEN 4  AND 6  THEN 'Q2'
        WHEN MONTH(hire_date) BETWEEN 7  AND 9  THEN 'Q3'
        WHEN MONTH(hire_date) BETWEEN 10 AND 12 THEN 'Q4'
    END AS quarter_hired
FROM employees;

-- Q70: Employee count per quarter
SELECT
    CASE
        WHEN MONTH(hire_date) BETWEEN 1  AND 3  THEN 'Q1'
        WHEN MONTH(hire_date) BETWEEN 4  AND 6  THEN 'Q2'
        WHEN MONTH(hire_date) BETWEEN 7  AND 9  THEN 'Q3'
        WHEN MONTH(hire_date) BETWEEN 10 AND 12 THEN 'Q4'
    END AS quarter_hired,
    COUNT(*) AS emp_count
FROM employees
GROUP BY quarter_hired
ORDER BY quarter_hired ASC;

-- Q71: dept_min and dept_max using two correlated subqueries
SELECT first_name, last_name, salary, department,
    (SELECT MIN(salary) FROM employees e2
     WHERE e2.department = e1.department) AS dept_min,
    (SELECT MAX(salary) FROM employees e2
     WHERE e2.department = e1.department) AS dept_max
FROM employees e1
ORDER BY department ASC;

-- Q72: Department category — High/Mid/Low paying
SELECT department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary,
    CASE
        WHEN AVG(salary) >= 75000 THEN 'High Paying'
        WHEN AVG(salary) BETWEEN 55000 AND 74999 THEN 'Mid Paying'
        ELSE 'Low Paying'
    END AS dept_category
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- Q73: Employment duration in 'X years Y months'
SELECT first_name, last_name, hire_date,
    CONCAT(
        TIMESTAMPDIFF(YEAR, hire_date, NOW()), ' years ',
        MOD(TIMESTAMPDIFF(MONTH, hire_date, NOW()), 12), ' months'
    ) AS employment_duration
FROM employees;

-- Q74: Running department salary total
SELECT first_name, last_name, salary, department,
    (SELECT SUM(salary) FROM employees e2
     WHERE e2.department = e1.department
       AND e2.salary <= e1.salary) AS running_dept_total
FROM employees e1
ORDER BY department, salary ASC;

-- Q75: Top earner per department
SELECT first_name, last_name, department, salary
FROM employees e1
WHERE salary = (SELECT MAX(salary) FROM employees e2
                WHERE e2.department = e1.department);

-- Q76: Employees earning more than every HR employee
SELECT first_name, last_name, salary, department
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department = 'HR');

-- Q77: Employees earning more than at least one Finance employee
SELECT first_name, last_name, salary, department
FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department = 'Finance');

-- Q78: Employees in a dept with at least one person earning > 80000
SELECT first_name, last_name, department
FROM employees e1
WHERE EXISTS (
    SELECT 1 FROM employees e2
    WHERE e2.department = e1.department
      AND e2.salary > 80000
);

-- Q79: Product price comparison to category average
SELECT product_name, price, category,
    CASE
        WHEN price > (SELECT AVG(price) FROM products p2
                      WHERE p2.category = p1.category) * 1.20 THEN 'Overpriced'
        WHEN price < (SELECT AVG(price) FROM products p2
                      WHERE p2.category = p1.category) * 0.80 THEN 'Underpriced'
        ELSE 'Fairly Priced'
    END AS comparison
FROM products p1;

-- Q80: Department budget report with budget_status
SELECT department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary,
       SUM(salary) AS total_salary,
    CASE
        WHEN SUM(salary) > 200000 THEN 'Over Budget'
        WHEN SUM(salary) BETWEEN 150000 AND 200000 THEN 'On Track'
        ELSE 'Under Budget'
    END AS budget_status
FROM employees
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY total_salary DESC;


-- ============================================================
--  PHASE 1 — HARD QUESTIONS (Q81–Q100)
-- ============================================================

-- Q81: Employees earning above dept avg but not in top 3 company-wide
SELECT first_name, last_name, salary, department
FROM employees e1
WHERE salary > (SELECT AVG(salary) FROM employees e2
                WHERE e2.department = e1.department)
  AND emp_id NOT IN (SELECT emp_id FROM employees ORDER BY salary DESC LIMIT 3)
ORDER BY salary DESC;

-- Q82: Department summary with highest and lowest paid employee names
SELECT department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary,
       (SELECT first_name FROM employees e2
        WHERE e2.department = e1.department
        ORDER BY salary DESC LIMIT 1) AS highest_paid,
       (SELECT first_name FROM employees e2
        WHERE e2.department = e1.department
        ORDER BY salary ASC LIMIT 1) AS lowest_paid
FROM employees e1
GROUP BY department;

-- Q83: Is each employee the highest paid in their city?
SELECT first_name, last_name, salary, department, city,
    CASE
        WHEN salary = (SELECT MAX(salary) FROM employees e2
                       WHERE e2.city = e1.city) THEN 'Yes'
        ELSE 'No'
    END AS is_highest_in_city
FROM employees e1
ORDER BY city, salary DESC;

-- Q84: Earliest hired employee per department
SELECT first_name, last_name, hire_date, salary, department
FROM employees e1
WHERE hire_date = (SELECT MIN(hire_date) FROM employees e2
                   WHERE e2.department = e1.department)
ORDER BY hire_date ASC;

-- Q85: Salary percentile across company
SELECT first_name, last_name, salary, department,
    ROUND(((SELECT COUNT(*) FROM employees e2 WHERE e2.salary <= e1.salary)
           / (SELECT COUNT(*) FROM employees)) * 100, 2) AS salary_percentile
FROM employees e1
ORDER BY salary_percentile DESC;

-- Q86: Salary distribution per department
SELECT department,
       COUNT(*) AS emp_count,
       COUNT(CASE WHEN salary > (SELECT AVG(salary) FROM employees)
                  THEN 1 END) AS above_avg_count,
       COUNT(CASE WHEN salary < (SELECT AVG(salary) FROM employees)
                  THEN 1 END) AS below_avg_count,
       ROUND(COUNT(CASE WHEN salary > (SELECT AVG(salary) FROM employees)
                        THEN 1 END) / COUNT(*) * 100, 2) AS pct_above_avg
FROM employees
GROUP BY department
ORDER BY pct_above_avg DESC;

-- Q87: Salary rank within department
SELECT first_name, last_name, salary, department,
    (SELECT COUNT(*) FROM employees e2
     WHERE e2.department = e1.department
       AND e2.salary > e1.salary) + 1 AS dept_salary_rank
FROM employees e1
ORDER BY department, dept_salary_rank ASC;

-- Q88: City-department combos with 2+ employees and avg salary > 60000
SELECT city, department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY city, department
HAVING COUNT(*) >= 2 AND AVG(salary) > 60000
ORDER BY city, avg_salary DESC;

-- Q89: Running company salary total with percentage
SELECT first_name, last_name, salary, department,
    (SELECT SUM(salary) FROM employees e2
     WHERE e2.salary <= e1.salary) AS running_company_total,
    ROUND(((SELECT SUM(salary) FROM employees e2 WHERE e2.salary <= e1.salary)
           / (SELECT SUM(salary) FROM employees)) * 100, 2) AS running_pct
FROM employees e1
ORDER BY salary ASC;

-- Q90: Days between consecutive hire dates
SELECT first_name, last_name, hire_date, salary,
    IFNULL(DATEDIFF(e1.hire_date,
        (SELECT MAX(hire_date) FROM employees e2
         WHERE e2.hire_date < e1.hire_date)), 0) AS prev_hire_gap
FROM employees e1
ORDER BY hire_date ASC;

-- Q91: Senior vs junior breakdown per department
SELECT department,
       COUNT(*) AS emp_count,
       COUNT(CASE WHEN YEAR(hire_date) < 2019 THEN 1 END) AS senior_count,
       COUNT(CASE WHEN YEAR(hire_date) >= 2019 THEN 1 END) AS junior_count,
       ROUND(COUNT(CASE WHEN YEAR(hire_date) < 2019 THEN 1 END)
             / COUNT(*) * 100, 2) AS senior_pct,
       ROUND(AVG(CASE WHEN YEAR(hire_date) < 2019 THEN salary END), 2) AS avg_senior_salary
FROM employees
GROUP BY department
ORDER BY senior_pct DESC;

-- Q92: Department rank + city rank combined as unique_position
SELECT first_name, last_name, salary, department, city,
    (SELECT COUNT(*) FROM employees e2
     WHERE e2.department = e1.department
       AND e2.salary > e1.salary) + 1 AS dept_rank,
    (SELECT COUNT(*) FROM employees e2
     WHERE e2.city = e1.city
       AND e2.salary > e1.salary) + 1 AS city_rank,
    CONCAT('D',
        (SELECT COUNT(*) FROM employees e2
         WHERE e2.department = e1.department AND e2.salary > e1.salary) + 1,
        '-C',
        (SELECT COUNT(*) FROM employees e2
         WHERE e2.city = e1.city AND e2.salary > e1.salary) + 1
    ) AS unique_position
FROM employees e1
ORDER BY department, dept_rank ASC;

-- Q93: Salary growth potential classification
SELECT first_name, last_name, hire_date, salary,
    CASE
        WHEN salary = (SELECT AVG(salary) FROM employees)
             THEN 'At Market'
        WHEN YEAR(hire_date) < 2018
             AND salary < (SELECT AVG(salary) FROM employees)
             THEN 'High Growth'
        WHEN YEAR(hire_date) < 2018
             AND salary > (SELECT AVG(salary) FROM employees)
             THEN 'Stable Senior'
        WHEN YEAR(hire_date) >= 2018
             AND salary > (SELECT AVG(salary) FROM employees)
             THEN 'Fast Tracker'
        WHEN YEAR(hire_date) >= 2018
             AND salary < (SELECT AVG(salary) FROM employees)
             THEN 'Developing'
    END AS salary_growth_potential
FROM employees e1
ORDER BY hire_date ASC;

-- Q94: Top in department, city, or both
SELECT first_name, last_name, salary, department, city,
    CASE
        WHEN salary = (SELECT MAX(salary) FROM employees e2
                       WHERE e2.department = e1.department)
             AND salary = (SELECT MAX(salary) FROM employees e2
                           WHERE e2.city = e1.city)
             THEN 'Top in Both'
        WHEN salary = (SELECT MAX(salary) FROM employees e2
                       WHERE e2.department = e1.department)
             THEN 'Top in Department'
        WHEN salary = (SELECT MAX(salary) FROM employees e2
                       WHERE e2.city = e1.city)
             THEN 'Top in City'
    END AS reason
FROM employees e1
WHERE salary = (SELECT MAX(salary) FROM employees e2
                WHERE e2.department = e1.department)
   OR salary = (SELECT MAX(salary) FROM employees e2
                WHERE e2.city = e1.city)
ORDER BY department, salary DESC;

-- Q95: Department salary spread report
SELECT department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary,
       (MAX(salary) - MIN(salary)) AS salary_spread,
    CASE
        WHEN (MAX(salary) - MIN(salary)) > 30000 THEN 'Wide'
        WHEN (MAX(salary) - MIN(salary)) BETWEEN 15000 AND 30000 THEN 'Moderate'
        ELSE 'Narrow'
    END AS spread_category
FROM employees
GROUP BY department
ORDER BY salary_spread DESC;

-- Q96: Bonus and total compensation
SELECT first_name, last_name, salary, department, hire_date,
    ROUND(CASE
        WHEN YEAR(hire_date) < 2018
             AND salary = (SELECT MAX(salary) FROM employees e2
                           WHERE e2.department = e1.department)
             THEN salary * 0.20
        WHEN YEAR(hire_date) < 2018
             THEN salary * 0.10
        WHEN YEAR(hire_date) >= 2018
             AND salary > (SELECT AVG(salary) FROM employees)
             THEN salary * 0.08
        ELSE salary * 0.05
    END, 2) AS bonus,
    ROUND(salary + CASE
        WHEN YEAR(hire_date) < 2018
             AND salary = (SELECT MAX(salary) FROM employees e2
                           WHERE e2.department = e1.department)
             THEN salary * 0.20
        WHEN YEAR(hire_date) < 2018
             THEN salary * 0.10
        WHEN YEAR(hire_date) >= 2018
             AND salary > (SELECT AVG(salary) FROM employees)
             THEN salary * 0.08
        ELSE salary * 0.05
    END, 2) AS total_compensation
FROM employees e1
ORDER BY total_compensation DESC;

-- Q97: City-department summary with highest/lowest paid
SELECT city, department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary,
       SUM(salary) AS total_salary,
       (SELECT first_name FROM employees e2
        WHERE e2.department = e1.department AND e2.city = e1.city
        ORDER BY salary DESC LIMIT 1) AS highest_paid,
       (SELECT first_name FROM employees e2
        WHERE e2.department = e1.department AND e2.city = e1.city
        ORDER BY salary ASC LIMIT 1) AS lowest_paid,
    CASE
        WHEN SUM(salary) > 150000 THEN 'High Budget'
        WHEN SUM(salary) BETWEEN 80000 AND 150000 THEN 'Medium Budget'
        ELSE 'Low Budget'
    END AS budget_status
FROM employees e1
GROUP BY city, department
HAVING COUNT(*) >= 2
ORDER BY city, total_salary DESC;

-- Q98: Employee tier classification
SELECT first_name, last_name, salary, department, hire_date,
    CASE
        WHEN YEAR(hire_date) < 2019
             AND emp_id IN (SELECT emp_id FROM employees
                            ORDER BY salary DESC LIMIT 3)
             THEN 'Tier 1 - Elite'
        WHEN YEAR(hire_date) < 2018
             AND salary > (SELECT AVG(salary) FROM employees e2
                           WHERE e2.department = e1.department)
             THEN 'Tier 2 - Senior Star'
        WHEN YEAR(hire_date) >= 2020
             AND salary > (SELECT AVG(salary) FROM employees)
             THEN 'Tier 3 - Rising Star'
        ELSE 'Tier 4 - Standard'
    END AS employee_tier
FROM employees e1
ORDER BY employee_tier ASC, salary DESC;

-- Q99: Complete employee report with ranks and scores
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       department, city, salary,
       (SELECT COUNT(*) FROM employees e2
        WHERE e2.department = e1.department
          AND e2.salary > e1.salary) + 1 AS dept_rank,
       (SELECT COUNT(*) FROM employees e2
        WHERE e2.city = e1.city
          AND e2.salary > e1.salary) + 1 AS city_rank,
       CASE WHEN YEAR(hire_date) < 2018 THEN 'Senior'
            ELSE 'Junior' END AS experience,
       CASE WHEN salary > (SELECT AVG(salary) FROM employees e2
                           WHERE e2.department = e1.department)
            THEN 'High' ELSE 'Low' END AS salary_band,
       (SELECT COUNT(*) FROM employees e2
        WHERE e2.department = e1.department
          AND e2.salary > e1.salary) + 1 +
       (SELECT COUNT(*) FROM employees e2
        WHERE e2.city = e1.city
          AND e2.salary > e1.salary) + 1 AS overall_score
FROM employees e1
WHERE (SELECT COUNT(*) FROM employees e2
       WHERE e2.department = e1.department
         AND e2.salary > e1.salary) + 1 +
      (SELECT COUNT(*) FROM employees e2
       WHERE e2.city = e1.city
         AND e2.salary > e1.salary) + 1 <= 4
ORDER BY overall_score ASC;

-- Q100: Complete company analytics report (FINAL BOSS)
SELECT department,
       COUNT(*) AS emp_count,
       ROUND(AVG(salary), 2) AS avg_salary,
       SUM(salary) AS total_salary,
       (MAX(salary) - MIN(salary)) AS salary_spread,
       COUNT(CASE WHEN YEAR(hire_date) < 2018 THEN 1 END) AS senior_count,
       COUNT(CASE WHEN YEAR(hire_date) >= 2018 THEN 1 END) AS junior_count,
       (SELECT first_name FROM employees e2
        WHERE e2.department = e1.department
        ORDER BY salary DESC LIMIT 1) AS top_earner,
    CASE
        WHEN AVG(salary) > 70000
             AND COUNT(CASE WHEN YEAR(hire_date) < 2018 THEN 1 END) > 1
             THEN 'Excellent'
        WHEN AVG(salary) > 60000 THEN 'Good'
        WHEN AVG(salary) > 50000 THEN 'Fair'
        ELSE 'Needs Attention'
    END AS dept_health
FROM employees e1
GROUP BY department
ORDER BY avg_salary DESC;


-- ============================================================
--  END OF PHASE 1
--  Next: Phase 2 — JOINs, Advanced Aggregations, CTEs
-- ============================================================
