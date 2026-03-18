
CREATE DATABASE QuanLyNhaTroSinhVien1;
GO

USE QuanLyNhaTroSinhVien1;
GO

-- Roles
CREATE TABLE Roles (
    roleId INT PRIMARY KEY IDENTITY(1,1),
    roleName VARCHAR(50) NOT NULL
);

INSERT INTO Roles(roleName)
VALUES ('Admin'), ('Staff'), ('Student');
GO

-- Users
CREATE TABLE Users (
    userId INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    roleId INT NOT NULL,
    status BIT DEFAULT 1,
    FOREIGN KEY (roleId) REFERENCES Roles(roleId)
);
GO

-- Rooms
CREATE TABLE Rooms (
    roomId INT PRIMARY KEY IDENTITY(1,1),
    roomCode NVARCHAR(20) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    area FLOAT,
    maxPeople INT,
    status NVARCHAR(30) DEFAULT N'Còn trống'
);
GO

-- Students
CREATE TABLE Students (
    studentId INT PRIMARY KEY IDENTITY(1,1),
    fullName NVARCHAR(100) NOT NULL,
    cccd VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(100),
    school NVARCHAR(100)
);
GO

-- Contracts
CREATE TABLE Contracts (
    contractId INT PRIMARY KEY IDENTITY(1,1),
    roomId INT NOT NULL,
    studentId INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    deposit DECIMAL(12,2),
    status NVARCHAR(30) DEFAULT N'Đang hiệu lực',
    FOREIGN KEY (roomId) REFERENCES Rooms(roomId),
    FOREIGN KEY (studentId) REFERENCES Students(studentId)
);
GO

-- Bills
CREATE TABLE Bills (
    billId INT PRIMARY KEY IDENTITY(1,1),
    contractId INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    totalMoney DECIMAL(12,2),
    status NVARCHAR(30) DEFAULT N'Chưa thanh toán',
    FOREIGN KEY (contractId) REFERENCES Contracts(contractId)
);
GO

-- Insert 20 Rooms (10 empty, 10 occupied)
INSERT INTO Rooms(roomCode, price, area, maxPeople, status) VALUES
(N'P101',1500000,20,2,N'Đã thuê'),
(N'P102',1500000,20,2,N'Đã thuê'),
(N'P103',1500000,20,2,N'Đã thuê'),
(N'P104',1500000,20,2,N'Đã thuê'),
(N'P105',1500000,20,2,N'Đã thuê'),
(N'P106',1600000,22,2,N'Đã thuê'),
(N'P107',1600000,22,2,N'Đã thuê'),
(N'P108',1600000,22,2,N'Đã thuê'),
(N'P109',1700000,25,3,N'Đã thuê'),
(N'P110',1700000,25,3,N'Đã thuê'),
SELECT * FROM Rooms;
(N'P201',1500000,20,2,N'Còn trống'),
(N'P202',1500000,20,2,N'Còn trống'),
(N'P203',1500000,20,2,N'Còn trống'),
(N'P204',1500000,20,2,N'Còn trống'),
(N'P205',1500000,20,2,N'Còn trống'),
(N'P206',1600000,22,2,N'Còn trống'),
(N'P207',1600000,22,2,N'Còn trống'),
(N'P208',1600000,22,2,N'Còn trống'),
(N'P209',1700000,25,3,N'Còn trống'),
(N'P210',1700000,25,3,N'Còn trống');
GO

-- Insert 10 Students
INSERT INTO Students(fullName, cccd, phone, email, school) VALUES
(N'Nguyễn Văn A','001','0900000001','a@gmail.com',N'ĐH Cần Thơ'),
(N'Trần Thị B','002','0900000002','b@gmail.com',N'ĐH Cần Thơ'),
(N'Lê Văn C','003','0900000003','c@gmail.com',N'ĐH FPT'),
(N'Phạm Thị D','004','0900000004','d@gmail.com',N'ĐH FPT'),
(N'Hoàng Văn E','005','0900000005','e@gmail.com',N'ĐH Y Dược'),
(N'Võ Thị F','006','0900000006','f@gmail.com',N'ĐH Y Dược'),
(N'Đặng Văn G','007','0900000007','g@gmail.com',N'ĐH Bách Khoa'),
(N'Bùi Thị H','008','0900000008','h@gmail.com',N'ĐH Bách Khoa'),
(N'Đỗ Văn I','009','0900000009','i@gmail.com',N'ĐH Kinh Tế'),
(N'Ngô Thị K','010','0900000010','k@gmail.com',N'ĐH Kinh Tế');
GO

-- Create Contracts for first 10 rooms
INSERT INTO Contracts(roomId, studentId, startDate, deposit)
VALUES
(1,1,GETDATE(),1000000),
(2,2,GETDATE(),1000000),
(3,3,GETDATE(),1000000),
(4,4,GETDATE(),1000000),
(5,5,GETDATE(),1000000),
(6,6,GETDATE(),1000000),
(7,7,GETDATE(),1000000),
(8,8,GETDATE(),1000000),
(9,9,GETDATE(),1000000),
(10,10,GETDATE(),1000000);
GO

-- Default Admin
INSERT INTO Users(username,password,roleId)
VALUES('admin','123456',1);
GO
