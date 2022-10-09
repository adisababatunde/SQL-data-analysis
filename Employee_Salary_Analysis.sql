select * from EmployeeSal

--- find employee with the highest salary
select
PCN, Salary 
from EmployeeSal 
where Salary =(select max(Salary) from EmployeeSal)

---find the employee with the Nth highest salary(medium)
select top 1 * from EmployeeSal
order by Salary desc

---Salary order
select top 1 * from
(select top 2 PCN, Salary from EmployeeSal
order by Salary desc) Salary_Order
order by Salary asc

select top 1 * from
(select top 3 PCN, Salary from EmployeeSal
order by Salary desc) Salary_Order
order by Salary asc

--- Ranking function 
select
PCN, 
Salary,
RANK()over (order by Salary desc)as Ranking
from EmployeeSal

---Ranking with CTE
with CTE as
(select
PCN, 
Salary,
RANK()over (order by Salary desc)as Ranking
from EmployeeSal)

select * from CTE
where Ranking = 3

--- Find the Top Employees with the highest salary by Department
select
Department,
PCN, 
Salary,
RANK()over (partition by Department order by Salary desc)as Ranking
from EmployeeSal

--- Find the Top 3 Employees with the highest salary by Department
select * from
(select
Department,
PCN, 
Salary,
RANK()over (partition by Department order by Salary desc)as Ranking
from EmployeeSal)Ranks
where Ranking < 4


select * from
(select
Department,
PCN, 
Salary,
dense_RANK()over (partition by Department order by Salary desc)as Ranking
from EmployeeSal)Ranks
where Ranking < 4