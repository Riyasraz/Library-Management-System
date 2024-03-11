create database library;
use library;

create table Branch(
Branch_no int PRIMARY KEY, 
Manager_Id int,
Branch_address varchar(20),
Contact_no varchar(20)
);

create table Employee(
Emp_Id int PRIMARY KEY, 
Emp_name varchar(20),
Position varchar(20),
Salary int,
Branch_no int,
foreign key (Branch_no) references branch(Branch_no) on delete cascade
);

create table Books(
ISBN varchar(20) PRIMARY KEY,
Book_title varchar(50),
Category varchar(50),
Rental_Price int,
Status varchar(20),
Author varchar(30),
Publisher varchar(30)
);

create table Customer(
Customer_Id int PRIMARY KEY,
Customer_name varchar(20),
Customer_address varchar(30),
Reg_date date
);

create table IssueStatus(
Issue_Id int PRIMARY KEY ,
issued_cust int,
foreign key (issued_cust) references customer(customer_id) on delete cascade,
issued_book_name varchar (50),
Issue_date date,
isbn_book varchar(30),
foreign key (isbn_book) references books(isbn) on delete cascade
);

create table ReturnStatus(
Return_Id int PRIMARY KEY ,
Return_cust varchar(30),
Return_book_name varchar(50),
Return_date date,
isbn_book2 varchar(20),
foreign key (isbn_book2) references books(isbn) on delete cascade
);


insert into branch values(01,101,'Kochi','9212345678'),
(02,102,'Chennai','8187654321'),
(03,103,'Bangalore','8098765432'),
(04,104,'Kolkata','7387654321'),
(05,105,'New Delhi','8198768137');

select * from branch;


insert into employee values(501,'Riyas Shahul','Manager',60000,1),
(502, 'Alex X', 'Librarian', 45000,2),
(503, 'Saahil Rizvin', 'Assistant Librarian',40000,1),
(504, 'Jaseela Jasim','Clerk',35000,5),
(505, 'Thasleema','Manager',60000,3),
(506, 'Suchithra','Librarian',45000,1),
(507, 'Visal S','Assistant Librarian',40000,2),
(508, 'Sharukh Khan','Clerk',35000,1),
(509, 'Vijay Joseph','Clerk',60000,1),
(510, 'Tovino Thomas','Librarian',45000,5),
(511, 'Daniel', 'Clerk', 42000, 1),
(512, 'Emily', 'Manager', 48000, 4);

select * from employee;




insert into books values('978-0-446-31078-6', 'To Kill a Mockingbird', 'Fiction', 120, 'yes', 'Harper Lee', 'HarperCollins'),
('978-1-234-56789-0', '1984', 'Fiction', 140, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-7356-5', 'The Great Gatsby', 'Classic', 110, 'no', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-06-097749-6', 'The God of Small Things', 'Fiction', 130, 'yes', 'Arundhati Roy', 'Random House India'),
('978-93-8038-717-3', 'Aarachar', 'Fiction', 150, 'yes', 'K.R. Meera', 'DC Books'),
('978-0-7475-3269-6', 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 160, 'yes', 'J.K. Rowling', 'Bloomsbury'),
('978-0-060838652-0', 'A Peoples History of the United States', 'History', 100, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-81-265-0978-7', 'Pathummayude Aadu', 'Fiction', 130, 'yes', 'Vaikom Muhammad Basheer', 'DC Books'),
('978-0-14-119907-3', 'Pride and Prejudice', 'Romance', 110, 'no', 'Jane Austen', 'Penguin Classics'),
('978-0-09-928223-3', 'Oru Desathinte Katha', 'Novel', 140, 'yes', 'S.K. Pottekkatt', 'D.C. Books');

select * from books;




insert into customer values(1, 'Ayesha','Kochi,Kerala','2022-03-20'),
(2, 'Farhan','Coimbatore,Tamil Nadu','2022-05-08'),
(3, 'Fathima','Kozhikode,Kerala','2022-05-17'),
(4, 'Imran','Bengaluru,Karnataka','2021-08-25'),
(5, 'Zainab','Mysuru,Karnataka','2022-01-05'),
(6, 'Salman','Kollam,Kerala','2022-10-18'),
(7, 'Nazia','Salem,Tamil Nadu','2022-05-13'),
(8, 'Amir','Agra,New Delhi','2021-11-20'),
(9, 'Irfan','Kannur,Kerala','2023-12-27'),
(10, 'Rahman','Kolkata,West Bengal','2021-04-19');


select * from customer;



insert into IssueStatus values(11,1,'To Kill a Mockingbird','2010-01-20','978-0-446-31078-6'),
(22,2,'1984','2002-04-02','978-1-234-56789-0'),
(33,3,'The Great Gatsby', '2009-03-10','978-0-7432-7356-5'),
(44, 4,'The God of Small Things','2004-04-18', '978-0-06-097749-6'),
(55, 5,'Aarachar', '2002-05-05','978-93-8038-717-3'),
(66, 6,'Harry Potter and the Sorcerer\'s Stone', '2004-05-12','978-0-7475-3269-6'),
(77, 7,'A Peoples History of the United States','2006-05-20','978-0-060838652-0'),
(88, 8,'Pathummayude Aadu','2007-06-02','978-81-265-0978-7'),
(99, 9,'Pride and Prejudice','2023-06-15','978-0-14-119907-3'),
(100, 2,'Oru Desathinte Katha','2010-06-28','978-0-09-928223-3');

select * from IssueStatus;

insert into ReturnStatus values(1001, 'Ayesha','To Kill a Mockingbird','2023-04-02','978-0-446-31078-6'),
(1002, 'Farhan','1984','2023-04-05','978-1-234-56789-0'),
(1003, 'Fathima','The Great Gatsby','2023-04-10','978-0-7432-7356-5'),
(1004, 'Rahman','Oru Desathinte Katha', '2023-04-15','978-0-09-928223-3');

select * from ReturnStatus;




#Retrieve the book title, category, and rental price of all available books.
select book_title,category,rental_price from books where status = 'YES';


#List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;


#Retrieve the book titles and the corresponding customers who have issued those books.
select i.issued_book_name, c.Customer_name from issueStatus i
JOIN Customer c ON i.issued_cust = c.Customer_Id;

#Display the total count of books in each category.
select category, count(category) as count from books group by category;


#Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select emp_name,position,salary from employee where salary > 50000;


#List the customer names who registered before 2022-01-01 and have not issued any books yet.
select c.customer_name,c.reg_date from customer c left join issuestatus i on c.customer_id = i.issued_cust
where c.reg_date < '2022-01-01' and i.issued_cust is null;


#Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(emp_id) AS Total_Employees FROM Employee GROUP BY Branch_no;


#Display the names of customers who have issued books in the month of June 2023.
select c.customer_name,i.issue_date from customer c left join issuestatus i on c.customer_id=i.issued_cust 
WHERE YEAR(i.Issue_date) = 2023 AND month(i.issue_date)=6;


#Retrieve book_title from book table containing history.
select book_title from books where category ='history';

#Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select b.branch_no, count(e.emp_id) as Total_Employees
from branch b left join employee e on b.branch_no = e.branch_no
group by b.branch_no having count(e.emp_id) > 5;
