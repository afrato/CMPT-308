
DROP TABLE IF EXISTS duty;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS infrac;
DROP TABLE IF EXISTS partic;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS coach;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS club;
DROP TABLE IF EXISTS detention;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS address;

---------------------
-- Creating Tables --
---------------------


-- Address --
CREATE TABLE address (
  addrID		integer not null unique,
  strNum		integer not null,
  street		text not null,
  zip			integer not null,
 primary key(addrID)
);

-- People --
CREATE TABLE people (
  social		integer not null unique,
  fName			text not null,
  lName			text not null,
  addrID		integer not null,
 primary key(social),
 foreign key(addrID) references address(addrID)
);

-- Student --
CREATE TABLE student (
  social		integer not null unique references people(social),
  year			text not null,
  specNeed		text,
  GPA			numeric(3,2) not null,
 primary key(social)
);

-- Teacher --
CREATE TABLE teacher (
  social		integer not null unique references people(social),
  dept			text not null,
  salary		float not null,
 primary key(social)
);

-- Class --
CREATE TABLE class (
  crsNum		integer not null unique,
  time			time not null,
  rmNum			integer not null,
  creds			integer not null,
  name			text not null,
  primary key(crsNum)
);

-- Club --
CREATE TABLE club (
  clbNum		integer not null unique,
  time			time not null,
  name			text not null,
  primary key(clbNum)
);

-- Detention --
CREATE TABLE detention (
  detDate		date not null unique,
  rmNum			integer not null,
  primary key(detDate)
);

-- Enrollment --
CREATE TABLE enrollment (
  social		integer not null references student(social),
  crsNum		integer not null references class(crsNum),
  grade			integer not null,
  primary key(social, crsNum)
);

-- Partic --
CREATE TABLE partic (
  social		integer not null references student(social),
  clbNum		integer not null references club(clbNum),
  position		text not null,
  primary key(social, clbNum)
);

-- Infrac --
CREATE TABLE infrac (
  social		integer not null references student(social),
  detDate		date not null references detention(detDate),
  blurb			text not null,
  primary key(social, detDate)
);

-- Section --
CREATE TABLE section (
  social		integer not null references teacher(social),
  crsNum		integer not null references class(crsNum),
  primary key(social, crsNum)
);

-- Coach --
CREATE TABLE coach (
  social		integer not null references teacher(social),
  clbNum		integer not null references club(clbNum),
  primary key(social, clbNum)
);

-- Duty --
CREATE TABLE duty (
  social		integer not null references teacher(social),
  detDate		date not null references detention(detDate),
  primary key(social, detDate)
); 


-----------------------
-- Populating Tables --
-----------------------

--Address--
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 1, '1', 'Wally Road', 07843);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 2, '722', 'Inverness Drive ', 91762);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 3, '979', 'Beech Street', 45601);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 4, '406', 'Lilac Lane', 07302);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 5, '790', 'Academy Street', 76110);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 6, '862', '5th Street North', 30188);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 7, '555', '8th Street', 53590);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 8, '47', 'Route 17', 37918);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 9, '658', 'John Street', 46112);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 10, '152', 'Cleveland Street', 27330);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 11, '682', 'Warren Avenue', 03102);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 12, '615', 'Ridge Street', 27516);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 13, '888', 'Wally Road', 07302);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 14, '313', 'Wally Road', 07843);
INSERT INTO address( addrID, strNum, street, ZIP )
  VALUES( 15, '18', 'Adams Street', 32703);

--People--
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000001, 'Joe', 'Smith', 1);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000002, 'Jackie', 'Lloyd', 2);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000003, 'Milton', 'Christensen', 4);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000004, 'Bernadette', 'Summers', 9);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000005, 'Deborah', 'Daniel', 8);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000006, 'Daniel', 'Tate', 3);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000007, 'Ryan', 'Smith', 1);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000008, 'Eduardo', 'Nunez', 7);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000009, 'Sergio', 'Patterson', 6);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000010, 'Kellie', 'Hansen', 10);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000011, 'Diana', 'Jenkins', 5);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000012, 'Kyle', 'Jenkins', 5);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000013, 'Derek', 'Jenkins', 5);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000014, 'Leah', 'Mcguire', 11);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000015, 'Jenny', 'Lloyd', 12);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000016, 'Dale', 'Carroll', 13);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000017, 'Lloyd', 'Cannon', 14);
INSERT INTO people( social, fName, lName, addrID )
  VALUES( 1000000018, 'Jessica', 'Johnston', 15);


--Student--
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000012, 'Freshman', '', 3.25);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000011, 'Senior', '', 2.7);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000016, 'Sophomore', 'Dyslexia', 3.75);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000010, 'Junior', '', 1.82);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000017, 'Senior', '', 3.46);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000018, 'Senior', '', 0.9);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000015, 'Freshman', 'Speech', 2.9);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000008, 'Freshman', 'Speech', 2.4);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000009, 'Freshman', '', 2.95);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000007, 'Sophomore', '', 3.2);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000001, 'Junior', 'Paraplegia', 3.33);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000004, 'Junior', '', 3.04);
INSERT INTO student( social, year, specNeed, GPA )
  VALUES( 1000000006, 'Freshman', '', 4.0);

--Teacher--
INSERT INTO teacher( social, dept, salary )
  VALUES( 1000000013, 'History', 60000);
INSERT INTO teacher( social, dept, salary )
  VALUES( 1000000003, 'Math', 80000);
INSERT INTO teacher( social, dept, salary )
  VALUES( 1000000005, 'Science', 75000);
INSERT INTO teacher( social, dept, salary )
  VALUES( 1000000002, 'English', 100000);
