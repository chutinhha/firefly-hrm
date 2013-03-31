USE [master]
GO
/****** Object:  Database [HRMORBIS]    Script Date: 03/31/2013 22:14:52 ******/
CREATE DATABASE [HRMORBIS] ON  PRIMARY 
( NAME = N'HRMORBIS', FILENAME = N'F:\firefly-hrml-wiki\Database\HRMORBIS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HRMORBIS_log', FILENAME = N'F:\firefly-hrml-wiki\Database\HRMORBIS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HRMORBIS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRMORBIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRMORBIS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HRMORBIS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HRMORBIS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HRMORBIS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HRMORBIS] SET ARITHABORT OFF
GO
ALTER DATABASE [HRMORBIS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HRMORBIS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HRMORBIS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HRMORBIS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HRMORBIS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HRMORBIS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HRMORBIS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HRMORBIS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HRMORBIS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HRMORBIS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HRMORBIS] SET  DISABLE_BROKER
GO
ALTER DATABASE [HRMORBIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HRMORBIS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HRMORBIS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HRMORBIS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HRMORBIS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HRMORBIS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HRMORBIS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HRMORBIS] SET  READ_WRITE
GO
ALTER DATABASE [HRMORBIS] SET RECOVERY FULL
GO
ALTER DATABASE [HRMORBIS] SET  MULTI_USER
GO
ALTER DATABASE [HRMORBIS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HRMORBIS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'HRMORBIS', N'ON'
GO
USE [HRMORBIS]
GO
/****** Object:  User [hr]    Script Date: 03/31/2013 22:14:52 ******/
CREATE USER [hr] FOR LOGIN [hr] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [HumanResources]    Script Date: 03/31/2013 22:14:52 ******/
CREATE SCHEMA [HumanResources] AUTHORIZATION [db_accessadmin]
GO
/****** Object:  Table [HumanResources].[Shift]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Shift](
	[ShiftID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Shift_ShiftID] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Shift records.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift', @level2type=N'COLUMN',@level2name=N'ShiftID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shift description.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shift start time.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shift end time.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Work shift lookup table.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Shift', @level2type=N'CONSTRAINT',@level2name=N'PK_Shift_ShiftID'
GO
SET IDENTITY_INSERT [HumanResources].[Shift] ON
INSERT [HumanResources].[Shift] ([ShiftID], [Name], [StartTime], [EndTime], [ModifiedDate]) VALUES (2, N'Shift1', CAST(0x070048F9F66C0000 AS Time), CAST(0x0700E80A7E8E0000 AS Time), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[Shift] ([ShiftID], [Name], [StartTime], [EndTime], [ModifiedDate]) VALUES (4, N'Shift2', CAST(0x070040230E430000 AS Time), CAST(0x0700E03495640000 AS Time), CAST(0x0000A18A00000000 AS DateTime))
SET IDENTITY_INSERT [HumanResources].[Shift] OFF
/****** Object:  Table [HumanResources].[Project]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](128) NOT NULL,
	[Note] [nvarchar](256) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about project' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Project'
GO
SET IDENTITY_INSERT [HumanResources].[Project] ON
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (2, N'Healing on Sapa', NULL, CAST(0xE4360B00 AS Date), CAST(0xED360B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (3, N'Environment', NULL, CAST(0xEE360B00 AS Date), CAST(0x09370B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (4, N'Catch the fish', NULL, CAST(0x0E370B00 AS Date), CAST(0x28370B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (6, N'Leave', NULL, CAST(0x94360B00 AS Date), CAST(0x01380B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Project] OFF
/****** Object:  Table [HumanResources].[Department]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Department](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department_DepartmentID] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Department records.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the department.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup table containing the departments within the Adventure Works Cycles company.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Department', @level2type=N'CONSTRAINT',@level2name=N'PK_Department_DepartmentID'
GO
SET IDENTITY_INSERT [HumanResources].[Department] ON
INSERT [HumanResources].[Department] ([DepartmentID], [Name], [ModifiedDate]) VALUES (1, N'Test1', CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[Department] ([DepartmentID], [Name], [ModifiedDate]) VALUES (3, N'Test2', CAST(0x0000A18A00000000 AS DateTime))
SET IDENTITY_INSERT [HumanResources].[Department] OFF
/****** Object:  Table [HumanResources].[CheckpointQuestion]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[CheckpointQuestion](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[AnserType] [nvarchar](50) NOT NULL,
	[PerfectLevel] [nvarchar](50) NULL,
	[GreatLevel] [nvarchar](50) NULL,
	[NormalLevel] [nvarchar](50) NULL,
	[BadLevel] [nvarchar](50) NULL,
	[VeryBad] [nvarchar](50) NULL,
 CONSTRAINT [PK_CheckpointQuestion] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] ON
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (0, N'Does employee demonstrate ambition in the position (not to move out of it, but to perform it) and take initiative to improve the process, product, or overall work environment?', N'YesNo', NULL, NULL, NULL, NULL, NULL)
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (1, N'Has the employee''s attendance (even within company guidelines) had a negative impact on the department productivity or morale? Has the employee''s attendance been exemplary?', N'YesNo', NULL, NULL, NULL, NULL, NULL)
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (2, N'What is the employee''s attitude towards you, towards peers, towards the work in general? Is he or she a pleasure or a chore to work with? Is the employee reasonably flexible when asked to perform a job function outside his or her normal duties, or to work outside his or her normal hours for a special project?', N'YesNo', NULL, NULL, NULL, NULL, NULL)
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (3, N'PERFORMANCE LEVELS', N'Level', N'Outstanding', N'Exceeds Standards', N'Meets Standards', N'Minimally Acceptable', N'Needs Improvement')
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] OFF
/****** Object:  Table [HumanResources].[CandidateStatus]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[CandidateStatus](
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CandidateStatus] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Application Initiated')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Hired')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Failed')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Passed')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Schedule')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Job Offerd')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Offer Decline')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Rejected')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Shortlisted')
/****** Object:  Table [HumanResources].[EvaluatePoint]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[EvaluatePoint](
	[BusinessEntityID] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Point] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[AveragePoint] [float] NULL,
	[TotalPoint] [int] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_EvaluatePoint] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[Quarter] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (3, 1, 0, 10, N'', 9.5, 38, CAST(0xED360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (3, 1, 1, 10, N'', 9.5, 38, CAST(0xED360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (3, 1, 2, 10, N'', 9.5, 38, CAST(0xED360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (3, 1, 3, 8, N'', 9.5, 38, CAST(0xED360B00 AS Date))
/****** Object:  Table [HumanResources].[JobCategories]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobCategories](
	[Name] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_JobCategories] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of category' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCategories'
GO
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Admin Staff', NULL)
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Excutives', NULL)
/****** Object:  Table [HumanResources].[JobTitle]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobTitle](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[JobDes] [nvarchar](256) NULL,
	[JobCategory] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[JobTitle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about job' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobTitle'
GO
SET IDENTITY_INSERT [HumanResources].[JobTitle] ON
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (5, N'Call Center Agent', NULL, N'Admin Staff', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (6, N'Floor Supervisor', NULL, N'Admin Staff', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (7, N'HR Executive', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (8, N'Manager - Customer Care', NULL, N'Excutives', NULL, NULL)
SET IDENTITY_INSERT [HumanResources].[JobTitle] OFF
/****** Object:  Table [HumanResources].[Task]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Task](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[TaskName] [nvarchar](128) NOT NULL,
	[Note] [nvarchar](256) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Task_1] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about task of project' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Task'
GO
SET IDENTITY_INSERT [HumanResources].[Task] ON
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (1, 2, N'Preparing the plane', NULL, CAST(0xE6360B00 AS Date), CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (2, 2, N'Flying', NULL, CAST(0xE8360B00 AS Date), CAST(0xEA360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (3, 2, N'Healing', NULL, CAST(0xEA360B00 AS Date), CAST(0xED360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (4, 3, N'Preparing the plane', NULL, CAST(0xEE360B00 AS Date), CAST(0xFC360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (5, 3, N'Flying', NULL, CAST(0xFC360B00 AS Date), CAST(0x09370B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (6, 4, N'Healing', NULL, CAST(0x0E370B00 AS Date), CAST(0x28370B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (7, 6, N'Leave Holiday', NULL, CAST(0xEC360B00 AS Date), CAST(0xF1360B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Task] OFF
/****** Object:  Table [HumanResources].[JobVacancy]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobVacancy](
	[JobTitle] [nvarchar](50) NOT NULL,
	[VacancyName] [nvarchar](50) NOT NULL,
	[HiringManager] [nvarchar](50) NULL,
	[NoOfPos] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nchar](10) NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_JobVacancy] PRIMARY KEY CLUSTERED 
(
	[VacancyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'Call Center Agent', N'vacancy1', N'', 0, N'', N'Closed    ', CAST(0x0000A192015D1E38 AS DateTime))
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'Floor Supervisor', N'vacancy2', N'', 0, N'', N'Closed    ', CAST(0x0000A192015D2798 AS DateTime))
/****** Object:  Table [HumanResources].[Employee]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Employee](
	[BusinessEntityId] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [nvarchar](256) NULL,
	[JobId] [int] NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
	[Salary] [money] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Image] [nvarchar](128) NULL,
 CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'BusinessEntityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Network login.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'LoginID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Work title such as Buyer or Sales Representative.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'JobId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of birth.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'M = Married, S = Single' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'MaritalStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'M = Male, F = Female' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee hired on this date.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of available vacation hours.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'VacationHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of available sick leave hours.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'SickLeaveHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Inactive, 1 = Active' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'CurrentFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee information such as salary, department, and title.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'CONSTRAINT',@level2name=N'PK_Employee_BusinessEntityID'
GO
SET IDENTITY_INSERT [HumanResources].[Employee] ON
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (3, N'vinhtt1', 5, CAST(0x02160B00 AS Date), N'S', N'M', NULL, 500000.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (4, N'tungda', 5, CAST(0x40160B00 AS Date), N'S', N'M', NULL, 5000000.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (6, N'dungdqv1', 5, CAST(0x30170B00 AS Date), N'S', N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (8, N'tungnt', 5, CAST(0xBD180B00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (9, N'khanhnh', 5, CAST(0x481A0B00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (10, N'kynh', 5, CAST(0xF5EA0A00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (14, N'MJ', 5, NULL, NULL, NULL, CAST(0xE9360B00 AS Date), 0.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (15, N'tungda1', 5, CAST(0x30170B00 AS Date), NULL, NULL, NULL, 500000.0000, NULL, NULL, 1, CAST(0x0000A192015EE3BC AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (28, N'test', 5, CAST(0x23180B00 AS Date), N'1', N'1', CAST(0x26350B00 AS Date), 30000.0000, 8, 8, 1, CAST(0x00009FEA00000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (29, NULL, NULL, CAST(0x3D160B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A19000000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A19100000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A19100000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A19100000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (34, NULL, NULL, NULL, NULL, NULL, CAST(0xEC360B00 AS Date), NULL, NULL, NULL, 1, CAST(0x0000A19100000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (35, NULL, NULL, NULL, NULL, NULL, CAST(0xEC360B00 AS Date), NULL, NULL, NULL, 1, CAST(0x0000A19100000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (36, NULL, NULL, CAST(0x73220B00 AS Date), N'S', N'M', NULL, NULL, NULL, NULL, 1, CAST(0x0000A19200000000 AS DateTime), N'ABCD')
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (37, N'test1', 5, CAST(0x30170B00 AS Date), N'1', N'1', CAST(0x46350B00 AS Date), 30000.0000, 8, 8, 1, CAST(0x00009FEB00000000 AS DateTime), NULL)
SET IDENTITY_INSERT [HumanResources].[Employee] OFF
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobCandidate](
	[FullName] [nvarchar](50) NOT NULL,
	[AddressStreet] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[HomePhone] [bigint] NULL,
	[Mobile] [bigint] NULL,
	[WorkPhone] [bigint] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[JobVacancy] [nvarchar](50) NULL,
	[Keywords] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[ApplyDate] [date] NULL,
	[JobTitle] [nvarchar](50) NULL,
	[HiringManager] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[MethodOfApply] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[InterviewDate] [datetime] NULL,
 CONSTRAINT [PK_JobCandidate] PRIMARY KEY CLUSTERED 
(
	[FullName] ASC,
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'assdas', N'', N'', N'', N'', N'Afghanistan', 0, 0, 0, N'a@fsd', N'vacancy1', N'', N'', NULL, N'Call Center Agent', N'', N'Interview Schedule', N'Online', CAST(0x0000A192015D9494 AS DateTime), CAST(0x0000A18E008C1360 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'candidate2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b@b', N'vacancy2', NULL, NULL, NULL, NULL, NULL, N'Interview Schedule', NULL, NULL, CAST(0x0000A1A600000000 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'candidate3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sa@as', NULL, NULL, NULL, NULL, NULL, NULL, N'Hired', NULL, NULL, NULL)
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'czxczx', N'', N'', N'', N'', N'Afghanistan', 0, 0, 0, N'xxs@fds', N'vacancy2', N'', N'', NULL, N'Call Center Agent', N'', N'Application Initiated', N'Online', CAST(0x0000A192015DCA7C AS DateTime), CAST(0x0000A18E009450C0 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'test', N'', N'', N'', N'', N'Afghanistan', 0, 0, 0, N'test@test', N'vacancy2', N'', N'', NULL, N'Call Center Agent', N'', N'Application Initiated', N'Online', CAST(0x0000A192015DD760 AS DateTime), NULL)
/****** Object:  Table [HumanResources].[EmployeeDepartmentHistory]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[EmployeeDepartmentHistory](
	[BusinessEntityId] [int] NOT NULL,
	[DepartmentID] [smallint] NOT NULL,
	[ShiftID] [tinyint] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityId] ASC,
	[StartDate] ASC,
	[DepartmentID] ASC,
	[ShiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee identification number. Foreign key to Employee.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'COLUMN',@level2name=N'BusinessEntityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Department in which the employee worked including currently. Foreign key to Department.DepartmentID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies which 8-hour shift the employee works. Foreign key to Shift.Shift.ID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'COLUMN',@level2name=N'ShiftID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the employee started work in the department.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the employee left the department. NULL = Current department.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee department transfers.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'EmployeeDepartmentHistory', @level2type=N'CONSTRAINT',@level2name=N'PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID'
GO
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (4, 1, 2, CAST(0xE5360B00 AS Date), CAST(0xE7360B00 AS Date), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (4, 1, 4, CAST(0xEE360B00 AS Date), CAST(0x0B370B00 AS Date), CAST(0x0000A18A00000000 AS DateTime))
/****** Object:  Table [HumanResources].[Person]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Person](
	[BusinessEntityId] [int] NOT NULL,
	[Rank] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[SSNNumber] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](30) NULL,
	[AddressStreet] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY NONCLUSTERED 
(
	[BusinessEntityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Person records.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'BusinessEntityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rank of person(Admin or User).' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the person.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email address of person.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The homephone number.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'HomePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The mobile number.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of SSN.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'SSNNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adress.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'AddressStreet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'PK_Person_BusinessEntityID'
GO
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (3, N'User', N'To Tuan Vinh', N'vinhtt@gmail.com', N'', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (4, N'Admin', N'Do Anh Tung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (6, N'Admin', N'Dang Quang Viet Dung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (8, N'Admin', N'Nguyen Thanh Tung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (9, N'Admin', N'Nguyen Ngoc Khanh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (10, N'Admin', N'Nguyen Hong Ky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (14, N'User', N'Michael Jackson', N'MJ@gmail.com', N'123456789', N'12345678', NULL, N'New York', N'United States', N'Wall', CAST(0x0000A192015EE3BC AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (15, N'Admin', N'Do Anh Tung', N'tungda1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A192015EE3BC AS DateTime))
/****** Object:  Table [HumanResources].[Password]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Password](
	[BusinessEntityId] [int] NOT NULL,
	[PasswordHash] [varchar](128) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Password_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Password hashing.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Password', @level2type=N'COLUMN',@level2name=N'PasswordHash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Password', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Password', @level2type=N'CONSTRAINT',@level2name=N'PK_Password_BusinessEntityID'
GO
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (3, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18900000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (4, N'2320EDD3777E93220768A4AF8FC6CD21', CAST(0x0000A18A00098C88 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (6, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (8, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (9, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (10, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (14, N'F32D2C8C67D9A5D6C12CB68F25867A14', CAST(0x0000A18E0174CD80 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (15, N'CB21A853D73FCC6B298755DA0F9B948C', CAST(0x0000A19000000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (28, N'2320EDD3777E93220768A4AF8FC6CD21', CAST(0x0000A19000000000 AS DateTime))
/****** Object:  Table [HumanResources].[Timesheet]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Timesheet](
	[TimesheetId] [int] IDENTITY(1,1) NOT NULL,
	[Time] [float] NOT NULL,
	[BusinessEntityId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
	[TaskDes] [nvarchar](256) NULL,
	[CurrentFlag] [bit] NOT NULL,
	[WorkDate] [date] NOT NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[TimesheetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about timesheet' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Timesheet'
GO
SET IDENTITY_INSERT [HumanResources].[Timesheet] ON
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (2, 4, 3, 7, CAST(0xE9360B00 AS Date), N'abcd', 1, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (3, 4, 3, 7, CAST(0xE9360B00 AS Date), N'asdas', 1, CAST(0xEA360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (4, 4, 3, 7, CAST(0xE9360B00 AS Date), N'jashd', 1, CAST(0xEB360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (5, 4, 4, 7, CAST(0xE9360B00 AS Date), N'asd', 1, CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (6, 4, 4, 7, CAST(0xE9360B00 AS Date), N'dasd', 1, CAST(0xE7360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (7, 4, 3, 7, CAST(0xE9360B00 AS Date), N'jashd', 1, CAST(0xEC360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (10, 4, 15, 7, CAST(0xE9360B00 AS Date), N'dá', 1, CAST(0xEC360B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Timesheet] OFF
/****** Object:  Table [HumanResources].[PersonProject]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[PersonProject](
	[BusinessEntityId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[Note] [nvarchar](256) NULL,
	[CurrentFlag] [bit] NOT NULL,
	[ModifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_PersonProject_1] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityId] ASC,
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 is inactived, 1 is actived' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'PersonProject', @level2type=N'COLUMN',@level2name=N'CurrentFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 is active, 0 is deactive' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'PersonProject'
GO
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (3, 7, NULL, 0, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (4, 7, NULL, 0, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (6, 7, NULL, 1, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (8, 7, NULL, 1, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (9, 7, NULL, 0, CAST(0xE9360B00 AS Date))
/****** Object:  Table [HumanResources].[Attendance]    Script Date: 03/31/2013 22:14:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Attendance](
	[BusinessEntityId] [int] NOT NULL,
	[PunchIn] [datetime] NOT NULL,
	[PunchInNote] [nvarchar](max) NULL,
	[PunchOut] [datetime] NOT NULL,
	[PunchOutNote] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityId] ASC,
	[PunchIn] ASC,
	[PunchOut] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (3, CAST(0x00009FEA00000000 AS DateTime), N'', CAST(0x00009FEA00A4CB80 AS DateTime), N'', NULL)
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (3, CAST(0x0000A1910166AF70 AS DateTime), N'abc', CAST(0x0000A19101671B40 AS DateTime), N'', CAST(0x0000A19101671B40 AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (3, CAST(0x0000A19101674DA4 AS DateTime), N'abc', CAST(0x0000A1910167EF5C AS DateTime), N'', CAST(0x0000A1910167EF5C AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (3, CAST(0x0000A19101697CA0 AS DateTime), N'test', CAST(0x0000A191016A0A6C AS DateTime), N'test4', CAST(0x0000A191016A0A6C AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCB017B4D90 AS DateTime), N'', CAST(0x00009FCB0188C2E0 AS DateTime), N'', CAST(0x0000A188016B942C AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCC00107AC0 AS DateTime), NULL, CAST(0x00009FCC015A11C0 AS DateTime), NULL, NULL)
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCC015A5810 AS DateTime), N'', CAST(0x00009FCC017B0740 AS DateTime), N'gf', NULL)
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCD00107AC0 AS DateTime), N'', CAST(0x00009FCD00C5C100 AS DateTime), N'sasd', NULL)
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCD015A11C0 AS DateTime), N'', CAST(0x00009FCD017B0740 AS DateTime), N'', NULL)
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCD017B4D90 AS DateTime), N'', CAST(0x00009FCD018B3BB0 AS DateTime), N'ert', NULL)
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FCE01186D10 AS DateTime), N'', CAST(0x00009FCE015A11C0 AS DateTime), N'', CAST(0x0000A18300E6A3C0 AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FD0008C1360 AS DateTime), N'', CAST(0x00009FD0009450C0 AS DateTime), N'', CAST(0x0000A18300DDB56C AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x00009FD1008C1360 AS DateTime), N'2', CAST(0x00009FD1009450C0 AS DateTime), N'1', CAST(0x0000A183011857F8 AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x0000A174008C1360 AS DateTime), N'', CAST(0x0000A174009450C0 AS DateTime), N'', CAST(0x0000A18600C3DAAC AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x0000A175008C1360 AS DateTime), N'', CAST(0x0000A175009450C0 AS DateTime), N'', CAST(0x0000A18600C5196C AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x0000A179008C1360 AS DateTime), N'', CAST(0x0000A179009450C0 AS DateTime), N'', CAST(0x0000A1880165B4A8 AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (4, CAST(0x0000A191008C1360 AS DateTime), N'', CAST(0x0000A191009450C0 AS DateTime), N'', CAST(0x0000A18D0003F0FC AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (15, CAST(0x0000A17400000000 AS DateTime), NULL, CAST(0x0000A17400A4CB80 AS DateTime), NULL, CAST(0x0000A18E00000000 AS DateTime))
/****** Object:  ForeignKey [FK_JobTitle_JobCategories]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[JobTitle]  WITH CHECK ADD  CONSTRAINT [FK_JobTitle_JobCategories] FOREIGN KEY([JobCategory])
REFERENCES [HumanResources].[JobCategories] ([Name])
GO
ALTER TABLE [HumanResources].[JobTitle] CHECK CONSTRAINT [FK_JobTitle_JobCategories]
GO
/****** Object:  ForeignKey [FK_Task_Project]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectId])
REFERENCES [HumanResources].[Project] ([ProjectId])
GO
ALTER TABLE [HumanResources].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
/****** Object:  ForeignKey [FK_JobVacancy_JobTitle]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[JobVacancy]  WITH CHECK ADD  CONSTRAINT [FK_JobVacancy_JobTitle] FOREIGN KEY([JobTitle])
REFERENCES [HumanResources].[JobTitle] ([JobTitle])
GO
ALTER TABLE [HumanResources].[JobVacancy] CHECK CONSTRAINT [FK_JobVacancy_JobTitle]
GO
/****** Object:  ForeignKey [FK_Employee_JobTitle]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY([JobId])
REFERENCES [HumanResources].[JobTitle] ([JobId])
GO
ALTER TABLE [HumanResources].[Employee] CHECK CONSTRAINT [FK_Employee_JobTitle]
GO
/****** Object:  ForeignKey [FK_JobCandidate_CandidateStatus]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[JobCandidate]  WITH CHECK ADD  CONSTRAINT [FK_JobCandidate_CandidateStatus] FOREIGN KEY([Status])
REFERENCES [HumanResources].[CandidateStatus] ([Status])
GO
ALTER TABLE [HumanResources].[JobCandidate] CHECK CONSTRAINT [FK_JobCandidate_CandidateStatus]
GO
/****** Object:  ForeignKey [FK_JobCandidate_JobTitle]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[JobCandidate]  WITH CHECK ADD  CONSTRAINT [FK_JobCandidate_JobTitle] FOREIGN KEY([JobTitle])
REFERENCES [HumanResources].[JobTitle] ([JobTitle])
GO
ALTER TABLE [HumanResources].[JobCandidate] CHECK CONSTRAINT [FK_JobCandidate_JobTitle]
GO
/****** Object:  ForeignKey [FK_JobCandidate_JobVacancy]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[JobCandidate]  WITH CHECK ADD  CONSTRAINT [FK_JobCandidate_JobVacancy] FOREIGN KEY([JobVacancy])
REFERENCES [HumanResources].[JobVacancy] ([VacancyName])
GO
ALTER TABLE [HumanResources].[JobCandidate] CHECK CONSTRAINT [FK_JobCandidate_JobVacancy]
GO
/****** Object:  ForeignKey [FK_EmployeeDepartmentHistory_Department]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDepartmentHistory_Department] FOREIGN KEY([DepartmentID])
REFERENCES [HumanResources].[Department] ([DepartmentID])
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Department]
GO
/****** Object:  ForeignKey [FK_EmployeeDepartmentHistory_Employee]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDepartmentHistory_Employee] FOREIGN KEY([BusinessEntityId])
REFERENCES [HumanResources].[Employee] ([BusinessEntityId])
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Employee]
GO
/****** Object:  ForeignKey [FK_EmployeeDepartmentHistory_Shift]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDepartmentHistory_Shift] FOREIGN KEY([ShiftID])
REFERENCES [HumanResources].[Shift] ([ShiftID])
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Shift]
GO
/****** Object:  ForeignKey [FK_Person_Employee]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Employee] FOREIGN KEY([BusinessEntityId])
REFERENCES [HumanResources].[Employee] ([BusinessEntityId])
GO
ALTER TABLE [HumanResources].[Person] CHECK CONSTRAINT [FK_Person_Employee]
GO
/****** Object:  ForeignKey [FK_Password_Employee]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Password]  WITH CHECK ADD  CONSTRAINT [FK_Password_Employee] FOREIGN KEY([BusinessEntityId])
REFERENCES [HumanResources].[Employee] ([BusinessEntityId])
GO
ALTER TABLE [HumanResources].[Password] CHECK CONSTRAINT [FK_Password_Employee]
GO
/****** Object:  ForeignKey [FK_Timesheet_Person]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Person] FOREIGN KEY([BusinessEntityId])
REFERENCES [HumanResources].[Person] ([BusinessEntityId])
GO
ALTER TABLE [HumanResources].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Person]
GO
/****** Object:  ForeignKey [FK_Timesheet_Task]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Task] FOREIGN KEY([TaskId])
REFERENCES [HumanResources].[Task] ([TaskId])
GO
ALTER TABLE [HumanResources].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Task]
GO
/****** Object:  ForeignKey [FK_PersonProject_Person]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[PersonProject]  WITH CHECK ADD  CONSTRAINT [FK_PersonProject_Person] FOREIGN KEY([BusinessEntityId])
REFERENCES [HumanResources].[Person] ([BusinessEntityId])
GO
ALTER TABLE [HumanResources].[PersonProject] CHECK CONSTRAINT [FK_PersonProject_Person]
GO
/****** Object:  ForeignKey [FK_PersonProject_Task]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[PersonProject]  WITH CHECK ADD  CONSTRAINT [FK_PersonProject_Task] FOREIGN KEY([TaskId])
REFERENCES [HumanResources].[Task] ([TaskId])
GO
ALTER TABLE [HumanResources].[PersonProject] CHECK CONSTRAINT [FK_PersonProject_Task]
GO
/****** Object:  ForeignKey [FK_Attendance_Person]    Script Date: 03/31/2013 22:14:55 ******/
ALTER TABLE [HumanResources].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Person] FOREIGN KEY([BusinessEntityId])
REFERENCES [HumanResources].[Person] ([BusinessEntityId])
GO
ALTER TABLE [HumanResources].[Attendance] CHECK CONSTRAINT [FK_Attendance_Person]
GO
