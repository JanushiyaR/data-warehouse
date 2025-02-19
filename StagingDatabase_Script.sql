USE [master]
GO
/****** Object:  Database [AdventureWorks_STG]    Script Date: 2/16/2025 6:33:22 PM ******/
CREATE DATABASE [AdventureWorks_STG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureWorks_STG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorks_STG.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdventureWorks_STG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorks_STG_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AdventureWorks_STG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdventureWorks_STG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdventureWorks_STG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdventureWorks_STG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdventureWorks_STG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AdventureWorks_STG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdventureWorks_STG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET RECOVERY FULL 
GO
ALTER DATABASE [AdventureWorks_STG] SET  MULTI_USER 
GO
ALTER DATABASE [AdventureWorks_STG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdventureWorks_STG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdventureWorks_STG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdventureWorks_STG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdventureWorks_STG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdventureWorks_STG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdventureWorks_STG', N'ON'
GO
ALTER DATABASE [AdventureWorks_STG] SET QUERY_STORE = OFF
GO
USE [AdventureWorks_STG]
GO
/****** Object:  Schema [stg]    Script Date: 2/16/2025 6:33:23 PM ******/
CREATE SCHEMA [stg]
GO
/****** Object:  Table [stg].[Stg_SalesOrderHeader]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_SalesOrderHeader](
	[SalesOrderID] [int] NULL,
	[RevisionNumber] [tinyint] NULL,
	[OrderDate] [date] NULL,
	[DueDate] [date] NULL,
	[ShipDate] [date] NULL,
	[Status] [tinyint] NULL,
	[OnlineOrderFlag] [bit] NULL,
	[SalesOrderNumber] [nvarchar](25) NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[CreditCardID] [int] NULL,
	[SubTotal] [money] NULL,
	[TaxAmt] [money] NULL,
	[Freight] [money] NULL,
	[TotalDue] [money] NULL,
	[Created_Dt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[Stg_SalesOrderDetail]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_SalesOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL,
	[SpecialOfferID] [int] NULL,
	[UnitPrice] [money] NULL,
	[LineTotal] [numeric](38, 6) NULL,
	[Created_Dt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [stg].[vw_Stg_SalesOrders]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- creating view to combinde salesorderdetail and salesorderheader
CREATE VIEW [stg].[vw_Stg_SalesOrders] AS
SELECT 
    h.SalesOrderID,
    h.OrderDate,
    h.CustomerID,
    h.SalesPersonID AS EmployeeID,
    h.TerritoryID,
    d.SalesOrderDetailID,
    d.ProductID,
    d.OrderQty,
    d.UnitPrice,
    d.LineTotal,
    h.Created_Dt AS HeaderCreatedDt,
    d.Created_Dt AS DetailCreatedDt
FROM [AdventureWorks_STG].[stg].[Stg_SalesOrderHeader] h
JOIN [AdventureWorks_STG].[stg].[Stg_SalesOrderDetail] d
    ON h.SalesOrderID = d.SalesOrderID;
GO
/****** Object:  Table [stg].[Stg_SalesForecast]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_SalesForecast](
	[Year] [int] NULL,
	[MonthName] [nvarchar](50) NULL,
	[SalesOrder] [money] NULL,
	[Created_Dt] [datetime] NULL,
	[Created_Dt_Converted] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  View [stg].[vw_SalesForecastWithProduct]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [stg].[vw_SalesForecastWithProduct]
AS
SELECT 
    f.[Year], 
    f.[MonthName], 
    f.[SalesOrder], 
    f.[Created_Dt], 
    f.[Created_Dt_Converted], 
    d.[ProductID]
FROM [AdventureWorks_STG].[stg].[Stg_SalesForecast] AS f
JOIN [AdventureWorks_STG].[stg].[Stg_SalesOrderDetail] AS d
    ON f.SalesOrder = d.SalesOrderID;
GO
/****** Object:  Table [stg].[Stg_Customer]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_Customer](
	[CustomerID] [int] NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[STG_Employee]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[STG_Employee](
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[JobTitle] [nvarchar](100) NULL,
	[HireDate] [datetime] NULL,
	[SalariedFlag] [bit] NULL,
	[VacationHours] [int] NULL,
	[SickLeaveHours] [int] NULL,
	[CurrentFlag] [bit] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[Stg_Person]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_Person](
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[BusinessEntityID] [int] NULL,
	[PersonType] [nvarchar](2) NULL,
	[NameStyle] [bit] NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NULL,
	[AdditionalContactInfo] [nvarchar](max) NULL,
	[Demographics] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [stg].[Stg_Product]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Color] [nvarchar](15) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[Stg_Territory]    Script Date: 2/16/2025 6:33:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Stg_Territory](
	[TerritoryID] [int] NOT NULL,
	[TerritoryName] [nvarchar](50) NULL,
	[CountryCode] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [stg].[Stg_SalesForecast] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [stg].[Stg_SalesOrderDetail] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [stg].[Stg_SalesOrderHeader] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
USE [master]
GO
ALTER DATABASE [AdventureWorks_STG] SET  READ_WRITE 
GO
