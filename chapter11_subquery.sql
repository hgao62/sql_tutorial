--Chapter 11 Subquery(子查询)


--11.1 Subqueries that return a single value
SELECT productid, productname, unitprice
FROM Products
WHERE unitprice =
(SELECT MIN(unitprice)
FROM Products)


--11.2 A subquery that returns multiple values
SELECT productid, productname, unitprice
FROM Products
WHERE supplierid IN
(SELECT supplierid
FROM Suppliers
WHERE country = 'Japan');


--11.3 correlated subquery
-- (相关子查询)
SELECT empid, firstname, lastname, department, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees e2 
    WHERE e2.department = e1.department
)
ORDER BY department, salary DESC;






--Exercise 11.1 Find employees who earn more than the average salary of all employees
SELECT empid, firstname, lastname, department, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
--11.2  Find all employees who work in departments that have at least 2 employees
-- (查找所有在至少有 2 名员工的部门工作的员工)
SELECT empid, firstname, lastname, department, salary
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING COUNT(*) >= 2
);

-- 11.3 Find the employee with the highest salary in each department. The result should be emp, firstname, lastname, department, salary.
-- (在每个部门中找到薪水最高的员工。结果应该是 emp, firstname, lastname, department, salary)

SELECT empid, firstname, lastname, department, salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department = e1.department
)
ORDER BY department;
