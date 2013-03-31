USE [HRMORBIS]
GO
/****** Object:  Table [HumanResources].[Shift]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[Shift] ON
INSERT [HumanResources].[Shift] ([ShiftID], [Name], [StartTime], [EndTime], [ModifiedDate]) VALUES (2, N'Shift1', CAST(0x070048F9F66C0000 AS Time), CAST(0x0700E80A7E8E0000 AS Time), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[Shift] ([ShiftID], [Name], [StartTime], [EndTime], [ModifiedDate]) VALUES (4, N'Shift2', CAST(0x070040230E430000 AS Time), CAST(0x0700E03495640000 AS Time), CAST(0x0000A18A00000000 AS DateTime))
SET IDENTITY_INSERT [HumanResources].[Shift] OFF
/****** Object:  Table [HumanResources].[Project]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[Project] ON
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (2, N'Healing on Sapa', NULL, CAST(0xE4360B00 AS Date), CAST(0xED360B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (3, N'Environment', NULL, CAST(0xEE360B00 AS Date), CAST(0x09370B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (4, N'Catch the fish', NULL, CAST(0x0E370B00 AS Date), CAST(0x28370B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (6, N'Leave', NULL, CAST(0x94360B00 AS Date), CAST(0x01380B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Project] OFF
/****** Object:  Table [HumanResources].[Department]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[Department] ON
INSERT [HumanResources].[Department] ([DepartmentID], [Name], [ModifiedDate]) VALUES (1, N'Test1', CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[Department] ([DepartmentID], [Name], [ModifiedDate]) VALUES (3, N'Test2', CAST(0x0000A18A00000000 AS DateTime))
SET IDENTITY_INSERT [HumanResources].[Department] OFF
/****** Object:  Table [HumanResources].[CheckpointQuestion]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] ON
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (0, N'1', N'YesNo', NULL, NULL, NULL, NULL, NULL)
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (1, N'2', N'Note', NULL, NULL, NULL, NULL, NULL)
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (2, N'3', N'Level', N'Perfect', N'Great', N'OK', N'Bad', N'Very bad')
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] OFF
/****** Object:  Table [HumanResources].[CandidateStatus]    Script Date: 03/31/2013 14:21:36 ******/
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Application Initiated')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Hired')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Failed')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Passed')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Schedule')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Job Offerd')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Offer Decline')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Rejected')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Shortlisted')
/****** Object:  Table [HumanResources].[EvaluatePoint]    Script Date: 03/31/2013 14:21:36 ******/
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (4, 1, 0, 10, N'', 8.666667, 26, CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (4, 1, 1, 8, N'zbbc', 8.666667, 26, CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (4, 1, 2, 8, N'', 8.666667, 26, CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (6, 1, 0, 10, N'', 7.666667, 23, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (6, 1, 1, 7, N'hjbjk', 7.666667, 23, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (6, 1, 2, 6, N'', 7.666667, 23, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (8, 1, 0, 0, N'', 5.666667, 17, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (8, 1, 1, 7, N',jbn', 5.666667, 17, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (8, 1, 2, 10, N'', 5.666667, 17, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (9, 1, 0, 0, N'', 3.333333, 10, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (9, 1, 1, 8, N'trdfg', 3.333333, 10, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (9, 1, 2, 2, N'', 3.333333, 10, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (10, 1, 0, 10, N'', 9.666667, 29, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (10, 1, 1, 9, N'fsdf', 9.666667, 29, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (10, 1, 2, 10, N'', 9.666667, 29, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (15, 1, 0, 10, N'', 10, 30, CAST(0xEC360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (15, 1, 1, 10, N'bjhbjh', 10, 30, CAST(0xEC360B00 AS Date))
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityID], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (15, 1, 2, 10, N'', 10, 30, CAST(0xEC360B00 AS Date))
/****** Object:  Table [HumanResources].[JobCategories]    Script Date: 03/31/2013 14:21:36 ******/
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Admin Staff', NULL)
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Excutives', NULL)
/****** Object:  Table [HumanResources].[JobTitle]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[JobTitle] ON
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (5, N'Call Center Agent', NULL, N'Admin Staff', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (6, N'Floor Supervisor', NULL, N'Admin Staff', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (7, N'HR Executive', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (8, N'Manager - Customer Care', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (11, N'12345', N'', N'Excutives', N'', CAST(0x0000A18D014E83F0 AS DateTime))
SET IDENTITY_INSERT [HumanResources].[JobTitle] OFF
/****** Object:  Table [HumanResources].[Task]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[Task] ON
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (1, 2, N'Preparing the plane', NULL, CAST(0xE6360B00 AS Date), CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (2, 2, N'Flying', NULL, CAST(0xE8360B00 AS Date), CAST(0xEA360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (3, 2, N'Healing', NULL, CAST(0xEA360B00 AS Date), CAST(0xED360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (4, 3, N'Preparing the plane', NULL, CAST(0xEE360B00 AS Date), CAST(0xFC360B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (5, 3, N'Flying', NULL, CAST(0xFC360B00 AS Date), CAST(0x09370B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (6, 4, N'Healing', NULL, CAST(0x0E370B00 AS Date), CAST(0x28370B00 AS Date))
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate]) VALUES (7, 6, N'Leave Holiday', NULL, CAST(0xEC360B00 AS Date), CAST(0xF1360B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Task] OFF
/****** Object:  Table [HumanResources].[JobVacancy]    Script Date: 03/31/2013 14:21:36 ******/
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'12345', N'vacancy1', NULL, NULL, NULL, N'True      ', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [HiringManager], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'12345', N'vacancy2', NULL, NULL, NULL, N'True      ', CAST(0x0000A18E00000000 AS DateTime))
/****** Object:  Table [HumanResources].[Employee]    Script Date: 03/31/2013 14:21:36 ******/
SET IDENTITY_INSERT [HumanResources].[Employee] ON
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (3, N'vinhtt1', 11, CAST(0x02160B00 AS Date), N'S', N'M', NULL, 500000.0000, NULL, NULL, 1, CAST(0x0000A19200DC4A24 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (4, N'tungda', 11, CAST(0x40160B00 AS Date), N'S', N'M', NULL, 5000000.0000, NULL, NULL, 1, CAST(0x0000A19200DC48F8 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (6, N'dungdqv1', 11, CAST(0x30170B00 AS Date), N'S', N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19200DC48F8 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (8, N'tungnt', 11, CAST(0xBD180B00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19200DC4A24 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (9, N'khanhnh', 11, CAST(0x481A0B00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19200DC4A24 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (10, N'kynh', 11, CAST(0xF5EA0A00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19200DC4A24 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (14, N'MJ', 11, NULL, NULL, NULL, CAST(0xE9360B00 AS Date), 0.0000, NULL, NULL, 1, CAST(0x0000A19200DC48F8 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (15, N'tungda1', 11, CAST(0x30170B00 AS Date), NULL, NULL, NULL, 500000.0000, NULL, NULL, 1, CAST(0x0000A19200DC48F8 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (28, N'test', 11, CAST(0x30170B00 AS Date), N' ', NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A18E00000000 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationHours], [SickLeaveHours], [CurrentFlag], [ModifiedDate], [Image]) VALUES (29, NULL, NULL, CAST(0x3D160B00 AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A19000000000 AS DateTime), NULL)
SET IDENTITY_INSERT [HumanResources].[Employee] OFF
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 03/31/2013 14:21:36 ******/
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'assdas', N'', N'', N'', N'', N'Afghanistan', 0, 0, 0, N'a@fsd', N'vacancy1', N'', N'', NULL, N'12345', N'', N'Interview Schedule', N'Online', CAST(0x0000A18E013B549C AS DateTime), CAST(0x0000A18E008C1360 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'candidate2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'b@b', N'vacancy2', NULL, NULL, NULL, N'12345', NULL, N'Interview Schedule', NULL, NULL, CAST(0x0000A1A600000000 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'candidate3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sa@as', NULL, NULL, NULL, NULL, NULL, NULL, N'Hired', NULL, NULL, NULL)
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [State], [ZipCode], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Keywords], [Comment], [ApplyDate], [JobTitle], [HiringManager], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'czxczx', N'', N'', N'', N'', N'Afghanistan', 0, 0, 0, N'xxs@fds', N'vacancy1', N'', N'', NULL, N'12345', N'', N'Application Initiated', N'Online', CAST(0x0000A18E013B78F0 AS DateTime), CAST(0x0000A18E009450C0 AS DateTime))
/****** Object:  Table [HumanResources].[EmployeeDepartmentHistory]    Script Date: 03/31/2013 14:21:36 ******/
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (4, 1, 2, CAST(0xE5360B00 AS Date), CAST(0xE7360B00 AS Date), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (4, 1, 4, CAST(0xEE360B00 AS Date), CAST(0x0B370B00 AS Date), CAST(0x0000A18A00000000 AS DateTime))
/****** Object:  Table [HumanResources].[Person]    Script Date: 03/31/2013 14:21:37 ******/
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (3, N'User', N'To Tuan Vinh', N'vinhtt@gmail.com', N'', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC4A24 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (4, N'Admin', N'Do Anh Tung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC48F8 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (6, N'User', N'Dang Quang Viet Dung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC48F8 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (8, N'Admin', N'Nguyen Thanh Tung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC4A24 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (9, N'Admin', N'Nguyen Ngoc Khanh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC4A24 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (10, N'Admin', N'Nguyen Hong Ky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC4A24 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (14, N'User', N'Michael Jackson', N'MJ@gmail.com', N'123456789', N'12345678', NULL, N'New York', N'United States', N'Wall', CAST(0x0000A19200DC48F8 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (15, N'Admin', N'Do Anh Tung', N'tungda1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19200DC48F8 AS DateTime))
/****** Object:  Table [HumanResources].[Password]    Script Date: 03/31/2013 14:21:37 ******/
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (3, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18900000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (4, N'2320EDD3777E93220768A4AF8FC6CD21', CAST(0x0000A18A00098C88 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (6, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (8, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (9, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (10, N'E10ADC3949BA59ABBE56E057F20F883E', CAST(0x0000A18E00000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (14, N'F32D2C8C67D9A5D6C12CB68F25867A14', CAST(0x0000A18E0174CD80 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (15, N'CB21A853D73FCC6B298755DA0F9B948C', CAST(0x0000A19000000000 AS DateTime))
INSERT [HumanResources].[Password] ([BusinessEntityId], [PasswordHash], [ModifiedDate]) VALUES (28, N'2320EDD3777E93220768A4AF8FC6CD21', CAST(0x0000A19000000000 AS DateTime))
/****** Object:  Table [HumanResources].[Timesheet]    Script Date: 03/31/2013 14:21:37 ******/
SET IDENTITY_INSERT [HumanResources].[Timesheet] ON
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (2, 4, 3, 7, CAST(0xE9360B00 AS Date), N'abcd', 0, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (3, 4, 3, 7, CAST(0xE9360B00 AS Date), N'asdas', 0, CAST(0xEA360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (4, 4, 3, 7, CAST(0xE9360B00 AS Date), N'jashd', 0, CAST(0xEB360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (5, 4, 4, 7, CAST(0xE9360B00 AS Date), N'asd', 1, CAST(0xE8360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (6, 4, 4, 7, CAST(0xE9360B00 AS Date), N'dasd', 1, CAST(0xE7360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (7, 4, 3, 7, CAST(0xE9360B00 AS Date), N'jashd', 0, CAST(0xEC360B00 AS Date))
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate]) VALUES (10, 4, 15, 7, CAST(0xE9360B00 AS Date), N'dá', 0, CAST(0xEC360B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Timesheet] OFF
/****** Object:  Table [HumanResources].[PersonProject]    Script Date: 03/31/2013 14:21:37 ******/
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (3, 7, NULL, 0, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (4, 7, NULL, 0, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (6, 7, NULL, 1, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (8, 7, NULL, 1, CAST(0xE9360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate]) VALUES (9, 7, NULL, 0, CAST(0xE9360B00 AS Date))
/****** Object:  Table [HumanResources].[Attendance]    Script Date: 03/31/2013 14:21:37 ******/
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
