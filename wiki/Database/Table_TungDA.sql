CREATE TABLE [HumanResources].[JobVacancy](
	[JobTitle] [nvarchar](50) NOT NULL,
	[VacancyName] [nvarchar](50) NOT NULL,
	[HiringManager] [nvarchar](50) NULL,
	[NoOfPos] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nchar](10) NOT NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_JobVacancy] PRIMARY KEY CLUSTERED 
(
	[VacancyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [LastModified]) VALUES (N'Developer', N'AndroidDev2', N'TungDA', 5, N'fsdf', N'Closed    ', CAST(0x0000A18300E83104 AS DateTime))
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [LastModified]) VALUES (N'Comtor', N'JapaneseComtor', N'TungTT', 0, N'', N'Closed    ', NULL)
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [LastModified]) VALUES (N'PM', N'SoftwarePM', N'KyNH', NULL, NULL, N'Active    ', NULL)
/****** Object:  Table [HumanResources].[CandidateStatus]    Script Date: 03/16/2013 17:11:00 ******/
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
/****** Object:  Table [HumanResources].[Attendance]    Script Date: 03/16/2013 17:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Attendance](
	[EmployeeName] [nvarchar](50) NOT NULL,
	[PunchIn] [datetime] NOT NULL,
	[PunchInNote] [nvarchar](max) NULL,
	[PunchOut] [datetime] NOT NULL,
	[PunchOutNote] [nvarchar](max) NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[EmployeeName] ASC,
	[PunchIn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCB017B4D90 AS DateTime), N'', CAST(0x00009FCB0188C2E0 AS DateTime), N'', NULL)
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCC00107AC0 AS DateTime), N'', CAST(0x00009FCC015A11C0 AS DateTime), N'', NULL)
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCC015A5810 AS DateTime), N'', CAST(0x00009FCC017B0740 AS DateTime), N'gf', NULL)
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCD00107AC0 AS DateTime), N'', CAST(0x00009FCD00C5C100 AS DateTime), N'sasd', NULL)
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCD015A11C0 AS DateTime), N'', CAST(0x00009FCD017B0740 AS DateTime), N'', NULL)
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCD017B4D90 AS DateTime), N'', CAST(0x00009FCD018B3BB0 AS DateTime), N'ert', NULL)
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FCE01186D10 AS DateTime), N'', CAST(0x00009FCE015A11C0 AS DateTime), N'', CAST(0x0000A18300E6A3C0 AS DateTime))
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FD0008C1360 AS DateTime), N'', CAST(0x00009FD0009450C0 AS DateTime), N'', CAST(0x0000A18300DDB56C AS DateTime))
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x00009FD1008C1360 AS DateTime), N'2', CAST(0x00009FD1009450C0 AS DateTime), N'1', CAST(0x0000A183011857F8 AS DateTime))
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Tô Tuấn Vinh', CAST(0x00009FEA00000000 AS DateTime), N'', CAST(0x00009FEA00A4CB80 AS DateTime), N'', NULL)
/****** Object:  Table [HumanResources].[JobCategories]    Script Date: 03/16/2013 17:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobCategories](
	[Name] [nvarchar](50) NOT NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_JobCategories] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of category' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCategories'
GO
INSERT [HumanResources].[JobCategories] ([Name], [LastModified]) VALUES (N'Admin Staff', CAST(0x0000A18300E4AE30 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [LastModified]) VALUES (N'Excutives', NULL)
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 03/16/2013 17:11:00 ******/
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
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_JobCandidate] PRIMARY KEY CLUSTERED 
(
	[FullName] ASC,
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'Đặng Quang Việt Dũng1', N'Chùa Bộc', N'Quảng Ninh', N'Quảng Ninh', N'12345', N'Vietnam', 123456789, 123456789, 123456789, N'dungdqv@gmail.com', N'JapaneseComtor', N'comtor', N'test', CAST(0x5D350B00 AS Date), N'Comtor', N'tungda', N'Interview Failed', N'Manual', CAST(0x0000A18300E7F090 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'dasds1', N'dasdas', N'dasdas', N'dasdsa', N'123', N'Afghanistan', 123, 123, 123, N'tungda@gmail.com1', N'AndroidDev', N'122', N'ads', CAST(0xEB360B00 AS Date), N'Comtor', N'212', N'Application Initiated', N'Online', NULL)
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'Đỗ Anh Tùng', N'Cổ Nhuế', N'Hà Nội', N'Hà Nội1', N'12345', N'Vietnam', 123456789, 123456789, 123456789, N'tungda@gmail.com', N'AndroidDev', N'Dev', N'Comment', CAST(0x26350B00 AS Date), N'Developer', N'KyNH', N'Hired', N'Online', NULL)
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'Tô Tuấn Vinh', N'Nguyễn Ngọc Vũ', N'Hà Nội', N'HCM', N'54321', N'Vietnam', 987654321, 987654321, 987654321, N'vinhtt@gmail.com', N'SoftwarePM', N'PM', N'Comment', CAST(0x9F350B00 AS Date), N'PM', N'KyNH', N'Rejected', N'Manual', NULL)
/****** Object:  Table [HumanResources].[Person]    Script Date: 03/16/2013 17:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Person](
	[BusinessEntityID] [int] NOT NULL,
	[Rank] [nvarchar](5) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[MiddleName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[SSNNumber] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](30) NULL,
	[AddressStreet] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Person records.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rank of person(Admin or User).' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of the person.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Middle name or middle initial of the person.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MiddleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of the person.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'LastName'
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
INSERT [HumanResources].[Person] ([BusinessEntityID], [Rank], [FirstName], [MiddleName], [LastName], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (1, N'Admin', N'Đỗ', N'Anh', N'Tùng', N'tungda@gmail.com', N'123456789', N'123456789', NULL, N'Ha Noi', N'Vietnam', N'Cau Giay', CAST(0x00009FCB00000000 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityID], [Rank], [FirstName], [MiddleName], [LastName], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (2, N'Admin', N'Đặng Quang', N'Việt', N'Dũng', N'dungdqv@gmail.com', N'123456789', N'123456789', NULL, N'Ha Noi', N'Vietnam', N'Cau Giay', CAST(0x00009FCB00000000 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityID], [Rank], [FirstName], [MiddleName], [LastName], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (3, N'Admin', N'Tô', N'Tuấn', N'Vinh', N'vinhtt@gmail.com', N'123456789', N'123456789', NULL, N'Ha Noi', N'Vietnam', N'Cau Giay', CAST(0x00009FCB00000000 AS DateTime))
/****** Object:  Table [HumanResources].[Password]    Script Date: 03/16/2013 17:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Password](
	[BusinessEntityID] [int] NOT NULL,
	[PasswordHash] [varchar](128) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Password_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
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
INSERT [HumanResources].[Password] ([BusinessEntityID], [PasswordHash], [ModifiedDate]) VALUES (1, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x00009FCB00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityID], [PasswordHash], [ModifiedDate]) VALUES (2, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x00009FCB00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityID], [PasswordHash], [ModifiedDate]) VALUES (3, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x00009FCB00000000 AS DateTime))
/****** Object:  Table [HumanResources].[JobTitle]    Script Date: 03/16/2013 17:11:00 ******/
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
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about job' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobTitle'
GO
SET IDENTITY_INSERT [HumanResources].[JobTitle] ON
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [LastModified]) VALUES (1, N'Comtor', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [LastModified]) VALUES (2, N'Developer', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [LastModified]) VALUES (3, N'PM', NULL, N'Admin Staff', NULL, NULL)
SET IDENTITY_INSERT [HumanResources].[JobTitle] OFF
/****** Object:  Table [HumanResources].[Employee]    Script Date: 03/16/2013 17:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Employee](
	[BusinessEntityID] [int] NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[JobId] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[SalariedFlag] [bit] NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'SalariedFlag'
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
INSERT [HumanResources].[Employee] ([BusinessEntityID], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate]) VALUES (1, N'tungda', 1, CAST(0x23180B00 AS Date), N'1', N'1', CAST(0x26350B00 AS Date), 1, 8, 8, 1, CAST(0x00009FEA00000000 AS DateTime))
INSERT [HumanResources].[Employee] ([BusinessEntityID], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [SalariedFlag], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate]) VALUES (2, N'vinhtt', 2, CAST(0xC3150B00 AS Date), N'1', N'1', CAST(0x46350B00 AS Date), 1, 8, 8, 1, CAST(0x00009FEB00000000 AS DateTime))
