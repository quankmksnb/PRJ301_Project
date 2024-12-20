USE [master]
GO
/****** Object:  Database [demo_ass]    Script Date: 10/30/2024 9:04:21 AM ******/
CREATE DATABASE [demo_ass]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demo_ass', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\demo_ass.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demo_ass_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\demo_ass_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [demo_ass] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demo_ass].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demo_ass] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demo_ass] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demo_ass] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demo_ass] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demo_ass] SET ARITHABORT OFF 
GO
ALTER DATABASE [demo_ass] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [demo_ass] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demo_ass] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demo_ass] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demo_ass] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demo_ass] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demo_ass] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demo_ass] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demo_ass] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demo_ass] SET  ENABLE_BROKER 
GO
ALTER DATABASE [demo_ass] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demo_ass] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demo_ass] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demo_ass] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demo_ass] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demo_ass] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demo_ass] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demo_ass] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [demo_ass] SET  MULTI_USER 
GO
ALTER DATABASE [demo_ass] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demo_ass] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demo_ass] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demo_ass] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demo_ass] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demo_ass] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [demo_ass] SET QUERY_STORE = ON
GO
ALTER DATABASE [demo_ass] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [demo_ass]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] NOT NULL,
	[wsid] [int] NULL,
	[quantity] [int] NULL,
	[alpha] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] NOT NULL,
	[dname] [nvarchar](100) NULL,
	[dtype] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [nvarchar](50) NOT NULL,
	[ename] [nvarchar](100) NULL,
	[salaryLevel] [nvarchar](10) NULL,
	[did] [int] NULL,
	[createdby] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[featureId] [int] NOT NULL,
	[featureName] [nvarchar](100) NOT NULL,
	[url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[plid] [int] IDENTITY(1,1) NOT NULL,
	[startd] [date] NULL,
	[endd] [date] NULL,
	[did] [int] NULL,
 CONSTRAINT [PK__Plan__40E443F29610D727] PRIMARY KEY CLUSTERED 
(
	[plid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanCampaign]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanCampaign](
	[canid] [int] IDENTITY(1,1) NOT NULL,
	[plid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[estimatedeffort] [float] NULL,
 CONSTRAINT [PK__PlanCamp__1531FCEA444ECCE1] PRIMARY KEY CLUSTERED 
(
	[canid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] NOT NULL,
	[pname] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[roleId] [int] NOT NULL,
	[featureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC,
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleCampaign]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleCampaign](
	[scid] [int] NOT NULL,
	[canid] [int] NULL,
	[date] [date] NULL,
	[shift] [nvarchar](10) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[scid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[displayName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Employee]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Employee](
	[username] [nvarchar](50) NOT NULL,
	[eid] [nvarchar](50) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_User_Employee] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[username] [nvarchar](50) NOT NULL,
	[roleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerSchedule]    Script Date: 10/30/2024 9:04:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerSchedule](
	[wsid] [int] NOT NULL,
	[scid] [int] NULL,
	[eid] [nvarchar](50) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[wsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (1, 1, 53, 0.95)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (2, 2, 82, 1.05)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (3, 3, 76, 0.98)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (4, 1, 57, 1.02)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (5, 2, 71, 0.91)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (6, 3, 75, 0.96)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (7, 1, 55, 0.99)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (8, 2, 79, 1.01)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (9, 3, 73, 0.94)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (10, 1, 60, 1.07)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (11, 2, 85, 1.09)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (12, 3, 83, 1.07)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (13, 1, 54, 0.97)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (14, 2, 80, 1.03)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (15, 3, 76, 0.98)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (16, 4, 52, 0.93)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (17, 5, 80, 1.02)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (18, 6, 77, 0.99)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (19, 4, 56, 1)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (20, 5, 75, 0.96)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (21, 6, 70, 0.9)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (22, 4, 58, 1.04)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (23, 5, 81, 1.04)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (24, 6, 72, 0.92)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (25, 4, 59, 1.05)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (26, 5, 82, 1.05)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (27, 6, 79, 1.01)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (28, 4, 53, 0.95)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (29, 5, 74, 0.95)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (30, 6, 75, 0.96)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (31, 7, 54, 0.97)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (32, 8, 77, 0.99)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (33, 9, 74, 0.95)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (34, 7, 57, 1.02)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (35, 8, 70, 0.9)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (36, 9, 75, 0.96)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (37, 7, 55, 0.99)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (38, 8, 80, 1.03)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (39, 9, 73, 0.94)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (40, 7, 61, 1.09)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (41, 8, 79, 1.01)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (42, 9, 81, 1.04)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (43, 7, 56, 1)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (44, 8, 75, 0.96)
INSERT [dbo].[Attendance] ([aid], [wsid], [quantity], [alpha]) VALUES (45, 9, 78, 1)
GO
INSERT [dbo].[Department] ([did], [dname], [dtype]) VALUES (1, N'Phòng Quản Lý Sản Xuất', N'houseoffice')
INSERT [dbo].[Department] ([did], [dname], [dtype]) VALUES (2, N'Phòng Quản Lý Công Nhân', N'houseoffice')
INSERT [dbo].[Department] ([did], [dname], [dtype]) VALUES (3, N'Phòng Sản Xuất 1', N'workshop')
INSERT [dbo].[Department] ([did], [dname], [dtype]) VALUES (4, N'Phòng Sản Xuất 2', N'workshop')
GO
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN001', N'Nguyễn Văn A', N'F1', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN002', N'Trần Thế B', N'F2', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN003', N'Lê Văn C', N'F3', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN004', N'Phạm Minh D', N'F1', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN005', N'Đặng Thị E', N'F2', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN006', N'Bùi Văn F', N'F3', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN007', N'Nguyễn Thị G', N'F1', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN008', N'Vũ Văn H', N'F2', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN009', N'Hoàng Thị I', N'F3', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN010', N'Phan Văn J', N'F1', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN011', N'Trần Văn K', N'F2', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN012', N'Lê Thị L', N'F3', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN013', N'Nguyễn Minh M', N'F1', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN014', N'Đinh Văn N', N'F2', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'CN015', N'Nguyễn Thị O', N'F3', 3, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'G001', N'Nguyễn Văn A', N'F6', 1, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'QD001', N'Lê Quản Đốc', N'F5', 2, N'giamdoc')
INSERT [dbo].[Employee] ([eid], [ename], [salaryLevel], [did], [createdby]) VALUES (N'TP001', N'Nguyễn Trưởng Phòng', N'F4', 1, N'giamdoc')
GO
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (1, N'Add new product', N'/products/create')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (2, N'Edit product details', N'/products/edit')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (3, N'Delete product', N'/products/delete')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (4, N'View product list', N'/products/list')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (5, N'Add new employee', N'/employees/create')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (6, N'Edit employee details', N'/employees/edit')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (7, N'Delete employee', N'/employees/delete')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (8, N'View employee list', N'/employees/list')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (9, N'Create new production plan', N'/plans/create')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (10, N'Edit production plan', N'/plans/edit')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (11, N'View production plan details', N'/plans/view')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (12, N'Delete production plan', N'/plans/delete')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (13, N'View all reports', N'/reports/view')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (14, N'View department-specific reports', N'/reports/department')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (15, N'View attendance records', N'/attendance/view')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (16, N'Record attendance', N'/attendance/record')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (17, N'View department attendance', N'/attendance/department')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (18, N'Generate salary report', N'/salary/generate')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (19, N'View salary report', N'/salary/view')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (20, N'Generate department salary', N'/salary/department')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (21, N'Assign production tasks', N'/plans/execute')
INSERT [dbo].[Feature] ([featureId], [featureName], [url]) VALUES (22, N'Track daily production output', N'/production/daily')
GO
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([plid], [startd], [endd], [did]) VALUES (1, CAST(N'2024-10-01' AS Date), CAST(N'2024-10-31' AS Date), 3)
INSERT [dbo].[Plan] ([plid], [startd], [endd], [did]) VALUES (2, CAST(N'2024-11-01' AS Date), CAST(N'2024-11-30' AS Date), 3)
INSERT [dbo].[Plan] ([plid], [startd], [endd], [did]) VALUES (3, CAST(N'2024-10-17' AS Date), CAST(N'2024-10-19' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Plan] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanCampaign] ON 

INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (1, 1, 1, 5000, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (2, 1, 2, 7000, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (3, 1, 3, 7000, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (4, 2, 1, 5000, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (5, 2, 2, 7000, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (6, 2, 3, 7000, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (7, 3, 1, 10, 1)
INSERT [dbo].[PlanCampaign] ([canid], [plid], [pid], [quantity], [estimatedeffort]) VALUES (8, 3, 2, 20, 2)
SET IDENTITY_INSERT [dbo].[PlanCampaign] OFF
GO
INSERT [dbo].[Product] ([pid], [pname]) VALUES (1, N'Giỏ')
INSERT [dbo].[Product] ([pid], [pname]) VALUES (2, N'Thúng')
INSERT [dbo].[Product] ([pid], [pname]) VALUES (3, N'Mẹt')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'Giám Đốc')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Trưởng Phòng')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'Quản Đốc')
GO
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 3)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 4)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 5)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 6)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 7)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 8)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 9)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 10)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 11)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 12)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 13)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 15)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 18)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 19)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 20)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 21)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (1, 22)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 4)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 6)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 8)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 11)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 14)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 17)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (2, 20)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 4)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 6)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 8)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 11)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 15)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 16)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 19)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 21)
INSERT [dbo].[RoleFeature] ([roleId], [featureId]) VALUES (3, 22)
GO
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (1, 1, CAST(N'2024-10-01' AS Date), N'K1', 168)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (2, 2, CAST(N'2024-10-01' AS Date), N'K1', 234)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (3, 3, CAST(N'2024-10-01' AS Date), N'K1', 234)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (4, 1, CAST(N'2024-10-02' AS Date), N'K1', 168)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (5, 2, CAST(N'2024-10-02' AS Date), N'K1', 234)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (6, 3, CAST(N'2024-10-02' AS Date), N'K1', 234)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (7, 1, CAST(N'2024-10-03' AS Date), N'K1', 168)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (8, 2, CAST(N'2024-10-03' AS Date), N'K1', 234)
INSERT [dbo].[ScheduleCampaign] ([scid], [canid], [date], [shift], [quantity]) VALUES (9, 3, CAST(N'2024-10-03' AS Date), N'K1', 234)
GO
INSERT [dbo].[User] ([username], [password], [displayName]) VALUES (N'giamdoc', N'password123', N'Giám Đốc')
INSERT [dbo].[User] ([username], [password], [displayName]) VALUES (N'quandoc', N'password789', N'Quản Đốc')
INSERT [dbo].[User] ([username], [password], [displayName]) VALUES (N'truongphong', N'password456', N'Trưởng Phòng')
GO
INSERT [dbo].[UserRole] ([username], [roleId]) VALUES (N'giamdoc', 1)
INSERT [dbo].[UserRole] ([username], [roleId]) VALUES (N'quandoc', 3)
INSERT [dbo].[UserRole] ([username], [roleId]) VALUES (N'truongphong', 2)
GO
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (1, 7, N'CN001', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (2, 8, N'CN002', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (3, 9, N'CN003', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (4, 7, N'CN004', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (5, 8, N'CN005', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (6, 9, N'CN006', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (7, 7, N'CN007', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (8, 8, N'CN008', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (9, 9, N'CN009', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (10, 7, N'CN010', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (11, 8, N'CN011', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (12, 9, N'CN012', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (13, 7, N'CN013', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (14, 8, N'CN014', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (15, 9, N'CN015', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (16, 4, N'CN001', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (17, 5, N'CN002', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (18, 6, N'CN003', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (19, 4, N'CN004', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (20, 5, N'CN005', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (21, 6, N'CN006', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (22, 4, N'CN007', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (23, 5, N'CN008', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (24, 6, N'CN009', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (25, 4, N'CN010', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (26, 5, N'CN011', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (27, 6, N'CN012', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (28, 4, N'CN013', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (29, 5, N'CN014', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (30, 6, N'CN015', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (31, 1, N'CN001', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (32, 2, N'CN002', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (33, 3, N'CN003', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (34, 1, N'CN004', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (35, 2, N'CN005', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (36, 3, N'CN006', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (37, 1, N'CN007', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (38, 2, N'CN008', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (39, 3, N'CN009', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (40, 1, N'CN010', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (41, 2, N'CN011', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (42, 3, N'CN012', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (43, 1, N'CN013', 56)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (44, 2, N'CN014', 78)
INSERT [dbo].[WorkerSchedule] ([wsid], [scid], [eid], [quantity]) VALUES (45, 3, N'CN015', 78)
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([wsid])
REFERENCES [dbo].[WorkerSchedule] ([wsid])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([createdby])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK__Plan__did__5165187F] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK__Plan__did__5165187F]
GO
ALTER TABLE [dbo].[PlanCampaign]  WITH CHECK ADD  CONSTRAINT [FK__PlanCampai__plid__52593CB8] FOREIGN KEY([plid])
REFERENCES [dbo].[Plan] ([plid])
GO
ALTER TABLE [dbo].[PlanCampaign] CHECK CONSTRAINT [FK__PlanCampai__plid__52593CB8]
GO
ALTER TABLE [dbo].[PlanCampaign]  WITH CHECK ADD  CONSTRAINT [FK__PlanCampaig__pid__534D60F1] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[PlanCampaign] CHECK CONSTRAINT [FK__PlanCampaig__pid__534D60F1]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD FOREIGN KEY([featureId])
REFERENCES [dbo].[Feature] ([featureId])
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[ScheduleCampaign]  WITH CHECK ADD  CONSTRAINT [FK__ScheduleC__canid__5629CD9C] FOREIGN KEY([canid])
REFERENCES [dbo].[PlanCampaign] ([canid])
GO
ALTER TABLE [dbo].[ScheduleCampaign] CHECK CONSTRAINT [FK__ScheduleC__canid__5629CD9C]
GO
ALTER TABLE [dbo].[User_Employee]  WITH CHECK ADD  CONSTRAINT [FK_User_Employee_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[User_Employee] CHECK CONSTRAINT [FK_User_Employee_Employee]
GO
ALTER TABLE [dbo].[User_Employee]  WITH CHECK ADD  CONSTRAINT [FK_User_Employee_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[User_Employee] CHECK CONSTRAINT [FK_User_Employee_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[WorkerSchedule]  WITH CHECK ADD FOREIGN KEY([scid])
REFERENCES [dbo].[ScheduleCampaign] ([scid])
GO
ALTER TABLE [dbo].[WorkerSchedule]  WITH CHECK ADD FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
USE [master]
GO
ALTER DATABASE [demo_ass] SET  READ_WRITE 
GO
