use homeworkthree;
/*creating tables*/
create table merchants(
	
	mid int  not null,
    name varchar(50),
    city varchar(50),
    state varchar(50),
    primary key(mid)
);
create table products(
	pid int  not null,
    name varchar(50),
    category varchar(50),
    description tinytext,
    primary key(pid),
    -- constraints
    constraint name_constraint check (name in ('Printer', 'Ethernet', 'Adapter', 'Desktop', 'Hard Drive',
												'Laptop', 'Router', 'Network Card', 'Super Drive', 'Monitor')),
	constraint category_constraint check(category in ('Peripheral', 'Networking', 'Computer'))
);
create table sell(
	mid int,
    pid int,
    price numeric(10,2),
    quantity_available int,
    -- constraints
    foreign key(mid) references merchants(mid),
    foreign key(pid) references products(pid),
    constraint price_constraint check (price between 0 and 100000),
    constraint quantity_available_constraint check (quantity_available between 0 and 1000)
);
create table orders(
	oid int,
    shipping_method varchar(6),
    shipping_cost numeric(4,2),
    -- constraints
    primary key(oid),
    constraint shipping_method_constraint check (shipping_method in ('UPS', 'FedEx', 'USPS')),
    constraint shipping_cost_constraint check (shipping_cost between 0 and 500)
);
create table contain(
	oid int,
    pid int,
    -- constraints
    foreign key(oid) references orders(oid),
    foreign key(pid) references products(pid)
);
create table customers(
	cid int  not null,
    fullname varchar(100),
    city varchar(50),
    state varchar(50),
    primary key(cid)
);
create table place(
	cid int,
    oid int,
    order_date date,
    -- constraints
    foreign key(oid) references orders(oid),
    foreign key(cid) references customers(cid)
);

	

    


