Create table accounts(
    _Username varchar(30) primary key not null,
    _Password varchar(20) not null,
    _Created_at timestamp default '2016-05-17 09:30:00',
    _Updated_at timestamp default now() on update now()
);

select * from accounts;

insert into 
	accounts(_Username, _Password) 
values('admin','admin');

insert into 
	accounts(_Username, _Password) 
values('test','test');

select * from accounts where _Username = 'admin' and _Password = 'admin'