INSERT INTO teacher( social, dept, salary )
  VALUES( 1000000014, 'English', 50000);

--Class--
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 201, '08:00', 0022, 4, 'Calculus' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 101, '10:00', 0032, 4, 'Algebra' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 102, '12:00', 0025, 4, 'Geometry' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 110, '08:00', 0222, 3, 'English I' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 210, '11:00', 0242, 3, 'English II' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 111, '09:00', 3022, 3, 'Grammer Concepts' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 112, '10:00', 5102, 3, 'English Basics' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 121, '08:00', 0302, 3, 'US History I' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 221, '10:00', 0890, 3, 'US History II' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 131, '11:00', 0632, 4, 'Biology' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 231, '12:00', 0999, 4, 'Physics' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 232, '08:00', 0420, 4, 'Chemistry' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 321, '12:00', 0820, 3, 'Europian History' );
INSERT INTO class( crsNum, time, rmNum, creds, name )
  VALUES( 310, '08:00', 0002, 3, 'Europian Literature' );

--Club--
INSERT INTO club( clbNum, time, name )
  VALUES( 1, '14:00', 'Soccer' );
INSERT INTO club( clbNum, time, name )
  VALUES( 2, '16:00', 'Chess' );
INSERT INTO club( clbNum, time, name )
  VALUES( 4, '14:30', 'Football' );
INSERT INTO club( clbNum, time, name )
  VALUES( 5, '14:00', 'Lacrosse' );
INSERT INTO club( clbNum, time, name )
  VALUES( 6, '16:00', 'Mock Trial' );

--Detention--
INSERT INTO detention( detDate, rmNum )
  VALUES( '1/13/16', 55 );
INSERT INTO detention( detDate, rmNum )
  VALUES( '2/14/16', 55 );
INSERT INTO detention( detDate, rmNum )
  VALUES( '3/19/16', 24 );
INSERT INTO detention( detDate, rmNum )
  VALUES( '4/22/16', 220 );
INSERT INTO detention( detDate, rmNum )
  VALUES( '4/13/16', 221 );

--Enrollment--
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000012, 201, 80 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000012, 210, 91 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000012, 231, 89 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000011, 101, 88 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000011, 110, 69 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000016, 111, 82 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000016, 112, 79 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000010, 231, 66 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000010, 232, 80 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000010, 221, 98 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000017, 321, 92 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000017, 310, 74 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000018, 321, 83 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000015, 102, 85 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000015, 121, 87 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000015, 131, 93 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000015, 111, 77 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000008, 111, 72 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000008, 112, 99 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000008, 321, 93 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000009, 210, 68 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000009, 131, 96 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000007, 232, 87 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000007, 101, 83 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000001, 231, 72 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000001, 321, 90 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000004, 201, 80 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000004, 102, 90 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000004, 221, 60 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000006, 310, 100 );
INSERT INTO enrollment( social, crsNum, grade )
  VALUES( 1000000006, 231, 100 );

-- Section --
INSERT INTO section( social, crsNum)
  VALUES( 1000000013, 121 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000013, 221 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000013, 321 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000003, 201 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000003, 101 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000003, 202 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000005, 131 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000005, 231 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000005, 232 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000002, 110 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000002, 210 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000014, 111 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000014, 112 );
INSERT INTO section( social, crsNum)
  VALUES( 1000000014, 310 );

-- Partic --
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000001, 2, 'First Chair');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000004, 1, 'Goalie');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000007, 2, 'Foward');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000011, 2, 'Defense');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000018, 2, 'Midfield');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000016, 4, 'Quarterback');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000015, 5, 'Goalie');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000008, 5, 'Foward');
INSERT INTO partic( social, clbNum, position)
  VALUES( 1000000009, 6, 'Witness');

-- Coach --
INSERT INTO coach( social, clbNum )
  VALUES( 1000000013, 1 );
INSERT INTO coach( social, clbNum )
  VALUES( 1000000003, 2 );
INSERT INTO coach( social, clbNum )
  VALUES( 1000000005, 4 );
INSERT INTO coach( social, clbNum )
  VALUES( 1000000002, 5 );
INSERT INTO coach( social, clbNum )
  VALUES( 1000000014, 6 );

-- Infrac --
INSERT INTO infrac( social, detDate, blurb)
  VALUES( 1000000010, '1/13/16', 'Pulled fire alarm');
INSERT INTO infrac( social, detDate, blurb)
  VALUES( 1000000018, '2/14/16', 'Started food fight');
INSERT INTO infrac( social, detDate, blurb)
  VALUES( 1000000001, '3/19/16', 'Too many lates');
INSERT INTO infrac( social, detDate, blurb)
  VALUES( 1000000012, '4/22/16', 'Gave teacher a weggie');
INSERT INTO infrac( social, detDate, blurb)
  VALUES( 1000000010, '4/13/16', 'Pulled fire alarm again');

-- Duty --
INSERT INTO duty( social, detDate )
  VALUES( 1000000013, '1/13/16' )
INSERT INTO duty( social, detDate )
  VALUES( 1000000003, '2/14/16' )
INSERT INTO duty( social, detDate )
  VALUES( 1000000005, '3/19/16' )
INSERT INTO duty( social, detDate )
  VALUES( 1000000002, '4/22/16' )
INSERT INTO duty( social, detDate )
  VALUES( 1000000014, '4/13/16' )



-- some useful sql statements --

-- all students name grade and social--
SELECT p.fname, p.lname, p.social, s.year
FROM people p, student s
WHERE p.social = s.social;

-- all teachers department name and social--
SELECT p.fname, p.lname, p.social, t.dept
FROM people p, teacher t
WHERE p.social = t.social;