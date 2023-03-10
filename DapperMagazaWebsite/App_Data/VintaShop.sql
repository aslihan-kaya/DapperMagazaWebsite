USE [master]
GO
/****** Object:  Database [VintaShop]    Script Date: 1.01.2023 02:38:35 ******/
CREATE DATABASE [VintaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VintaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VintaShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VintaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VintaShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VintaShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VintaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VintaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VintaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VintaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VintaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VintaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [VintaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VintaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VintaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VintaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VintaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VintaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VintaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VintaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VintaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VintaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VintaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VintaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VintaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VintaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VintaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VintaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VintaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VintaShop] SET RECOVERY FULL 
GO
ALTER DATABASE [VintaShop] SET  MULTI_USER 
GO
ALTER DATABASE [VintaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VintaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VintaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VintaShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VintaShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VintaShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VintaShop', N'ON'
GO
ALTER DATABASE [VintaShop] SET QUERY_STORE = OFF
GO
USE [VintaShop]
GO
/****** Object:  Table [dbo].[AdminInformation]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminInformation](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](50) NULL,
	[AdminPassword] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CargoTracking]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoTracking](
	[CargoID] [int] IDENTITY(1,1) NOT NULL,
	[CargoCompany] [varchar](50) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_CargoTracking] PRIMARY KEY CLUSTERED 
(
	[CargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCardInformation]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCardInformation](
	[CreditCardID] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [varchar](50) NULL,
	[CardNumber] [int] NULL,
	[CValidTHRU] [int] NULL,
	[CSecurityCode] [nchar](4) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_CreditCardInformation] PRIMARY KEY CLUSTERED 
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderInformation]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInformation](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[BuyerName] [varchar](50) NULL,
	[BuyerPhone] [varchar](50) NULL,
	[BuyerMail] [varchar](50) NULL,
	[PermentType] [varchar](50) NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_OrderInformation] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInformation]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInformation](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [varchar](50) NULL,
	[ProductName] [varchar](50) NULL,
	[PBarcodeNumber] [int] NULL,
	[PBrand] [varchar](50) NULL,
	[POrigin] [varchar](50) NULL,
	[PPrice] [money] NULL,
 CONSTRAINT [PK_ProductInformation] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UPhone] [varchar](50) NULL,
	[UMail] [varchar](50) NULL,
	[UPassword] [nchar](20) NULL,
	[UAddress] [varchar](50) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CargoTracking]  WITH CHECK ADD  CONSTRAINT [FK_CargoTracking_OrderInformation] FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderInformation] ([OrderID])
GO
ALTER TABLE [dbo].[CargoTracking] CHECK CONSTRAINT [FK_CargoTracking_OrderInformation]
GO
ALTER TABLE [dbo].[CreditCardInformation]  WITH CHECK ADD  CONSTRAINT [FK_CreditCardInformation_UserInformation] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInformation] ([UserID])
GO
ALTER TABLE [dbo].[CreditCardInformation] CHECK CONSTRAINT [FK_CreditCardInformation_UserInformation]
GO
ALTER TABLE [dbo].[OrderInformation]  WITH CHECK ADD  CONSTRAINT [FK_OrderInformation_ProductInformation] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductInformation] ([ProductID])
GO
ALTER TABLE [dbo].[OrderInformation] CHECK CONSTRAINT [FK_OrderInformation_ProductInformation]
GO
/****** Object:  StoredProcedure [dbo].[AdminEY]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AdminEY]
@AdminID int,
@AdminName varchar(50),
@AdminPassword nchar(20)
as begin 
IF @AdminID=0
insert into AdminInformation
(AdminName,AdminPassword) values
(@AdminName,@AdminPassword)
else
update AdminInformation set
AdminName=@AdminName,AdminPassword=@AdminPassword WHERE AdminID=@AdminID
end
GO
/****** Object:  StoredProcedure [dbo].[AdminListele]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AdminListele]
as begin
select* from AdminInformation
end
GO
/****** Object:  StoredProcedure [dbo].[AdminSirala]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AdminSirala]
@AdminID int
as begin
select*from AdminInformation where
AdminID=@AdminID
end 
GO
/****** Object:  StoredProcedure [dbo].[ASil]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ASil]
@AdminID int
as begin
delete from AdminInformation where
AdminID=@AdminID
end
GO
/****** Object:  StoredProcedure [dbo].[UserEY]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserEY]
@UserID int,
@UserName varchar(50),
@UPhone varchar(50),
@UMail varchar(50),
@UPassword nchar(20),
@UAddress varchar(50)
as begin 
IF @UserID=0
insert into UserInformation
(UserName,UPhone,UMail,UPassword,UAddress) values
(@UserName,@UPhone,@UMail,@UPassword,@UAddress)
else
update UserInformation set
UserName=@UserName,UPhone=@UPhone,UMail=@UMail,UPassword=UPassword,UAddress=@UAddress WHERE UserID=@UserID
end
GO
/****** Object:  StoredProcedure [dbo].[UserListele]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserListele]
as begin
select* from UserInformation
end
GO
/****** Object:  StoredProcedure [dbo].[UserSirala]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserSirala]
@UserID int
as begin
select*from UserInformation where
UserID=@UserID
end 
GO
/****** Object:  StoredProcedure [dbo].[USil]    Script Date: 1.01.2023 02:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USil]
@UserID int
as begin
delete from UserInformation where
UserID=@UserID
end
GO
USE [master]
GO
ALTER DATABASE [VintaShop] SET  READ_WRITE 
GO
