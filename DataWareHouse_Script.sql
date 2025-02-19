USE [master]
GO
/****** Object:  Database [AdventureWorks_DW]    Script Date: 2/16/2025 6:32:39 PM ******/
CREATE DATABASE [AdventureWorks_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureWorks_DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorks_DW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdventureWorks_DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorks_DW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AdventureWorks_DW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdventureWorks_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdventureWorks_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdventureWorks_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdventureWorks_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [AdventureWorks_DW] SET  MULTI_USER 
GO
ALTER DATABASE [AdventureWorks_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdventureWorks_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdventureWorks_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdventureWorks_DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdventureWorks_DW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdventureWorks_DW', N'ON'
GO
ALTER DATABASE [AdventureWorks_DW] SET QUERY_STORE = OFF
GO
USE [AdventureWorks_DW]
GO
/****** Object:  Schema [dw]    Script Date: 2/16/2025 6:32:39 PM ******/
CREATE SCHEMA [dw]
GO
/****** Object:  Table [dw].[DimCustomer]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[AccountNumber] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimDate]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Quarter] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimEmployee]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimProduct]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Color] [nvarchar](15) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Product] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimTerritory]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimTerritory](
	[TerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryName] [nvarchar](50) NULL,
	[CountryCode] [nvarchar](10) NULL,
	[TerritoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[FactSalesForecast]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactSalesForecast](
	[ForecastKey] [int] IDENTITY(1,1) NOT NULL,
	[ForecastDateKey] [int] NULL,
	[ProductKey] [int] NULL,
	[SalesOrder] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ForecastKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[FactSalesOrder]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactSalesOrder](
	[SalesOrderKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderID] [int] NULL,
	[OrderDateKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[ProductKey] [int] NULL,
	[TerritoryKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[OrderQty] [smallint] NULL,
	[LineTotal] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesOrderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dw].[DimProduct] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dw].[DimProduct] ADD  DEFAULT ((1)) FOR [IsCurrent]
GO
ALTER TABLE [dw].[FactSalesForecast]  WITH CHECK ADD FOREIGN KEY([ForecastDateKey])
REFERENCES [dw].[DimDate] ([DateKey])
GO
ALTER TABLE [dw].[FactSalesForecast]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dw].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dw].[FactSalesOrder]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dw].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dw].[FactSalesOrder]  WITH CHECK ADD FOREIGN KEY([EmployeeKey])
REFERENCES [dw].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dw].[FactSalesOrder]  WITH CHECK ADD FOREIGN KEY([OrderDateKey])
REFERENCES [dw].[DimDate] ([DateKey])
GO
ALTER TABLE [dw].[FactSalesOrder]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dw].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dw].[FactSalesOrder]  WITH CHECK ADD FOREIGN KEY([TerritoryKey])
REFERENCES [dw].[DimTerritory] ([TerritoryKey])
GO
/****** Object:  StoredProcedure [dbo].[Refresh_DimProduct]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Refresh_DimProduct] AS
BEGIN
    SET NOCOUNT ON;
    
    MERGE INTO dw.DimProduct AS TARGET
    USING (SELECT * FROM AdventureWorks_STG.stg.Stg_Product) AS SOURCE
    ON TARGET.ProductID = SOURCE.ProductID
    WHEN MATCHED THEN 
        UPDATE SET TARGET.Name = SOURCE.Name,
                   TARGET.ListPrice = SOURCE.ListPrice,
                   TARGET.EndDate = GETDATE(),
                   TARGET.IsCurrent = 0
    WHEN NOT MATCHED THEN 
        INSERT (ProductID, Name, ProductNumber, StandardCost, ListPrice, Color, StartDate, IsCurrent)
        VALUES (SOURCE.ProductID, SOURCE.Name, SOURCE.ProductNumber, SOURCE.StandardCost, SOURCE.ListPrice, SOURCE.Color, GETDATE(), 1);
END;

GO
/****** Object:  StoredProcedure [dbo].[Refresh_DimTerritory]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Load DimTerritory


CREATE PROCEDURE [dbo].[Refresh_DimTerritory] AS
BEGIN
    SET NOCOUNT ON;

    -- Update existing records with missing or outdated details
    UPDATE dw.DimTerritory
    SET TerritoryName = Stg_Territory.TerritoryName,
        CountryCode = Stg_Territory.CountryCode
    FROM dw.DimTerritory
    JOIN AdventureWorks_STG.stg.Stg_Territory 
        ON dw.DimTerritory.TerritoryID = Stg_Territory.TerritoryID
    WHERE (dw.DimTerritory.TerritoryName IS NULL OR dw.DimTerritory.CountryCode IS NULL);

    -- Optional: Insert new TerritoryIDs if they don't exist in DimTerritory
    INSERT INTO dw.DimTerritory (TerritoryID, TerritoryName, CountryCode)
    SELECT Stg_Territory.TerritoryID, Stg_Territory.TerritoryName, Stg_Territory.CountryCode
    FROM AdventureWorks_STG.stg.Stg_Territory
    WHERE NOT EXISTS (
        SELECT 1 FROM dw.DimTerritory WHERE dw.DimTerritory.TerritoryID = Stg_Territory.TerritoryID
    );
END;
GO
/****** Object:  StoredProcedure [dw].[usp_Load_DimCustomer]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dw].[usp_Load_DimCustomer]
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert new records into DimCustomer from AdventureWorks_STG
    INSERT INTO [AdventureWorks_DW].[dw].[DimCustomer] (
        CustomerID,
        FirstName,
        LastName,
        AccountNumber
    )
    SELECT DISTINCT
        c.CustomerID,
        p.FirstName,
        p.LastName,
        c.AccountNumber
    FROM [AdventureWorks_STG].[stg].[Stg_Customer] c
    LEFT JOIN [AdventureWorks_STG].[stg].[Stg_Person] p
        ON c.PersonID = p.BusinessEntityID
    LEFT JOIN [AdventureWorks_DW].[dw].[DimCustomer] d
        ON c.CustomerID = d.CustomerID
    WHERE d.CustomerID IS NULL;

    -- Update existing records if needed
    UPDATE d
    SET d.FirstName = p.FirstName,
        d.LastName = p.LastName,
        d.AccountNumber = c.AccountNumber
    FROM [AdventureWorks_DW].[dw].[DimCustomer] d
    INNER JOIN [AdventureWorks_STG].[stg].[Stg_Customer] c
        ON d.CustomerID = c.CustomerID
    INNER JOIN [AdventureWorks_STG].[stg].[Stg_Person] p
        ON c.PersonID = p.BusinessEntityID;

    PRINT 'DimCustomer load completed successfully.';
END;
GO
/****** Object:  StoredProcedure [dw].[usp_Load_DimDate]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dw].[usp_Load_DimDate]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @startdate DATE = '2005-01-01',
            @enddate DATE = '2014-12-31';

    IF @startdate IS NULL
    BEGIN
        SELECT TOP 1 @startdate = FullDate
        FROM [AdventureWorks_DW].[dw].[DimDate]
        ORDER BY DateKey ASC;
    END

    DECLARE @datelist TABLE (FullDate DATE);

    WHILE @startdate <= @enddate
    BEGIN
        INSERT INTO @datelist (FullDate) VALUES (@startdate);
        SET @startdate = DATEADD(DAY, 1, @startdate);
    END

    INSERT INTO [AdventureWorks_DW].[dw].[DimDate] (
        DateKey,
        FullDate,
        Year,
        Month,
        Day,
        Quarter
    )
    SELECT DISTINCT
        CONVERT(INT, CONVERT(VARCHAR, dl.FullDate, 112)) AS DateKey,
        dl.FullDate AS FullDate,
        YEAR(dl.FullDate) AS Year,
        MONTH(dl.FullDate) AS Month,
        DAY(dl.FullDate) AS Day,
        DATEPART(QUARTER, dl.FullDate) AS Quarter
    FROM @datelist dl
    LEFT JOIN [AdventureWorks_DW].[dw].[DimDate] dd
        ON dl.FullDate = dd.FullDate
    WHERE dd.FullDate IS NULL;

    PRINT 'DimDate load completed successfully.';
END;
GO
/****** Object:  StoredProcedure [dw].[usp_Load_DimEmployee]    Script Date: 2/16/2025 6:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dw].[usp_Load_DimEmployee]
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert new records into DimEmployee
    INSERT INTO [AdventureWorks_DW].[dw].[DimEmployee] (
        EmployeeID,
        FirstName,
        JobTitle
    )
    SELECT DISTINCT
        e.NationalIDNumber AS EmployeeID,
        -- Extract FirstName from LoginID safely
        CASE 
            WHEN CHARINDEX('\', e.LoginID) > 0 
            THEN 
                LEFT(
                    SUBSTRING(e.LoginID, CHARINDEX('\', e.LoginID) + 1, LEN(e.LoginID)), 
                    NULLIF(
                        CHARINDEX('0', SUBSTRING(e.LoginID, CHARINDEX('\', e.LoginID) + 1, LEN(e.LoginID))) - 1, 
                        -1
                    )
                )
            ELSE 
                e.LoginID  -- If no '\', use full LoginID
        END AS FirstName,
        e.JobTitle
    FROM [AdventureWorks_STG].[stg].[STG_Employee] e
    LEFT JOIN [AdventureWorks_DW].[dw].[DimEmployee] d
        ON e.NationalIDNumber = d.EmployeeID
    WHERE d.EmployeeID IS NULL;

    -- Update existing records safely
    UPDATE d
    SET d.FirstName = 
        CASE 
            WHEN CHARINDEX('\', e.LoginID) > 0 
            THEN 
                LEFT(
                    SUBSTRING(e.LoginID, CHARINDEX('\', e.LoginID) + 1, LEN(e.LoginID)), 
                    NULLIF(
                        CHARINDEX('0', SUBSTRING(e.LoginID, CHARINDEX('\', e.LoginID) + 1, LEN(e.LoginID))) - 1, 
                        -1
                    )
                )
            ELSE 
                e.LoginID  -- If no '\', use full LoginID
        END,
        d.JobTitle = e.JobTitle
    FROM [AdventureWorks_DW].[dw].[DimEmployee] d
    INNER JOIN [AdventureWorks_STG].[stg].[STG_Employee] e
        ON d.EmployeeID = e.NationalIDNumber;

    PRINT 'DimEmployee load completed successfully.';
END;
GO
USE [master]
GO
ALTER DATABASE [AdventureWorks_DW] SET  READ_WRITE 
GO
