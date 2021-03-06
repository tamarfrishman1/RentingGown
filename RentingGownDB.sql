USE [master]
GO
/****** Object:  Database [RentingGown]    Script Date: 26/08/18 17:19:30 ******/
CREATE DATABASE [RentingGown] ON  PRIMARY 
( NAME = N'RentingGown', FILENAME = N'D:\SQL-DATA\RentingGown.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RentingGown_log', FILENAME = N'D:\SQL-DATA\RentingGown_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RentingGown] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentingGown].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentingGown] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentingGown] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentingGown] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentingGown] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentingGown] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentingGown] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentingGown] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentingGown] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentingGown] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentingGown] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentingGown] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentingGown] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentingGown] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentingGown] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentingGown] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentingGown] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentingGown] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentingGown] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentingGown] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentingGown] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentingGown] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentingGown] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentingGown] SET RECOVERY FULL 
GO
ALTER DATABASE [RentingGown] SET  MULTI_USER 
GO
ALTER DATABASE [RentingGown] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentingGown] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentingGown', N'ON'
GO
USE [RentingGown]
GO
/****** Object:  User [students\hitmachut]    Script Date: 26/08/18 17:19:30 ******/
CREATE USER [students\hitmachut] FOR LOGIN [STUDENTS\hitmachut] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_datareader] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [students\hitmachut]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[area] [nvarchar](50) NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catgories]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catgories](
	[id_catgory] [int] IDENTITY(1,1) NOT NULL,
	[catgory] [nvarchar](50) NULL,
 CONSTRAINT [PK_Catgories] PRIMARY KEY CLUSTERED 
(
	[id_catgory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[id_color] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[id_color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gowns]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gowns](
	[id_gown] [int] IDENTITY(1,1) NOT NULL,
	[id_renter] [int] NULL,
	[id_catgory] [int] NULL,
	[picture] [nvarchar](100) NULL,
	[id_season] [int] NULL,
	[is_long] [bit] NULL,
	[price] [int] NULL,
	[is_light] [bit] NULL,
	[color] [int] NULL,
	[id_set] [int] NULL,
	[is_available] [bit] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK_Gowns] PRIMARY KEY CLUSTERED 
(
	[id_gown] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renters]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renters](
	[id_renter] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[cellphone] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[id_area] [int] NULL,
	[password] [int] NULL,
 CONSTRAINT [PK_Renters] PRIMARY KEY CLUSTERED 
(
	[id_renter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[id_season] [int] IDENTITY(1,1) NOT NULL,
	[season] [nvarchar](50) NULL,
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[id_season] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sets]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sets](
	[id_set] [int] IDENTITY(1,1) NOT NULL,
	[num_of_set] [int] NULL,
	[picture] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Sets] PRIMARY KEY CLUSTERED 
(
	[id_set] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[id_tenant] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[cellphone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[id_area] [int] NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[id_tenant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants-sets]    Script Date: 26/08/18 17:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants-sets](
	[id_tenant] [int] NOT NULL,
	[id_gown] [int] NOT NULL,
	[payment] [int] NULL,
	[date] [date] NOT NULL,
	[is_payed] [bit] NULL,
	[is_returned] [bit] NULL,
 CONSTRAINT [PK_Tenants-sets] PRIMARY KEY CLUSTERED 
(
	[id_tenant] ASC,
	[id_gown] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 
GO
INSERT [dbo].[Areas] ([id_area], [area]) VALUES (1, N'צפון')
GO
INSERT [dbo].[Areas] ([id_area], [area]) VALUES (2, N'דרום')
GO
INSERT [dbo].[Areas] ([id_area], [area]) VALUES (3, N'מרכז')
GO
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[Catgories] ON 
GO
INSERT [dbo].[Catgories] ([id_catgory], [catgory]) VALUES (1, N'ילדות')
GO
INSERT [dbo].[Catgories] ([id_catgory], [catgory]) VALUES (2, N'נערות')
GO
INSERT [dbo].[Catgories] ([id_catgory], [catgory]) VALUES (3, N'נשים')
GO
INSERT [dbo].[Catgories] ([id_catgory], [catgory]) VALUES (4, N'תינוקות')
GO
INSERT [dbo].[Catgories] ([id_catgory], [catgory]) VALUES (5, N'אחר')
GO
SET IDENTITY_INSERT [dbo].[Catgories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (1, N'צהוב')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (2, N'כחול')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (3, N'תכלת')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (4, N'ירוק-מנטה')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (5, N'ירוק-בקבוק')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (6, N'ורוד')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (7, N'אפרסק')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (8, N'סגול-חציל')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (9, N'בורדו')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (10, N'שמנת')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (11, N'שחור')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (12, N'כסף')
GO
INSERT [dbo].[Colors] ([id_color], [color]) VALUES (13, N'אחר')
GO
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Gowns] ON 
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (1, 1, 3, N'Z10218.png', 2, 1, 300, 1, 4, 2, 1, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (2, 1, 3, N'Z3901.png', 2, 1, 300, 1, 4, 2, 1, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (3, 1, 3, N'Z3889.png', 2, 1, 300, 1, 4, 2, 1, 56)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (4, 2, 2, N'Z3888.png', 1, 0, 1000, 1, 7, 1, 0, 34)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (5, 2, 3, N'Z3832.png', 2, 1, 300, 1, 4, 3, 1, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (6, 2, 3, N'Z3107.png', 2, 1, 300, 1, 4, 3, 1, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (7, 4, 1, N'Z3106.png', 1, 1, 360, 1, 1, 14, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (8, 4, 1, N'Z3103.png', 1, 1, 580, 1, 1, 15, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (9, 4, 1, N'Z3098.png', 1, 1, 580, 1, 1, 15, NULL, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (10, 4, 1, N'Z3095.png', 1, 1, 580, 1, 1, 16, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (11, 4, 1, N'SHIRT005.png', 1, 1, 580, 1, 1, 16, NULL, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (12, 4, 1, N'JCHAR187.png', 1, 1, 580, 1, 1, 17, NULL, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (13, 4, 1, N'J0151047.png', 1, 1, 580, 1, 1, 18, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (14, 4, 1, N'HH000498.png', 1, 1, 580, 1, 1, 19, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (15, 4, 1, N'DRESS.png', 1, 1, 580, 1, 1, 19, NULL, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (21, 4, 1, N'Z5850.png', 1, 1, 100, 1, 1, 23, NULL, 2)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (22, 4, 1, N'DRESS.png', 1, 1, 540, 1, 1, 24, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (23, 4, 1, N'DRESS.png', 1, 1, 580, 1, 1, 25, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (24, 4, 1, N'DRESS.png', 1, 1, 580, 1, 1, 1, NULL, 28)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (25, 4, 1, N'196ff56a-145e-4447-b53b-f89aabe1345b_MEXI0044.JPG', 1, 1, 580, 1, 1, 1, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (26, 4, 3, N'16b778f6-9657-4ca1-93a7-641a2bf45f0f_XAAB9694.JPG', 1, 1, 1200, 0, 8, 26, NULL, 38)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (27, 4, 3, N'0551d291-804d-428c-900e-33c91556b0c3_XAAB9694.JPG', 1, 1, 1200, 0, 8, 26, NULL, 40)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (28, 60, 1, N'da7e132f-41e3-44f6-823b-a1f2ee5882a5_Around the World 005.jpg', 1, 1, 50, 0, 5, 1, NULL, 10)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (29, 73, 1, N'88a4b9fc-27e1-4b93-ad68-1f4ed575b6d4_DENM0037.JPG', 1, 1, 2500, 1, 13, 27, NULL, 32)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (30, 73, 1, N'6cefba74-3bf8-423b-b19b-36993ba7b018_JETS001.JPG', 1, 1, 2500, 1, 13, 27, NULL, 36)
GO
INSERT [dbo].[Gowns] ([id_gown], [id_renter], [id_catgory], [picture], [id_season], [is_long], [price], [is_light], [color], [id_set], [is_available], [size]) VALUES (31, 73, 1, N'4dd2a074-8054-41fd-a6c1-df30a0f9fc51_SSGP1331.JPG', 1, 1, 3500, 1, 1, 1, NULL, 42)
GO
SET IDENTITY_INSERT [dbo].[Gowns] OFF
GO
SET IDENTITY_INSERT [dbo].[Renters] ON 
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (1, N'תמי', N'פרישמן', N'5782061', N'0583295951', N'בני ברק', N'אליעזר 5', 3, 1234)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (2, N'חוי', N'ברמן', N'6199324', N'0548413614', N'בני ברק', N'בן זכאי 45 ', 3, 5789)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (3, N'נעמה', N'נורדמן', N'5555555', N'0556549876', N'חדרה', N'הסיגלית 63', 1, 8457)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (4, N'עדינה', N'וינר', N'5786317', N'0548756985', N'ירושלים', N'נוף רמות 7', 3, 1111)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (5, N'רייצי', N'קוקבקא', N'5799454', N'0583295959', N'אשדוד', N'רובע ז 7', 2, 8888)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (36, N'h', N'h', N'8888888', N'8888888888', N'j', N'k', 1, 1112)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (37, N'ui', N'u', N'7666666', N'7677777777', N'h', N'g', 1, 7658)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (38, N'o', N'o', N'0000000', N'0000000000', N'g', N'g', 1, 2367)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (39, N'j', N'j', N'6666666', N'6666666666', N't', N't', 1, 4670)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (40, N'j', N'j', N'8888888', N'8888888888', N'h', N'h', 1, 4597)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (41, N'uy', N'fj', N'2222222', N'2222222222', N'k', N'k', 1, 6541)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (42, N'l', N'l', N'5555555', N'5555555555', N'll', N'l', 1, 8573)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (43, N'l', N'l', N'8588888', N'8888888888', N'k', N'k', 1, 7264)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (44, N'jk', N'jk', N'9866666', N'6666666666', N'f', N'f', 1, 2570)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (45, N'huy', N'y', N'7777777', N'7777777777', N'ff', N'f', 1, 7530)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (46, N'j', N'j', N'7888888', N'8888888888', N'g', N'g', 1, 8521)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (47, N'ציפי', N'פריד', N'6183328', N'0548749685', N'ירושלים', N'רבי עקיבא 12', 2, 7898)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (48, N'שושי', N'ברמן', N'5021813', N'0583213614', N'בני ברק', N'בן זכאי 6', 1, 9878)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (49, N'זליג', N'וינר', N'9087769', N'0548449853', N'בני ברק', N'חזון איש 58', 3, 2136)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (50, N'שרה בתיה', N'וינר', N'6325773', NULL, N'מודיעין עילית', N'רבי עקיבא 18', 3, 8947)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (51, N'ריקי', N'וינר', N'9087769', N'0548449852', N'בני ברק', N'חזון איש 58', 3, 5469)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (52, N'בני', N'וינר', N'9087546', N'8888888888', N'צ', N'י', 1, 7820)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (53, N'זאבי', N'גרבוז', N'5487795', N'0504100125', N'בני ברק', N'קבוץ גלויות 4', 3, 8979)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (54, N'h', N'h', N'6666666', N'6666666666', N'n', N'n', 1, 8913)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (55, N'ju', N'gvj', N'4444444', N'4444444444', N'h', N'hj', 1, 8579)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (56, N'g', N'g', N'8888888', N'9999999999', N'gb', N'n', 1, 7125)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (57, N'h', N'ghn', N'6666666', N'3333333333', N'f', N'f', 1, 5698)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (58, N'y', N'h', N'6666666', N'6666666666', N'fg', N'5', 1, 5263)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (59, N'k', N'gh', N'8888888', N'4444444444', N'h', N'hg', 1, 4125)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (60, N'h', N'gf', N'7777777', N'7777777777', N'gf', N'fgh', 1, 1221)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (61, N'd', N'd', N'4444444', N'4444444444', N'd', N'd', 1, 3821)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (62, N'gn', N'gcb', N'5555555', N'5555555555', N'h', N'h', 1, 6523)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (63, N'יהודית', N'הי מה קורה', N'0504100', N'0504100179', N'ירושלים??', N'לא ידוע', 3, 3451)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (64, N'גיטי', N'בלעך', N'6582475', N'0542857963', N'תל אביב', N'חיגר 5', 3, 8530)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (65, N'ציפי', N'שרף', N'5874698', N'5555555555', N'בני ברק', N'רבי עקיבא 15', 1, 5986)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (66, N'mbk', N'm,', N'0.36356', N'0548428180', N'00', N'54', 3, 4123)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (67, N'l', N'l', N'6666666', N'6666666666', N'6', N'l', 1, 8964)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (68, N'צ', N'ח', N'9999999', N'9999999999', N'ח', N'חזון איש 58', 1, 8290)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (69, N'זליג', N'וינר', N'9986582', N'5555555555', N'ע', N'כג', 1, 4578)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (70, N'אלישבע', N'אלינסון', N'5555555', N'8888888888', N'ירושלים', N'טיוןם 5', 3, 6784)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (71, N'שרי', N'בק', N'0455555', N'5555555555', N'בני ברק', N'י', 1, 5412)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (72, N' bnkjbh', N'vjvj', N' 022002', N'1454241245', N'mio', N'vbujh', 1, 5421)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (73, N'חיים', N'מילר', N'9758423', N'0582356987', N'מודיעין עילית', N'חפץ חיים 17', 3, 8752)
GO
INSERT [dbo].[Renters] ([id_renter], [fname], [lname], [phone], [cellphone], [city], [address], [id_area], [password]) VALUES (74, N'gfh', N'fgj', N'7855555', N'5555555555', N'yuio', N'uio', 1, 8574)
GO
SET IDENTITY_INSERT [dbo].[Renters] OFF
GO
SET IDENTITY_INSERT [dbo].[Seasons] ON 
GO
INSERT [dbo].[Seasons] ([id_season], [season]) VALUES (1, N'חורף')
GO
INSERT [dbo].[Seasons] ([id_season], [season]) VALUES (2, N'קיץ')
GO
INSERT [dbo].[Seasons] ([id_season], [season]) VALUES (3, N'רב-עונתי')
GO
SET IDENTITY_INSERT [dbo].[Seasons] OFF
GO
SET IDENTITY_INSERT [dbo].[Sets] ON 
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (1, 0, NULL)
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (2, 3, N'DRESS004.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (3, 2, N'FSA05567.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (14, 1, N'DRESS005.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (15, 2, N'HH09022.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (16, 2, N'HH11046.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (17, 1, N'Z5850.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (18, 1, N'7bdbce13-f834-4f74-8317-c42f02fa3dd0_SHIRT005.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (19, 2, N'DRESS.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (20, 1, N'DRESS005.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (21, 1, N'DRESS005.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (22, 3, N'DRESS005.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (23, 1, N'Z3901.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (24, 1, N'DRESS005.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (25, 1, N'Z3106.png')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (26, 2, N'e87c9f07-9919-40b8-842d-181360a081dd_XAAB9694.JPG')
GO
INSERT [dbo].[Sets] ([id_set], [num_of_set], [picture]) VALUES (27, 2, N'9affde6f-5972-44b7-8c58-bfa31c6ad1a9_DENM0037.JPG')
GO
SET IDENTITY_INSERT [dbo].[Sets] OFF
GO
SET IDENTITY_INSERT [dbo].[Tenants] ON 
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (1, N'אלישבע', N'כהן', N'5124569', N'0527650316', N'בילו_12', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (2, N'juh', N'kjh', N'0000000', N'0000000000', N'b', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (3, N'yt', N't', N'6666666', N'6666666666', N'g', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (4, N'j', N'j', N'8888888', N'8888888888', N'j', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (5, N'תמי', N'פאיבמן', N'6666666', N'3333333333', N'לחי 3', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (6, N'ytjh', N'fg', N'4444444', N'4666666666', N'f', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (7, N'ftj', N'yjdf', N'5555555', N'8888888888', N'h', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (8, N'ghj', N'jghd', N'6666666', N'3333333333', N'hfg', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (10, N'jg', N'gjh', N'4444444', N'4777777777', N'gf', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (11, N'sghdfb', N'fgx', N'5555555', N'3333333333', N'f', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (12, N'tujh', N'jgd', N'5555555', N'4444444444', N'jkb', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (13, N'מוישי', N'גולדנטל', N'5214785', N'0542475874', N'הסיגלית 3', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (14, N'א', N'י', N'6666666', N'6666666666', N'נ', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (15, N'חי', N'ל', N'9999999', N'9999999999', N'ל', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (16, N'ל', N'ך', N'9888888', N'8888888888', N'צ', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (17, N'xvn', N'jgfx', N'4444444', N'7777777777', N'gnvx', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (18, N'ליבי', N'ולדן', N'5142879', N'0533155755', N'צפרירים 9', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (19, N'חוי', N'ברמן', N'4444444', N'6666666666', N'בן זאי 45', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (20, N'תמי', N'פרישמן', N'5782061', N'0583295951', N'אליעזר 5', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (21, N'כטוםב', N'לעבצ', N'6666666', N'8888888888', N'חעבה', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (22, N'יט', N'י', N'6777777', N'7776777777', N'י', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (23, N'מלי', N'וינגרטן', N'5021813', N'0533155755', N'חזון איש 56', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (24, N'מרים', N'שמעונוביץ', N'6489756', N'0528759456', N'טולדנו 7', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (25, N'uh', N'gh', N'4555555', N'5555555555', N'fgh', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (26, N'k', N'h', N'7777777', N'7777777777', N'6', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (27, N'ללי', N'רביץ', N'7777777', N'0533180864', N'מרים הנביאה 17', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (28, N'קילא', N'קרקובר', N'5214785', N'0533155755', N'רב אשי 3', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (29, N'אהובי', N'אדלשטין', N'5783265', N'0583213614', N'בן זכאי 6', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (30, N'תמר', N'פרישמן', N'5782061', N'0583295951', N'רבי אליעזר 5', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (31, N'אברימי', N'אלטמן', N'6198036', N'0527690326', N'אבן שפרוט 9', 3)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (32, N'tyi', N'gfhijfyu', N'5855555', N'5555555555', N'ghg', 1)
GO
INSERT [dbo].[Tenants] ([id_tenant], [fname], [lname], [phone], [cellphone], [address], [id_area]) VALUES (33, N'לאה ', N'רביץ', N'5786931', N'0533168639', N'מרים הנביאה 17', 3)
GO
SET IDENTITY_INSERT [dbo].[Tenants] OFF
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (1, 1, 600, CAST(N'1999-12-12' AS Date), 1, 1)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (1, 2, 800, CAST(N'1999-12-12' AS Date), 1, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (1, 3, 100, CAST(N'1998-12-12' AS Date), 1, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (2, 7, 360, CAST(N'0001-01-01' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (3, 7, 360, CAST(N'2018-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (4, 1, 300, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (4, 7, 360, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (4, 8, 580, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (4, 13, 580, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (5, 9, 580, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (5, 11, 580, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (5, 12, 580, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (6, 15, 580, CAST(N'2015-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (7, 9, 580, CAST(N'2018-12-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (7, 11, 580, CAST(N'2018-12-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (8, 9, 580, CAST(N'2044-12-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (8, 11, 580, CAST(N'2044-12-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (10, 9, 580, CAST(N'2015-07-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (10, 11, 580, CAST(N'2015-07-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (10, 15, 580, CAST(N'2015-07-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (11, 11, 580, CAST(N'2016-08-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (12, 3, 300, CAST(N'2016-08-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (12, 11, 580, CAST(N'2016-08-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 7, 360, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 8, 580, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 10, 580, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 13, 580, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 14, 580, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 22, 540, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (13, 23, 580, CAST(N'2016-08-05' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (14, 7, 360, CAST(N'2016-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (14, 8, 580, CAST(N'2016-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (15, 10, 580, CAST(N'2045-08-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (16, 7, 360, CAST(N'2014-05-08' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (17, 9, 580, CAST(N'2014-12-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (17, 11, 580, CAST(N'2014-12-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (17, 12, 580, CAST(N'2014-12-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (18, 7, 360, CAST(N'2011-04-06' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (18, 8, 580, CAST(N'2011-04-06' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (18, 13, 580, CAST(N'2011-04-06' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (18, 22, 540, CAST(N'2011-04-06' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (19, 7, 360, CAST(N'2014-02-18' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (19, 8, 580, CAST(N'2014-02-18' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (20, 7, 360, CAST(N'2014-02-18' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (20, 8, 580, CAST(N'2014-02-18' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (20, 10, 580, CAST(N'2014-02-18' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (21, 7, 360, CAST(N'2287-12-14' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (21, 8, 580, CAST(N'2287-12-14' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (21, 10, 580, CAST(N'2287-12-14' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (21, 23, 580, CAST(N'2287-12-14' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (22, 7, 360, CAST(N'2017-06-08' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (23, 1, 300, CAST(N'2564-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (23, 5, 300, CAST(N'2564-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (24, 1, 300, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (24, 2, 300, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (24, 5, 300, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (24, 6, 300, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (25, 7, 360, CAST(N'2245-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (25, 8, 580, CAST(N'2245-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (26, 7, 360, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (26, 8, 580, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (26, 14, 580, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (26, 25, 580, CAST(N'2254-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (27, 8, 580, CAST(N'5555-02-25' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (28, 7, 360, CAST(N'2222-12-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (28, 8, 580, CAST(N'2222-12-15' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (29, 26, 1200, CAST(N'2018-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (30, 30, 2500, CAST(N'2015-02-07' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (31, 7, 360, CAST(N'2028-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (31, 14, 580, CAST(N'2028-12-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (32, 7, 360, CAST(N'2019-08-07' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (32, 8, 580, CAST(N'2019-08-07' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (32, 10, 580, CAST(N'2019-08-07' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (33, 22, 540, CAST(N'2011-08-12' AS Date), 0, 0)
GO
INSERT [dbo].[Tenants-sets] ([id_tenant], [id_gown], [payment], [date], [is_payed], [is_returned]) VALUES (33, 25, 580, CAST(N'2011-08-12' AS Date), 0, 0)
GO
ALTER TABLE [dbo].[Gowns]  WITH CHECK ADD  CONSTRAINT [FK__Gowns__color__182C9B23] FOREIGN KEY([color])
REFERENCES [dbo].[Colors] ([id_color])
GO
ALTER TABLE [dbo].[Gowns] CHECK CONSTRAINT [FK__Gowns__color__182C9B23]
GO
ALTER TABLE [dbo].[Gowns]  WITH CHECK ADD  CONSTRAINT [FK__Gowns__id_catgor__0DAF0CB0] FOREIGN KEY([id_catgory])
REFERENCES [dbo].[Catgories] ([id_catgory])
GO
ALTER TABLE [dbo].[Gowns] CHECK CONSTRAINT [FK__Gowns__id_catgor__0DAF0CB0]
GO
ALTER TABLE [dbo].[Gowns]  WITH CHECK ADD  CONSTRAINT [FK__Gowns__id_renter__0EA330E9] FOREIGN KEY([id_renter])
REFERENCES [dbo].[Renters] ([id_renter])
GO
ALTER TABLE [dbo].[Gowns] CHECK CONSTRAINT [FK__Gowns__id_renter__0EA330E9]
GO
ALTER TABLE [dbo].[Gowns]  WITH CHECK ADD  CONSTRAINT [FK__Gowns__id_season__0F975522] FOREIGN KEY([id_season])
REFERENCES [dbo].[Seasons] ([id_season])
GO
ALTER TABLE [dbo].[Gowns] CHECK CONSTRAINT [FK__Gowns__id_season__0F975522]
GO
ALTER TABLE [dbo].[Gowns]  WITH CHECK ADD  CONSTRAINT [FK__Gowns__id_season__108B795B] FOREIGN KEY([id_season])
REFERENCES [dbo].[Seasons] ([id_season])
GO
ALTER TABLE [dbo].[Gowns] CHECK CONSTRAINT [FK__Gowns__id_season__108B795B]
GO
ALTER TABLE [dbo].[Gowns]  WITH CHECK ADD  CONSTRAINT [FK__Gowns__id_set__117F9D94] FOREIGN KEY([id_set])
REFERENCES [dbo].[Sets] ([id_set])
GO
ALTER TABLE [dbo].[Gowns] CHECK CONSTRAINT [FK__Gowns__id_set__117F9D94]
GO
ALTER TABLE [dbo].[Renters]  WITH CHECK ADD FOREIGN KEY([id_area])
REFERENCES [dbo].[Areas] ([id_area])
GO
ALTER TABLE [dbo].[Tenants]  WITH CHECK ADD FOREIGN KEY([id_area])
REFERENCES [dbo].[Areas] ([id_area])
GO
ALTER TABLE [dbo].[Tenants-sets]  WITH CHECK ADD  CONSTRAINT [FK__Tenants-s__id_go__15502E78] FOREIGN KEY([id_gown])
REFERENCES [dbo].[Gowns] ([id_gown])
GO
ALTER TABLE [dbo].[Tenants-sets] CHECK CONSTRAINT [FK__Tenants-s__id_go__15502E78]
GO
ALTER TABLE [dbo].[Tenants-sets]  WITH CHECK ADD  CONSTRAINT [FK__Tenants-s__id_go__35BCFE0A] FOREIGN KEY([id_gown])
REFERENCES [dbo].[Gowns] ([id_gown])
GO
ALTER TABLE [dbo].[Tenants-sets] CHECK CONSTRAINT [FK__Tenants-s__id_go__35BCFE0A]
GO
ALTER TABLE [dbo].[Tenants-sets]  WITH CHECK ADD  CONSTRAINT [FK__Tenants-s__id_te__1367E606] FOREIGN KEY([id_tenant])
REFERENCES [dbo].[Tenants] ([id_tenant])
GO
ALTER TABLE [dbo].[Tenants-sets] CHECK CONSTRAINT [FK__Tenants-s__id_te__1367E606]
GO
ALTER TABLE [dbo].[Tenants-sets]  WITH CHECK ADD  CONSTRAINT [FK__Tenants-s__id_te__36B12243] FOREIGN KEY([id_tenant])
REFERENCES [dbo].[Tenants] ([id_tenant])
GO
ALTER TABLE [dbo].[Tenants-sets] CHECK CONSTRAINT [FK__Tenants-s__id_te__36B12243]
GO
USE [master]
GO
ALTER DATABASE [RentingGown] SET  READ_WRITE 
GO
