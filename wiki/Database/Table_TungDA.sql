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
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (1, N'def tùng', N'Note', NULL, NULL, NULL, NULL, NULL)
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (4, N'a', N'Level', N'Perfect1', N'Great2', N'OK3', N'Bad4', N'Very bad5')
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (5, N'bcd', N'Level', N'Perfect', N'Great', N'OK', N'Bad', N'Very bad')
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (6, N'c', N'Level', N'Perfect', N'Great', N'OK', N'Bad', N'Very bad')
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (7, N'jkld', N'YesNo', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] OFF
/****** Object:  Table [HumanResources].[CandidateStatus]    Script Date: 03/20/2013 23:06:39 ******/
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
/****** Object:  Table [HumanResources].[Attendance]    Script Date: 03/20/2013 23:06:39 ******/
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
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x0000A174008C1360 AS DateTime), N'', CAST(0x0000A174009450C0 AS DateTime), N'', CAST(0x0000A18600C3DAAC AS DateTime))
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x0000A175008C1360 AS DateTime), N'', CAST(0x0000A175009450C0 AS DateTime), N'', CAST(0x0000A18600C5196C AS DateTime))
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Đỗ Anh Tùng', CAST(0x0000A180008C1360 AS DateTime), N'', CAST(0x0000A180009450C0 AS DateTime), N'', CAST(0x0000A18600C57024 AS DateTime))
INSERT [HumanResources].[Attendance] ([EmployeeName], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [LastModified]) VALUES (N'Tô Tuấn Vinh', CAST(0x00009FEA00000000 AS DateTime), N'', CAST(0x00009FEA00A4CB80 AS DateTime), N'', NULL)
/****** Object:  Table [HumanResources].[JobCategories]    Script Date: 03/20/2013 23:06:39 ******/
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
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 03/20/2013 23:06:39 ******/
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
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'das', N'dasdas', N'dasdas', N'dasdsa', N'123', N'Afghanistan', 123, 123, 123, N'tungda@gmail.com1', N'AndroidDev2', N'122', N'ads', CAST(0x0A370B00 AS Date), N'Comtor', N'212', N'Application Initiated', N'Online', CAST(0x0000A18600DD3A60 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'Đỗ Anh Tùng', N'Cổ Nhuế', N'Hà Nội', N'Hà Nội1', N'12345', N'Vietnam', 123456789, 123456789, 123456789, N'tungda@gmail.com', N'AndroidDev', N'Dev', N'Comment', CAST(0x26350B00 AS Date), N'Developer', N'KyNH', N'Hired', N'Online', NULL)
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [LastModified]) VALUES (N'Tô Tuấn Vinh', N'Nguyễn Ngọc Vũ', N'Hà Nội', N'HCM', N'54321', N'Vietnam', 987654321, 987654321, 987654321, N'vinhtt@gmail.com', N'SoftwarePM', N'PM', N'Comment', CAST(0x9F350B00 AS Date), N'PM', N'KyNH', N'Rejected', N'Manual', NULL)
/****** Object:  Table [HumanResources].[EvaluatePoint]    Script Date: 03/20/2013 23:06:39 ******/
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
 CONSTRAINT [PK_EvaluatePoint] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[Quarter] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (1, 1, 1, 10, N'àdd', 9.2, 46)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (1, 1, 4, 10, N'', 9.2, 46)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (1, 1, 5, 8, N'', 9.2, 46)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (1, 1, 6, 8, N'', 9.2, 46)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (1, 1, 7, 10, N'', 9.2, 46)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (2, 1, 1, 10, N'uio', 10, 50)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (2, 1, 4, 10, N'', 10, 50)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (2, 1, 5, 10, N'', 10, 50)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (2, 1, 6, 10, N'', 10, 50)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (2, 1, 7, 10, N'', 10, 50)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (3, 1, 1, 5, N'12', 7.4, 37)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (3, 1, 4, 6, N'', 7.4, 37)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (3, 1, 5, 8, N'', 7.4, 37)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (3, 1, 6, 8, N'', 7.4, 37)
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint]) VALUES (3, 1, 7, 10, N'', 7.4, 37)
/****** Object:  Table [HumanResources].[JobVacancy]    Script Date: 03/20/2013 23:06:43 ******/
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
/****** Object:  Table [HumanResources].[JobTitle]    Script Date: 03/20/2013 23:06:43 ******/
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