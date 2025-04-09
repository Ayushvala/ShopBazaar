--user table
create table Users (
    Id int identity(1,1) primary key,
    Name nvarchar(100) not null,
    Email nvarchar(100) unique  not null,
    Password nvarchar(100) not null
);

select * from Users
select * from Cart1



--sp_registration procedure
create procedure  sp_RegisterUser113
    @Name nvarchar(100),
    @Email nvarchar(100),
    @Password nvarchar(100),
    @ReturnVal int output
as
begin
    set nocount on;

    if exists (select 1 from Users where Email = @Email)
   begin
        set @ReturnVal = -1;  
        return;
  end

   insert into Users (Name, Email, Password)
   values(@Name, @Email, @Password);

   set @ReturnVal = scope_identity();
end


--sp_login procedure
create procedure sp_LoginUser1
    @Email varchar(100),
    @Password varchar(100)
as
begin
    select Id, Email
    from Users
   where Email = @Email and Password = @Password
end


--product table
create table Product2 (
    Id int identity(1,1) primary key,
    Name nvarchar(100) not null ,
    Description nvarchar(max) not null , 
	Oprice decimal(10,2),
    Dprice decimal(10,2) not null ,
    Photo nvarchar(255) not null         
);

select * from product2

insert into Product2 (Name, Description,Oprice, DPrice, Photo) 
values
('HP Laptop i5', 'A laptop is a portable computer that can be easily carried around.',87000, 83500, 'img1.jpg'),
('OnePlus Nord 2T', 'OnePlus Nord 2 5G Android smartphone.', 35000,33000, 'img2.jpg'),
('Boat SmartWatch', 'A smartwatch is a portable device worn on the wrist.',3000, 2399, 'img3.jpg'),
('Weyfer Sunglass', 'They are usually made of a plastic or metal frame and two lenses that are darkened to filter out light.',1000, 840, 'img4.jpg'),
(' Gucci Winter Jacket', 'A good winter jacket is defined by its warmth and lightweight design.',3799, 3599, 'img5.jpg'),
('Soft Toys', 'A toy or plaything is an object that is used primarily to provide entertainment.',699, 499, 'img6.jpg'),
('Steelo Water Bottle', 'Water bottle is a container which is used to carry and keep wa ter or any liquid in stable temperature for consumption.', 199,99, 'img7.jpg'),
('Trigger EarBuds', 'The Triggr Ear Buds are not only aesthetically pleasing but also incredibly convenient, featuring a compact and lightweight.',1500, 1199, 'img8.jpg'),
('Samsung Fridge', ' allows you to look inside your fridge from wherever you are using your phone.',50000, 45000, 'img13.jpg'),
('Uno Cards', 'Uno includes 108 cards: 25 in each of four color suits (red, yellow, green, blue).',90, 55, 'img10.jpg'),
('Digital weight scale', 'Analog scales work on a spring mechanism, while digital scales work on digital sensors.',699, 450, 'img11.jpg'),
('SG cricket kit', 'Sanspareils Greenlands (SG) is an Indian cricket equipment manufacturer.',5000, 4500, 'img12.jpg');





--cart table
   create table Cart1 (
    Id int identity(1,1) primary key,
    UserId int foreign key references Users(Id) on delete cascade,
    ProductId int foreign key references  Product2(Id) on delete cascade
);


-- Procedure For User's Cart By UserId
alter procedure sp_GetCartItemsByUserId
    @UserId int
as
begin
    set nocount on;

 select
        c.Id as CartId,
        c.UserId,
        c.ProductId,
        p.Name as ProductName,
        p.Oprice,
		p.Dprice,
        p.Photo
    from 
        Cart1 c
    join
        Product2 p on c.ProductId = p.Id
    where 
        c.UserId = @UserId;
end;

select * from Cart1

-- For getting User's Cart Detail

Create View CartDetails as
Select 
    c.Id as CartId,
    u.Name as UserName,
    p.Name as ProductName,
    p.Dprice as ProductPrice,
    p.Photo as ProductPhoto
From
    Cart1 c
Join 
    Users u On c.UserId = u.Id
join
    Product2 p On c.ProductId = p.Id;

select * from CartDetails
select * from Cart1
select * from Users
select * from product2

--Giftcard table
create table GiftCards (
    GiftCardId int identity(1,1) primary key,
    Amount decimal(10, 2),
    RecipientName nvarchar(100),
    RecipientEmail nvarchar(100),
    DateCreated datetime default getdate()
);

select * from GiftCards
delete from giftcards where GiftCardId between 1 and 14

--Giftcard procedure
create procedure InsertGiftCard
    @Amount decimal(10, 2),
    @RecipientName nvarchar(100),
    @RecipientEmail nvarchar(100)
as 
begin
 
   insert into GiftCards (Amount, RecipientName, RecipientEmail)
    values (@Amount, @RecipientName, @RecipientEmail);
    
    select scope_identity() as NewGiftCardId;
end;


create table Contactform1 (
    Id int identity(1,1) primary key,
    Name nvarchar(100),
    Email nvarchar(100),
    Message nvarchar(1000),
    SubmitAt datetime default getdate()
);

select * from Contactform1
delete from Contactform1 where id between 1 and 21















   
 















  























