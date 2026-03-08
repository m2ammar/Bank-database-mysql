Create database if not exists Bank;
Use Bank;

/*Table Creation*/
create table if not exists Customers(
customer_id int primary key,
name varchar(50),
city varchar(50),
phone varchar(15)
);

create table if not exists Accounts(
account_id int primary key,
customer_id int, 
type enum('Savings', 'Current'),
balance double,
Foreign key (customer_id) references Customers(customer_id)
);

Create table if not exists Transactions(
transaction_id int primary key,
account_id int,
type enum('Credit','Debit'),
amount double,
transaction_date date,
foreign key (account_id) references Accounts(account_id)
);

Create table if not exists Loans(
loan_id int Primary key,
customer_id int,
amount double,
interest_rate double,
status enum('Active', 'Closed'),
Foreign key (customer_id) references Customers(customer_id)
);

Create table if not exists Employees(
employee_id int primary key,
name varchar(50),
role enum('Manager', 'Cashier', 'Analyst'),
salary double
);

/* Data Insert*/
insert into Customers (customer_id, name, city, phone) values 
(1, 'Ammar Khan', 'Karachi', '0312-1234567'),
(2, 'Sara Ali', 'Lahore', '0321-2345678'),
(3, 'Ahmed Raza' , 'Islamabad', '0333-3456789'),
(4, 'Hina Malik', 'Karachi', '0345-4567890'),
(5, 'Usman Tariq' ,'Faisalabad', '0301-5678901');

Select * from Customers;

insert into Accounts (account_id, customer_id, type, balance) values
(101, 1, 'Savings' ,50000),
(102, 2, 'Current', 120000),
(103, 3, 'Savings', 35000),
(104, 4, 'Savings', 80000),
(105, 5, 'Current', 200000);

Select * from Accounts;

insert into Transactions (transaction_id, account_id, type, amount, transaction_date) values
(1, 101, 'Credit', 10000, '2025-01-01'),
(2, 102, 'Debit', 5000, '2025-01-02'),
(3, 101, 'Debit', 2000, '2025-01-03'),
(4, 103, 'Credit', 15000, '2025-01-04'),
(5, 104, 'Debit', 8000, '2025-01-05'),
(6, 105, 'Credit', 25000, '2025-01-06');

Select * from Transactions;

insert into Loans(loan_id, customer_id, amount, interest_rate, status) values
(1, 1, 100000, 5.5, 'Active'),
(2, 3, 250000, 7.0, 'Active'),
(3, 2, 150000, 6.5, 'Closed'),
(4, 5, 300000, 8.0, 'Active'),
(5, 4, 200000, 5.0, 'Closed');

Select * from Loans;

insert into Employees(employee_id, name, role, salary) values
(1, 'Kamran Malik', 'Manager', 120000),
(2, 'Nadia Sheikh', 'Cashier', 55000),
(3, 'Bilal Ahmed', 'Cashier', 52000),
(4, 'Sana Mirza', 'Analyst', 85000),
(5, 'Tariq Hussain', 'Manager', 115000);

Select * from Employees;

/* Basic Queries */

SELECT Customers.name, Accounts.type, Accounts.balance
FROM Customers
INNER JOIN Accounts ON Customers.customer_id = Accounts.customer_id;

SELECT Customers.name, Customers.city, Accounts.balance
from Customers
inner join Accounts on Customers.customer_id = Accounts.customer_id
where Customers.city = 'Karachi';

select Transactions.account_id, Transactions.amount
from Transactions
where Transactions.type = 'Credit';

select sum(amount) as sum_of_all_amount
from Transactions
where type = 'Debit';

/* Join Queries */

SELECT Customers.name, SUM(Transactions.amount) AS total_transacted
FROM Customers
INNER JOIN Accounts ON Customers.customer_id = Accounts.customer_id
INNER JOIN Transactions ON Transactions.account_id = Accounts.account_id
GROUP BY Customers.name; 

Select Customers.name, Loans.amount
from Customers
inner join Loans on Loans.customer_id = Customers.customer_id 
where Loans.status = 'Active';

Select Customers.name, Accounts.type, Loans.amount, Loans.status
from Customers
inner join Accounts on Customers.customer_id = Accounts.customer_id
inner join Loans on Loans.customer_id = Customers.customer_id;

/* Aggregate Queries */

Select Customers.city, sum(Loans.amount) as total_loan_per_city
from Customers
inner join Loans on Loans.customer_id = Customers.customer_id 
group by Customers.city 
order by total_loan_per_city desc;

Select Customers.city, Max(Loans.amount) as highest_loan
from Customers
inner join Loans on Customers.customer_id = Loans.customer_id
group by Customers.city
order by highest_loan desc;

Select role, sum(salary) as total_salary_bill
from Employees
group by role
order by total_salary_bill desc;

/* Subqueries */

Select name, salary
from Employees
where salary > (Select avg(salary) from Employees);

/* Challenge Queries */

Select Accounts.account_id, Accounts.balance, Accounts.balance - SUM(Transactions.amount) AS remaining_balance
from Accounts
inner join Transactions on Accounts.account_id = Transactions.account_id
where Transactions.type = 'Debit'
group by Accounts.account_id;
