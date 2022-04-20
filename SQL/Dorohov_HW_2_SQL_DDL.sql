-- 1) Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

-- 2) Наполнить таблицу employee 70 строками.

insert into employees (id, employee_name)
values  (default, 'Калинин Дмитрий'),
		(default, 'Нефедова Кира'),
		(default, 'Калинина Валерия'),
		(default, 'Асанин Иван'),
		(default, 'Гришина Майя'),
		(default, 'Фролов Иван'),
		(default, 'Козлов Александр'),
		(default, 'Иванова Ева'),
		(default, 'Сидоров Дмитрий'),
		(default, 'Архипов Иван'),
		(default, 'Калинин Роман'),
		(default, 'Розанов Иван'),
		(default, 'Гусева Анна'),
		(default, 'Сотников Данила'),
		(default, 'Зубков Лев'),
		(default, 'Громов Матвей'),
		(default, 'Романов Александр'),
		(default, 'Иванов Михаил'),
		(default, 'Жданов Денис'),
		(default, 'Самсонова Арина'),
		(default, 'Дубровина Екатерина'),
		(default, 'Филиппова Вероника'),
		(default, 'Лебедева Алиса'),
		(default, 'Смирнов Глеб'),
		(default, 'Серебрякова Анна'),
		(default, 'Фролов Марк'),
		(default, 'Крючков Андрей'),
		(default, 'Сергеев Илья'),
		(default, 'Головин Георгий'),
		(default, 'Смирнова Дарья'),
		(default, 'Михайлов Матвей'),
		(default, 'Черкасов Пётр'),
		(default, 'Лукьянова Мила'),
		(default, 'Любимов Андрей'),
		(default, 'Фролова Екатерина'),
		(default, 'Богданов Эмиль'),
		(default, 'Попова Амелия'),
		(default, 'Герасимова Екатерина'),
		(default, 'Соболева Мария'),
		(default, 'Макарова Вероника'),
		(default, 'Громова Виктория'),
		(default, 'Семенова Дарья'),
		(default, 'Белова Екатерина'),
		(default, 'Волков Станислав'),
		(default, 'Кукушкин Даниил'),
		(default, 'Черных Леонид'),
		(default, 'Голикова Василиса'),
		(default, 'Воронова София'),
		(default, 'Шаповалова Анна'),
		(default, 'Смирнова Милана'),
		(default, 'Быков Степан'),
		(default, 'Карпов Егор'),
		(default, 'Никифорова Мария'),
		(default, 'Федорова Вероника'),
		(default, 'Позднякова Варвара'),
		(default, 'Куликова Юлия'),
		(default, 'Белов Дмитрий'),
		(default, 'Мухина София'),
		(default, 'Котова Елизавета'),
		(default, 'Семенова Екатерина'),
		(default, 'Михайлова Алиса'),
		(default, 'Рубцова Александра'),
		(default, 'Калинина Мария'),
		(default, 'Голованов Богдан'),
		(default, 'Быков Алексей'),
		(default, 'Гусев Евгений'),
		(default, 'Данилова София'),
		(default, 'Коновалов Сергей'),
		(default, 'Андреева Ева'),
		(default, 'Антонов Максим');

select * from employees;

-- 3) Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary (
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

-- 4) Наполнить таблицу salary 15 строками

insert into salary (id, monthly_salary)
values  (default, 1000),
		(default, 1100),
		(default, 1200),
		(default, 1300),
		(default, 1400),
		(default, 1500),
		(default, 1600),
		(default, 1700),
		(default, 1800),
		(default, 1900),
		(default, 2000),
		(default, 2100),
		(default, 2200),
		(default, 2300),
		(default, 2400),
		(default, 2500);
		
select * from salary;

-- 5) Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

select * from employee_salary;

-- 6) Наполнить таблицу employee_salary 40 строками
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (id, employee_id, salary_id)
values  (default, 71, 1),
		(default, 72, 2),
		(default, 73, 3),
		(default, 74, 4),
		(default, 75, 5),
		(default, 76, 6),
		(default, 77, 7),
		(default, 78, 8),
		(default, 79, 9),
		(default, 80, 10),
		(default, 70, 11),
		(default, 69, 12),
		(default, 68, 13),
		(default, 67, 14),
		(default, 66, 15),
		(default, 65, 16),
		(default, 64, 1),
		(default, 63, 2),
		(default, 62, 3),
		(default, 61, 4),
		(default, 60, 5),
		(default, 59, 6),
		(default, 58, 7),
		(default, 57, 8),
		(default, 56, 9),
		(default, 55, 10),
		(default, 54, 11),
		(default, 53, 12),
		(default, 52, 13),
		(default, 51, 14),
		(default, 50, 15),
		(default, 49, 16),
		(default, 48, 1),
		(default, 47, 2),
		(default, 46, 3),
		(default, 45, 4),
		(default, 44, 5),
		(default, 43, 6),
		(default, 42, 7),
		(default, 41, 8);
		
select * from employee_salary;

-- 7) Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;

-- 8) Поменять тип столба role_name с int на varchar(30)

alter table roles 
alter column role_name type varchar(30); --using role_name::int; требуется для преобразования столбца к некоторым типам данных (особенность постгреса)

select * from roles;

-- 9) Наполнить таблицу roles 20 строками

insert into roles (id, role_name)
values  (default, 'Junior Python developer'),
		(default, 'Junior Java developer'),
		(default, 'Junior JavaScript developer'),
		(default, 'Junior Manual QA engineer'),
		(default, 'Junior Automation QA engineer'),
		(default, 'Sales manager'),
		(default, 'CEO'),
		(default, 'HR'),
		(default, 'Designer'),
		(default, 'Project Manager'),
		(default, 'Middle Python developer'),
		(default, 'Middle Java developer'),
		(default, 'Middle JavaScript developer'),
		(default, 'Middle Manual QA engineer'),
		(default, 'Middle Automation QA engineer'),
		(default, 'Senior Java developer'),
		(default, 'Senior JavaScript developer'),
		(default, 'Senior Manual QA engineer'),
		(default, 'Senior Automation QA engineer'),
		(default, 'Senior Python developer');
	
select * from roles;

-- 10) Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	FOREIGN KEY (employee_id)
		references employees(id),
	role_id int not null,
	FOREIGN KEY (role_id)
		references roles(id)
);

select * from roles_employee;

-- 11) Наполнить таблицу roles_employee 40 строками

insert into roles_employee (id, employee_id, role_id)
values  (default, 40, 1),
		(default, 39, 2),
		(default, 38, 3),
		(default, 37, 4),
		(default, 36, 5),
		(default, 35, 6),
		(default, 34, 7),
		(default, 33, 8),
		(default, 32, 9),
		(default, 31, 10),
		(default, 30, 11),
		(default, 29, 12),
		(default, 28, 13),
		(default, 27, 14),
		(default, 26, 15),
		(default, 25, 16),
		(default, 24, 17),
		(default, 23, 18),
		(default, 22, 19),
		(default, 21, 20),
		(default, 20, 1),
		(default, 19, 2),
		(default, 18, 3),
		(default, 17, 4),
		(default, 16, 5),
		(default, 15, 6),
		(default, 14, 7),
		(default, 13, 8),
		(default, 12, 9),
		(default, 11, 10),
		(default, 10, 11),
		(default, 9, 12),
		(default, 8, 13),
		(default, 7, 14),
		(default, 6, 16),
		(default, 5, 17),
		(default, 4, 18),
		(default, 3, 19),
		(default, 2, 20);
		
select * from roles_employee;
