USE [master]
GO
CREATE DATABASE [WhoCanHelpMe] ON  PRIMARY 
( NAME = N'WhoCanHelpMe', FILENAME = N'YOUR_PATH_GOES_HERE\WhoCanHelpMe.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WhoCanHelpMe_log', FILENAME = N'YOUR_PATH_GOES_HERE\WhoCanHelpMe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WhoCanHelpMe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WhoCanHelpMe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WhoCanHelpMe] SET ANSI_NULL_DEFAULT ON
GO
ALTER DATABASE [WhoCanHelpMe] SET ANSI_NULLS ON
GO
ALTER DATABASE [WhoCanHelpMe] SET ANSI_PADDING ON
GO
ALTER DATABASE [WhoCanHelpMe] SET ANSI_WARNINGS ON
GO
ALTER DATABASE [WhoCanHelpMe] SET ARITHABORT ON
GO
ALTER DATABASE [WhoCanHelpMe] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [WhoCanHelpMe] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [WhoCanHelpMe] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET CURSOR_DEFAULT  LOCAL
GO
ALTER DATABASE [WhoCanHelpMe] SET CONCAT_NULL_YIELDS_NULL ON
GO
ALTER DATABASE [WhoCanHelpMe] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET QUOTED_IDENTIFIER ON
GO
ALTER DATABASE [WhoCanHelpMe] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET  DISABLE_BROKER
GO
ALTER DATABASE [WhoCanHelpMe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [WhoCanHelpMe] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [WhoCanHelpMe] SET  READ_WRITE
GO
ALTER DATABASE [WhoCanHelpMe] SET RECOVERY FULL
GO
ALTER DATABASE [WhoCanHelpMe] SET  MULTI_USER
GO
ALTER DATABASE [WhoCanHelpMe] SET PAGE_VERIFY NONE
GO
ALTER DATABASE [WhoCanHelpMe] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'WhoCanHelpMe', N'ON'
GO
USE [WhoCanHelpMe]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 12/18/2009 16:26:35 ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [wchm]    Script Date: 12/18/2009 16:26:35 ******/
CREATE SCHEMA [wchm] AUTHORIZATION [dbo]
GO
/****** Object:  Table [wchm].[Tags]    Script Date: 12/18/2009 16:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wchm].[Tags](
	[Name] [nvarchar](max) NOT NULL,
	[Views] [bigint] NOT NULL,
	[TagId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [wchm].[Profiles]    Script Date: 12/18/2009 16:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wchm].[Profiles](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Profiles_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [wchm].[Categories]    Script Date: 12/18/2009 16:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wchm].[Categories](
	[Name] [nvarchar](max) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [wchm].[Categories] ON
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Has previously worked for', 7, N'Use for listing companies you have worked for', 1)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Is a', 1, N'Use for listing your level / position', 2)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Has worked for', 6, N'Use for listing clients you have worked for', 3)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Is a member of the', 9, N'Use for listing communities you belong to', 4)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Has attended', 12, N'Use for listing conferences you have attended', 5)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Knows about', 3, N'Use for listing topics you know about', 6)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Belongs to the', 2, N'Use for the name of the team you work for', 7)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Is interested in', 4, N'Use for listing topics you are interested in', 8)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Has worked on', 8, N'Use for listing clients you have worked for', 9)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Has training for', 11, N'Use for listing training courses you have attended', 10)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Has experience in', 5, N'Use for listing experiences in business verticals', 11)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Is certified as a', 10, N'Use for listing certifications', 12)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Blogs at', 13, N'Use for your blog Url', 13)
INSERT [wchm].[Categories] ([Name], [SortOrder], [Description], [CategoryId]) VALUES (N'Tweets as', 14, N'Use for your Twitter handle', 14)
SET IDENTITY_INSERT [wchm].[Categories] OFF
/****** Object:  Table [wchm].[Assertions]    Script Date: 12/18/2009 16:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wchm].[Assertions](
	[AssertionId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Assertions] PRIMARY KEY CLUSTERED 
(
	[AssertionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Assertions] UNIQUE NONCLUSTERED 
(
	[ProfileId] ASC,
	[CategoryId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Assertions_Categories]    Script Date: 12/18/2009 16:26:37 ******/
ALTER TABLE [wchm].[Assertions]  WITH CHECK ADD  CONSTRAINT [FK_Assertions_Categories] FOREIGN KEY([CategoryId])
REFERENCES [wchm].[Categories] ([CategoryId])
GO
ALTER TABLE [wchm].[Assertions] CHECK CONSTRAINT [FK_Assertions_Categories]
GO
/****** Object:  ForeignKey [FK_Assertions_Profiles]    Script Date: 12/18/2009 16:26:37 ******/
ALTER TABLE [wchm].[Assertions]  WITH CHECK ADD  CONSTRAINT [FK_Assertions_Profiles] FOREIGN KEY([ProfileId])
REFERENCES [wchm].[Profiles] ([ProfileId])
GO
ALTER TABLE [wchm].[Assertions] CHECK CONSTRAINT [FK_Assertions_Profiles]
GO
/****** Object:  ForeignKey [FK_Assertions_Tags]    Script Date: 12/18/2009 16:26:37 ******/
ALTER TABLE [wchm].[Assertions]  WITH CHECK ADD  CONSTRAINT [FK_Assertions_Tags] FOREIGN KEY([TagId])
REFERENCES [wchm].[Tags] ([TagId])
GO
ALTER TABLE [wchm].[Assertions] CHECK CONSTRAINT [FK_Assertions_Tags]
GO
