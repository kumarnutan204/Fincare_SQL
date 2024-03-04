USE [master]
GO
/****** Object:  Database [employeeDB]    Script Date: 04-03-2024 17:49:03 ******/
CREATE DATABASE [employeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'employeeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\employeeDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'employeeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\employeeDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [employeeDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [employeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [employeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [employeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [employeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [employeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [employeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [employeeDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [employeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [employeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [employeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [employeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [employeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [employeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [employeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [employeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [employeeDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [employeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [employeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [employeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [employeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [employeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [employeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [employeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [employeeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [employeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [employeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [employeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [employeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [employeeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [employeeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [employeeDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [employeeDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [employeeDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [employeeDB]
GO
/****** Object:  Table [dbo].[department]    Script Date: 04-03-2024 17:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[deptId] [int] NULL,
	[deptName] [varchar](50) NULL,
	[deptLocation] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_info]    Script Date: 04-03-2024 17:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_info](
	[empId] [int] NOT NULL,
	[empName] [varchar](50) NOT NULL,
	[empSalary] [decimal](10, 2) NOT NULL,
	[job] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[deptID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_login]    Script Date: 04-03-2024 17:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_login](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_log_loyalty]    Script Date: 04-03-2024 17:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_log_loyalty](
	[id] [varchar](max) NULL,
	[user_id] [int] NULL,
	[loyalty_id] [int] NULL,
	[bill_number] [varchar](max) NULL,
	[modified_bill_number] [varchar](max) NULL,
	[txn_date] [date] NULL,
	[txn_time] [time](7) NULL,
	[store_id] [int] NULL,
	[amount] [float] NULL,
	[discount] [float] NULL,
	[tax_amount] [varchar](max) NULL,
	[points_collected] [varchar](max) NULL,
	[points_spent] [tinyint] NULL,
	[points_used] [varchar](max) NULL,
	[points_available] [varchar](max) NULL,
	[points_lapsed] [varchar](max) NULL,
	[bill_outlier_status] [varchar](max) NULL,
	[is_migrated] [tinyint] NULL,
	[visit_rank] [tinyint] NULL,
	[insertion_date] [date] NULL,
	[insertion_time] [date] NULL,
	[modified_date] [varchar](max) NULL,
	[modified_time] [varchar](max) NULL,
	[created_by] [varchar](max) NULL,
	[modified_by] [varchar](max) NULL,
	[days_since_last_visit] [smallint] NULL,
	[id2] [int] NULL,
	[store_code] [varchar](max) NULL,
	[store_name] [varchar](max) NULL,
	[zone] [varchar](max) NULL,
	[brand] [varchar](max) NULL,
	[concept] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[state] [varchar](max) NULL,
	[city] [varchar](max) NULL,
	[Pin] [int] NULL,
	[manager] [varchar](max) NULL,
	[contact_no] [varchar](max) NULL,
	[store_type] [varchar](max) NULL,
	[is_active] [tinyint] NULL,
	[opening_date] [varchar](max) NULL,
	[closing_date] [varchar](max) NULL,
	[region] [varchar](max) NULL,
	[insertiondate] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_log_loyalty_lineitem]    Script Date: 04-03-2024 17:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_log_loyalty_lineitem](
	[id] [varchar](max) NULL,
	[product_hierarchy_id] [varchar](max) NULL,
	[loyalty_txn_id] [int] NULL,
	[user_id] [int] NULL,
	[loyalty_id] [int] NULL,
	[bill_date] [date] NULL,
	[store_id] [int] NULL,
	[item_code] [varchar](max) NULL,
	[extended_field_id] [varchar](max) NULL,
	[item_description] [varchar](max) NULL,
	[item_rate] [float] NULL,
	[qty] [tinyint] NULL,
	[discount] [float] NULL,
	[net_amount] [float] NULL,
	[line_outlier_status] [varchar](max) NULL,
	[insertion_date] [date] NULL,
	[insertion_time] [date] NULL,
	[modified_date] [varchar](max) NULL,
	[modified_time] [varchar](max) NULL,
	[created_by] [varchar](max) NULL,
	[modified_by] [varchar](max) NULL,
	[id2] [int] NULL,
	[store_code] [varchar](max) NULL,
	[store_name] [varchar](max) NULL,
	[zone] [varchar](max) NULL,
	[brand] [varchar](max) NULL,
	[concept] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[state] [varchar](max) NULL,
	[city] [varchar](max) NULL,
	[Pin] [varchar](max) NULL,
	[manager] [varchar](max) NULL,
	[contact_no] [varchar](max) NULL,
	[store_type] [varchar](max) NULL,
	[is_active] [tinyint] NULL,
	[opening_date] [varchar](max) NULL,
	[closing_date] [varchar](max) NULL,
	[region] [varchar](max) NULL,
	[insertiondate] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [employeeDB] SET  READ_WRITE 
GO
