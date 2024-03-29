USE [master]
GO
/****** Object:  Database [ECSDB]    Script Date: 10/14/2019 2:30:23 PM ******/
CREATE DATABASE [ECSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ECSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ECSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ECSDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECSDB] SET  MULTI_USER 
GO
ALTER DATABASE [ECSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECSDB] SET QUERY_STORE = OFF
GO
USE [ECSDB]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 10/14/2019 2:30:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [varchar](10) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](200) NULL,
	[Status] [bit] NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 10/14/2019 2:30:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Phone] [varchar](10) NULL,
	[Address] [nvarchar](150) NULL,
 CONSTRAINT [PK_Companys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealers]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DealerName] [nvarchar](150) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Dealers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](100) NULL,
	[Password] [nvarchar](250) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](200) NULL,
	[Avatar] [nvarchar](250) NULL,
	[Email] [nvarchar](500) NULL,
	[Phone] [varchar](10) NULL,
	[Status] [bit] NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Service] [nvarchar](50) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderServiceDetails]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderServiceDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[OrderServiceId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_OrderServiceDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderServices]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentLate] [datetime] NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Tax] [decimal](18, 0) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[CompanyId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_OrderServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Code] [varchar](20) NULL,
	[Image] [nvarchar](200) NULL,
	[Price] [decimal](18, 0) NULL,
	[CreateDate] [datetime] NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](50) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 10/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Display] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [FullName], [Email], [Phone], [Gender], [Address], [Status], [CompanyId]) VALUES (1, N'Nguyen Nam ', N'Namm23@gmail.com', N'012345678', 1, N'Da Nang', 1, 1)
INSERT [dbo].[Clients] ([Id], [FullName], [Email], [Phone], [Gender], [Address], [Status], [CompanyId]) VALUES (2, N'Nguyen Minh', N'weqw23@gmai.com', N'012345678', 1, N'Viet Nam', NULL, 3)
INSERT [dbo].[Clients] ([Id], [FullName], [Email], [Phone], [Gender], [Address], [Status], [CompanyId]) VALUES (10, N'Nguyen Linh', N'Linh34@gmail.com', N'0908623621', 1, N'Viet Nam', NULL, 1)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Companys] ON 

INSERT [dbo].[Companys] ([Id], [CompanyName], [Description], [Phone], [Address]) VALUES (1, N'Sony', N'Camera', N'0123456789', N'Viet Nam')
INSERT [dbo].[Companys] ([Id], [CompanyName], [Description], [Phone], [Address]) VALUES (2, N'Canon', N'Camera', N'0907434534', N'Viet Nam')
INSERT [dbo].[Companys] ([Id], [CompanyName], [Description], [Phone], [Address]) VALUES (3, N'Fuij', N'Camera', N'0906347231', N'Viet Nam')
INSERT [dbo].[Companys] ([Id], [CompanyName], [Description], [Phone], [Address]) VALUES (6, N'XML', N'House', N'0123456789', N'Viet Nam')
SET IDENTITY_INSERT [dbo].[Companys] OFF
SET IDENTITY_INSERT [dbo].[Dealers] ON 

INSERT [dbo].[Dealers] ([Id], [DealerName], [Phone], [Email], [Address], [CompanyId]) VALUES (2, N'Anh Duc Digital', N'0123456789', N'weqw@gmai.com', N'Viet Nam', 1)
INSERT [dbo].[Dealers] ([Id], [DealerName], [Phone], [Email], [Address], [CompanyId]) VALUES (3, N'Phan Minh Center', N'0123456789', N'weqwww@gmai.com', N'Viet Nam', 2)
SET IDENTITY_INSERT [dbo].[Dealers] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (1, N'Admin')
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (2, N'Service')
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (3, N'HR')
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (4, N'Auditors')
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (5, N'No')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [LoginName], [Password], [FirstName], [LastName], [Birthday], [Gender], [Address], [Avatar], [Email], [Phone], [Status], [DepartmentId]) VALUES (1, N'Huy', N'e99a18c428cb38d5f260853678922e03', N'Huy', N'Nguyen', CAST(N'2018-03-05T00:00:00.000' AS DateTime), 0, N'Da Nang', N'~/Content/Avatar/IMG_8877.JPG', N'HuyNguyen233@gmail.com', N'0905634623', 1, 1)
INSERT [dbo].[Employees] ([Id], [LoginName], [Password], [FirstName], [LastName], [Birthday], [Gender], [Address], [Avatar], [Email], [Phone], [Status], [DepartmentId]) VALUES (2, N'Minh', N'e99a18c428cb38d5f260853678922e03', N'Minh', N'Nguyen', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, N'Da Nang', N'~/Content/Avatar/IMG_9275.JPG', N'PHuong23@gmail.com', N'0905634623', 1, 2)
INSERT [dbo].[Employees] ([Id], [LoginName], [Password], [FirstName], [LastName], [Birthday], [Gender], [Address], [Avatar], [Email], [Phone], [Status], [DepartmentId]) VALUES (5, N'nhat', N'e99a18c428cb38d5f260853678922e03', N'Nhat', N'Nguyen', NULL, 1, N'Da Nang', N'~/Content/Avatar/IMG_8877.JPG', N'PHuong23@gmail.com', N'0905634623', 0, 3)
INSERT [dbo].[Employees] ([Id], [LoginName], [Password], [FirstName], [LastName], [Birthday], [Gender], [Address], [Avatar], [Email], [Phone], [Status], [DepartmentId]) VALUES (7, N'Loan', N'79cfeb94595de33b3326c06ab1c7dbda', N'Loan', N'Nguyen', NULL, 0, N'Viet Nam', N'~/Content/Avatar/IMG_9167.JPG', N'weqwww@gmai.com', N'0123456789', 1, 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[FeedBacks] ON 

INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (6, N'Minh', N'In-bound Services', N'Minh23@gmail.com', N' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum erat libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque libero,
                pulvinar tincidunt leo consectetur eget.', CAST(N'2019-09-30T11:47:05.637' AS DateTime), 1)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (10, N'Ly', N'In-bound Services', N'Minh23@gmail.com', N' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum erat libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque libero,
                pulvinar tincidunt leo consectetur eget.', CAST(N'2019-09-30T12:00:14.917' AS DateTime), 1)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (11, N'Lan', N'In-bound Services', N'Minh23@gmail.com', N' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum erat libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque libero,
                pulvinar tincidunt leo consectetur eget.', CAST(N'2019-09-30T12:01:03.780' AS DateTime), 1)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (12, N'Linh', N'In-bound Services', N'Minh23@gmail.com', N'abcabcabc', CAST(N'2019-09-30T12:01:22.013' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (13, N'Trang', N'In-bound Services', N'Minh23@gmail.com', N'abcabc', CAST(N'2019-09-30T12:01:40.593' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (14, N'Tinh', N'In-bound Services', N'Minh23@gmail.com', N'abcabcabc', CAST(N'2019-09-30T12:03:25.270' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (15, N'Hoang', N'In-bound Services', N'Minh23@gmail.com', N'abcabc', CAST(N'2019-09-30T12:34:09.233' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (16, N'Lan', N'In-bound Services', N'Minh23@gmail.com', N'abababab', CAST(N'2019-09-30T12:35:36.977' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (17, N'Toan', N'In-bound Services', N'Minh23@gmail.com', N'nguyen', CAST(N'2019-09-30T12:35:58.950' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (18, N'Minh', N'In-bound Services', N'Minh23@gmail.com', N'abcabc', CAST(N'2019-09-30T12:36:16.550' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (27, N'mi', N'In-bound Services', N'Minh23@gmail.com', N'abc abc ', CAST(N'2019-10-05T15:56:36.783' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (28, N'Nam Phuong', N'In-bound Services', N'nlnPhuong23@gmail.com', N'Good!!!', CAST(N'2019-10-05T16:00:49.220' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (29, N'Vi', N'In-bound Services', N'nlnPhuong23@gmail.com', N'Very Good !!!', CAST(N'2019-10-05T16:03:20.223' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (30, N'Quang', N'In-bound Services', N'nguyendangminh236@gmail.com', N' ok !!!!', CAST(N'2019-10-05T16:58:44.673' AS DateTime), NULL)
INSERT [dbo].[FeedBacks] ([Id], [FullName], [Service], [Email], [Content], [CreateDate], [Status]) VALUES (31, N'Rin', N'In-bound Services', N'nlnPhuong23@gmail.com', N' Good Good !!!', CAST(N'2019-10-06T10:17:08.863' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FeedBacks] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (1, N'Client Care Outsourcing', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-28T13:01:24.280' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (2, N'In-Boud Service', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-28T13:01:33.950' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (3, N'Out-Boud Service', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-28T14:19:35.523' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (4, N'Client Care Outsourcing', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-28T14:19:47.483' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (5, N'Client Care Outsourcing', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-28T14:49:38.307' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (6, N'Out-Boud Service', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-30T12:28:53.530' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (7, N'In-Boud Service', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-30T12:29:14.930' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (8, N'Telephone', N'There are many variations of passages of Lorem Ipsum available, but the majority', CAST(N'2019-09-30T12:29:36.150' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (9, N'In-Boud Service', N'There are many variations of passages of Lorem Ipsum available', CAST(N'2019-09-30T12:52:08.910' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (10, N'Services', N'abcdef', CAST(N'2019-09-30T12:41:31.153' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedDate]) VALUES (11, N'abcd', N'bacderadasd daskjgfhadkjhf', CAST(N'2019-10-01T10:29:09.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[OrderServiceDetails] ON 

INSERT [dbo].[OrderServiceDetails] ([Id], [Price], [Quantity], [OrderServiceId], [ServiceId], [Status]) VALUES (1, CAST(5000 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), 2, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderServiceDetails] OFF
SET IDENTITY_INSERT [dbo].[OrderServices] ON 

INSERT [dbo].[OrderServices] ([Id], [Code], [PaymentDate], [PaymentLate], [TotalPrice], [Tax], [Description], [Status], [CompanyId], [EmployeeId]) VALUES (2, N'A1', CAST(N'2019-01-08T00:00:00.000' AS DateTime), CAST(N'2019-03-21T00:00:00.000' AS DateTime), CAST(5000 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), N'abc', 1, 1, 1)
INSERT [dbo].[OrderServices] ([Id], [Code], [PaymentDate], [PaymentLate], [TotalPrice], [Tax], [Description], [Status], [CompanyId], [EmployeeId]) VALUES (3, N'A2', CAST(N'2017-01-09T00:00:00.000' AS DateTime), CAST(N'2019-10-24T00:00:00.000' AS DateTime), CAST(4000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), N'Camera', 1, 2, 2)
SET IDENTITY_INSERT [dbo].[OrderServices] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [Code], [Image], [Price], [CreateDate], [Description], [Status], [ClientId]) VALUES (7, N'Sony6400', N'Sn64', N'~/Content/Products/IMG_9167.JPG', CAST(700 AS Decimal(18, 0)), CAST(N'2019-10-12T18:41:29.173' AS DateTime), N'abc', 0, 2)
INSERT [dbo].[Products] ([Id], [ProductName], [Code], [Image], [Price], [CreateDate], [Description], [Status], [ClientId]) VALUES (20, N'Sony6300', N'A2', N'~/Content/Products/IMG_9167.JPG', CAST(5000 AS Decimal(18, 0)), CAST(N'2019-09-26T14:25:41.503' AS DateTime), N'Camera', 0, 1)
INSERT [dbo].[Products] ([Id], [ProductName], [Code], [Image], [Price], [CreateDate], [Description], [Status], [ClientId]) VALUES (24, N'Sony6500', N'A2', N'wallpaper-4k-hinh-nen-4k-khung-canh-thien-nhien-ven-bien-dep_100009580.jpg', CAST(5000 AS Decimal(18, 0)), CAST(N'2019-10-12T18:41:35.023' AS DateTime), N'Camera', 0, 10)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [ServiceName], [Image], [Content], [Price], [Status]) VALUES (1, N'In-bound Services', N'default.jpg', N'<p>a</p>
', CAST(20000 AS Decimal(18, 0)), 0)
INSERT [dbo].[Services] ([Id], [ServiceName], [Image], [Content], [Price], [Status]) VALUES (4, N'Out-bound Services', N'default.jpg', N'', CAST(50000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Services] ([Id], [ServiceName], [Image], [Content], [Price], [Status]) VALUES (5, N'Tele Marketing Services', N'default.jpg', N'', CAST(60000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Services] OFF
/****** Object:  Index [IX_FK_Clients_Companys]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Clients_Companys] ON [dbo].[Clients]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Dealers_Companys]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Dealers_Companys] ON [dbo].[Dealers]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Employees_Departments]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Employees_Departments] ON [dbo].[Employees]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderServiceDetail_OrderServices]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderServiceDetail_OrderServices] ON [dbo].[OrderServiceDetails]
(
	[OrderServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderServiceDetail_Services]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderServiceDetail_Services] ON [dbo].[OrderServiceDetails]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderServices_Companys]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderServices_Companys] ON [dbo].[OrderServices]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderServices_Employees]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderServices_Employees] ON [dbo].[OrderServices]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Clients]    Script Date: 10/14/2019 2:30:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Clients] ON [dbo].[Products]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ('default.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Companys] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companys] ([Id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Companys]
GO
ALTER TABLE [dbo].[Dealers]  WITH CHECK ADD  CONSTRAINT [FK_Dealers_Companys] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companys] ([Id])
GO
ALTER TABLE [dbo].[Dealers] CHECK CONSTRAINT [FK_Dealers_Companys]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[OrderServiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderServiceDetail_OrderServices] FOREIGN KEY([OrderServiceId])
REFERENCES [dbo].[OrderServices] ([Id])
GO
ALTER TABLE [dbo].[OrderServiceDetails] CHECK CONSTRAINT [FK_OrderServiceDetail_OrderServices]
GO
ALTER TABLE [dbo].[OrderServiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderServiceDetail_Services] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[OrderServiceDetails] CHECK CONSTRAINT [FK_OrderServiceDetail_Services]
GO
ALTER TABLE [dbo].[OrderServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderServices_Companys] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companys] ([Id])
GO
ALTER TABLE [dbo].[OrderServices] CHECK CONSTRAINT [FK_OrderServices_Companys]
GO
ALTER TABLE [dbo].[OrderServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderServices_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[OrderServices] CHECK CONSTRAINT [FK_OrderServices_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Clients]
GO
USE [master]
GO
ALTER DATABASE [ECSDB] SET  READ_WRITE 
GO
