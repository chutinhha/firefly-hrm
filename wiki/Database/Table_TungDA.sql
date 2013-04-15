USE [HRMORBIS]
GO
/****** Object:  Table [HumanResources].[Shift]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[Shift] ON
INSERT [HumanResources].[Shift] ([ShiftID], [Name], [StartTime], [EndTime], [ModifiedDate]) VALUES (2, N'Shift1', CAST(0x070048F9F66C0000 AS Time), CAST(0x0700E80A7E8E0000 AS Time), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[Shift] ([ShiftID], [Name], [StartTime], [EndTime], [ModifiedDate]) VALUES (4, N'Shift2', CAST(0x070040230E430000 AS Time), CAST(0x0700E03495640000 AS Time), CAST(0x0000A18A00000000 AS DateTime))
SET IDENTITY_INSERT [HumanResources].[Shift] OFF
/****** Object:  Table [HumanResources].[Project]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[Project] ON
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (1, N'Healing in Spa', NULL, NULL, NULL)
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (2, N'Fishing', NULL, NULL, NULL)
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (3, N'Watching', NULL, NULL, NULL)
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (4, N'Reading', NULL, NULL, NULL)
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (5, N'Leave like a dog', NULL, NULL, NULL)
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (6, N'Leave', NULL, NULL, NULL)
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (7, N'HVN', N'', CAST(0xEE360B00 AS Date), CAST(0x0B370B00 AS Date))
INSERT [HumanResources].[Project] ([ProjectId], [ProjectName], [Note], [StartDate], [EndDate]) VALUES (10, N'AnserWeb', N'', CAST(0xEE360B00 AS Date), CAST(0x0B370B00 AS Date))
SET IDENTITY_INSERT [HumanResources].[Project] OFF
/****** Object:  Table [HumanResources].[Department]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[Department] ON
INSERT [HumanResources].[Department] ([DepartmentID], [Name], [ModifiedDate]) VALUES (1, N'IT Department', CAST(0x0000A1A100B15D78 AS DateTime))
INSERT [HumanResources].[Department] ([DepartmentID], [Name], [ModifiedDate]) VALUES (3, N'Sale Department', CAST(0x0000A1A100B165AC AS DateTime))
SET IDENTITY_INSERT [HumanResources].[Department] OFF
/****** Object:  Table [HumanResources].[CheckpointQuestion]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] ON
INSERT [HumanResources].[CheckpointQuestion] ([QuestionID], [Title], [AnserType], [PerfectLevel], [GreatLevel], [NormalLevel], [BadLevel], [VeryBad]) VALUES (3, N'Does the employee have the ability to adequately communicate with peers, managers, and customers?', N'Level', N'Perfect', N'Great', N'OK', N'Bad', N'Very bad')
SET IDENTITY_INSERT [HumanResources].[CheckpointQuestion] OFF
/****** Object:  Table [HumanResources].[CandidateStatus]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Application Initiated')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Hired')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Failed')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Passed')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Interview Schedule')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Job Offerd')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Offer Decline')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Rejected')
INSERT [HumanResources].[CandidateStatus] ([Status]) VALUES (N'Shortlisted')
/****** Object:  Table [HumanResources].[JobCategories]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Admin Staff', NULL)
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Craft Workers', CAST(0x0000A1940153351C AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Excutives', NULL)
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Laborers and Helpers', CAST(0x0000A194015346B0 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Office and Clerical Workers', CAST(0x0000A19401535CF4 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Officials and Managers', CAST(0x0000A19401536C30 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Operatives', CAST(0x0000A19401537914 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Professionals', CAST(0x0000A1940153897C AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Sales Workers', CAST(0x0000A1940153978C AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Service Workers', CAST(0x0000A1940153A470 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'staff', NULL)
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Technical Officer', CAST(0x0000A1940153B028 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'Technicians', CAST(0x0000A1940153BE38 AS DateTime))
INSERT [HumanResources].[JobCategories] ([Name], [ModifiedDate]) VALUES (N'test', CAST(0x0000A199012178B0 AS DateTime))
/****** Object:  Table [HumanResources].[JobTitle]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[JobTitle] ON
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (5, N'Call Center Agent', NULL, N'Admin Staff', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (6, N'Floor Supervisor', NULL, N'Admin Staff', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (7, N'HR Executive', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (8, N'Manager - Customer Care', NULL, N'Excutives', NULL, NULL)
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (11, N'12345', N'', N'Excutives', N'', CAST(0x0000A18D014E83F0 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (12, N'Project Manager', N'aslkdjsndsadsadcsa cdad sadf', N'Admin Staff', N'', CAST(0x0000A1930107E314 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (13, N'Accountant', N'', N'Office and Clerical Workers', N'', CAST(0x0000A1940156312C AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (14, N'Audit Trainee', N'', N'Office and Clerical Workers', N'', CAST(0x0000A1940156AC38 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (15, N'Cheif Executive Office', N'Chief Operating Office. The leader and head of the organization', N'Officials and Managers', N'', CAST(0x0000A19401570C50 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (16, N'Controller', N'', N'Officials and Managers', N'', CAST(0x0000A1940157203C AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (17, N'Finance Manager', N'Company budgets and expenditures', N'Officials and Managers', N'', CAST(0x0000A19A01461A08 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (18, N'HR Admin', N'Deals with the labour force in the organization', N'Officials and Managers', N'', CAST(0x0000A19401575750 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (19, N'Industrial Engineer', N'', N'Technical Officer', N'', CAST(0x0000A19401576FEC AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (20, N'IT Manager', N'Information Technology Manager', N'Technical Officer', N'', CAST(0x0000A19401578D38 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (21, N'Pre-Sales Executive', N'', N'Sales Workers', N'', CAST(0x0000A19401579FF8 AS DateTime))
INSERT [HumanResources].[JobTitle] ([JobId], [JobTitle], [JobDes], [JobCategory], [Note], [ModifiedDate]) VALUES (22, N'Program Manager', N'', N'Officials and Managers', N'', CAST(0x0000A1940157B18C AS DateTime))
SET IDENTITY_INSERT [HumanResources].[JobTitle] OFF
/****** Object:  Table [HumanResources].[Task]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[Task] ON
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (1, 6, N'Holiday', NULL, NULL, CAST(0xFB360B00 AS Date), NULL)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (2, 6, N'Nghi de', NULL, NULL, CAST(0xFE360B00 AS Date), 7)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (3, 2, N'Healing', NULL, CAST(0xEA360B00 AS Date), CAST(0xED360B00 AS Date), NULL)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (4, 3, N'Preparing the plane', NULL, CAST(0xEE360B00 AS Date), CAST(0xFC360B00 AS Date), NULL)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (5, 3, N'Flying', NULL, CAST(0xFC360B00 AS Date), CAST(0x09370B00 AS Date), NULL)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (6, 6, N'Tet Holiday', NULL, CAST(0x0E370B00 AS Date), CAST(0x28370B00 AS Date), 10)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (7, 6, N'Leave Holiday', NULL, CAST(0xEC360B00 AS Date), CAST(0x02370B00 AS Date), NULL)
INSERT [HumanResources].[Task] ([TaskId], [ProjectId], [TaskName], [Note], [StartDate], [EndDate], [LimitDate]) VALUES (8, 2, N'Prepare task', N'Plan prepare', CAST(0xEE360B00 AS Date), CAST(0xEE360B00 AS Date), NULL)
SET IDENTITY_INSERT [HumanResources].[Task] OFF
/****** Object:  Table [HumanResources].[JobVacancy]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'Controller', N'Vacancy for Controller', 2, N'Vacancy for the Fat Controller', N'Active    ', CAST(0x0000A19A01567650 AS DateTime))
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'Finance Manager', N'Vacancy for Finance Manager', 0, N'', N'Active    ', CAST(0x0000A19401682B20 AS DateTime))
INSERT [HumanResources].[JobVacancy] ([JobTitle], [VacancyName], [NoOfPos], [Description], [Status], [ModifiedDate]) VALUES (N'IT Manager', N'Vacancy for Manager IT', 1, N'', N'Active    ', CAST(0x0000A194016807F8 AS DateTime))
/****** Object:  Table [HumanResources].[Employee]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[Employee] ON
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationDate], [SickLeaveDate], [CurrentFlag], [ModifiedDate], [Image]) VALUES (6, N'dungdqv1', 11, CAST(0x30170B00 AS Date), N'S', N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19301088850 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationDate], [SickLeaveDate], [CurrentFlag], [ModifiedDate], [Image]) VALUES (8, N'tungnt', 11, CAST(0xBD180B00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19301088850 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationDate], [SickLeaveDate], [CurrentFlag], [ModifiedDate], [Image]) VALUES (9, N'khanhnh', 11, CAST(0x481A0B00 AS Date), NULL, N'M', NULL, 0.0000, NULL, NULL, 1, CAST(0x0000A19301088850 AS DateTime), NULL)
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationDate], [SickLeaveDate], [CurrentFlag], [ModifiedDate], [Image]) VALUES (107, N'tungda01659', 15, NULL, NULL, NULL, NULL, 2000.0000, NULL, NULL, 1, CAST(0x0000A197001DC388 AS DateTime), N'107_04 - WG2009.jpg')
INSERT [HumanResources].[Employee] ([BusinessEntityId], [LoginID], [JobId], [BirthDate], [MaritalStatus], [Gender], [HireDate], [Salary], [VacationDate], [SickLeaveDate], [CurrentFlag], [ModifiedDate], [Image]) VALUES (108, N'vinhtt4c', 16, CAST(0xA7170B00 AS Date), N'S', N'M', NULL, 3000.0000, NULL, NULL, 1, CAST(0x0000A19E01342AA0 AS DateTime), N'108_4a34d9b6_bottom_theme_2copy1.jpg')
SET IDENTITY_INSERT [HumanResources].[Employee] OFF
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Comment], [ApplyDate], [JobTitle], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'Harsha Silva', N'', N'', N'Thailand', 0, 0, 0, N'anthony@orangehrm.com', N'Vacancy for Finance Manager', N'', CAST(0xE2360B00 AS Date), N'Finance Manager', N'Interview Passed', N'Online', CAST(0x0000A19A01564194 AS DateTime), CAST(0x0000A1920107AC00 AS DateTime))
INSERT [HumanResources].[JobCandidate] ([FullName], [AddressStreet], [City], [Country], [HomePhone], [Mobile], [WorkPhone], [Email], [JobVacancy], [Comment], [ApplyDate], [JobTitle], [Status], [MethodOfApply], [ModifiedDate], [InterviewDate]) VALUES (N'Ryan Parker', N'Wall', N'New York', N'United States', 123456789, 123456789, 123456789, N'jane@jn.com', N'Vacancy for Controller', N'', CAST(0xE3360B00 AS Date), N'Accountant', N'Interview Schedule', N'Online', CAST(0x0000A1940168C6FC AS DateTime), CAST(0x0000A19900A4CB80 AS DateTime))
/****** Object:  Table [HumanResources].[EvaluatePoint]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[EvaluatePoint] ([BusinessEntityId], [Quarter], [QuestionID], [Point], [Note], [AveragePoint], [TotalPoint], [ModifiedDate]) VALUES (108, 2, 3, 10, NULL, 10, 10, CAST(0xEE360B00 AS Date))
/****** Object:  Table [HumanResources].[EmployeeDepartmentHistory]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (107, 1, 2, CAST(0xE5360B00 AS Date), CAST(0xE7360B00 AS Date), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (107, 1, 4, CAST(0xEE360B00 AS Date), CAST(0x0B370B00 AS Date), CAST(0x0000A18A00000000 AS DateTime))
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (107, 3, 2, CAST(0xFE360B00 AS Date), CAST(0x01370B00 AS Date), CAST(0x0000A19D00C1F458 AS DateTime))
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (107, 1, 2, CAST(0x01370B00 AS Date), NULL, CAST(0x0000A19D01219BD8 AS DateTime))
INSERT [HumanResources].[EmployeeDepartmentHistory] ([BusinessEntityId], [DepartmentID], [ShiftID], [StartDate], [EndDate], [ModifiedDate]) VALUES (108, 3, 2, CAST(0x0B370B00 AS Date), NULL, CAST(0x0000A1A000000000 AS DateTime))
/****** Object:  Table [HumanResources].[Person]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (6, N'User', N'Dang Quang Viet Dung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19301088850 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (8, N'Admin', N'Nguyen Thanh Tung', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19301088850 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (9, N'Admin', N'Vo Hoang Nhat Khanh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19301088850 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (107, N'Admin', N'Do Anh Tung', N'tungda01659@gmai.com', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A197001DC388 AS DateTime))
INSERT [HumanResources].[Person] ([BusinessEntityId], [Rank], [Name], [EmailAddress], [HomePhone], [Mobile], [SSNNumber], [City], [Country], [AddressStreet], [ModifiedDate]) VALUES (108, N'User', N'To Tuan Vinh', N'', N'', N'', N'', N'', N'None', N'', CAST(0x0000A19E01342AA0 AS DateTime))
/****** Object:  Table [HumanResources].[Timesheet]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[Timesheet] ON
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (25, 4, 108, 2, CAST(0xEE360B00 AS Date), N'sbc', 1, CAST(0xEE360B00 AS Date), NULL)
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (26, 4, 108, 2, CAST(0xEE360B00 AS Date), N'sbc', 1, CAST(0xEF360B00 AS Date), NULL)
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (27, 8, 108, 7, CAST(0xF9360B00 AS Date), N'sbc', 1, CAST(0xFE360B00 AS Date), NULL)
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (28, 4, 108, 8, CAST(0xEE360B00 AS Date), N'sbc', 1, CAST(0xEE360B00 AS Date), NULL)
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (29, 4, 108, 3, CAST(0xF9360B00 AS Date), NULL, 0, CAST(0xF8360B00 AS Date), NULL)
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (30, 4, 108, 3, CAST(0xF9360B00 AS Date), NULL, 0, CAST(0x0B370B00 AS Date), NULL)
INSERT [HumanResources].[Timesheet] ([TimesheetId], [Time], [BusinessEntityId], [TaskId], [ModifiedDate], [TaskDes], [CurrentFlag], [WorkDate], [Comment]) VALUES (31, 4, 108, 3, CAST(0xFB360B00 AS Date), NULL, 0, CAST(0xEE360B00 AS Date), NULL)
SET IDENTITY_INSERT [HumanResources].[Timesheet] OFF
/****** Object:  Table [HumanResources].[PersonProject]    Script Date: 04/15/2013 22:32:16 ******/
SET IDENTITY_INSERT [HumanResources].[PersonProject] ON
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (4, 8, 2, NULL, 1, CAST(0xF8360B00 AS Date), NULL, NULL)
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (6, 107, 2, NULL, 1, CAST(0xF8360B00 AS Date), NULL, NULL)
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (7, 108, 1, N'', 1, CAST(0xF8360B00 AS Date), CAST(0xF8360B00 AS Date), CAST(0xFC360B00 AS Date))
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (8, 108, 2, N'', 1, CAST(0xFC360B00 AS Date), CAST(0xFC360B00 AS Date), CAST(0x00370B00 AS Date))
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (9, 108, 7, N'', 1, CAST(0x00370B00 AS Date), CAST(0x00370B00 AS Date), CAST(0x01370B00 AS Date))
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (11, 8, 6, NULL, 1, CAST(0xFC360B00 AS Date), NULL, NULL)
INSERT [HumanResources].[PersonProject] ([PersonProjectId], [BusinessEntityId], [TaskId], [Note], [CurrentFlag], [ModifiedDate], [StartDate], [EndDate]) VALUES (12, 107, 6, NULL, 1, CAST(0xFC360B00 AS Date), NULL, NULL)
SET IDENTITY_INSERT [HumanResources].[PersonProject] OFF
/****** Object:  Table [HumanResources].[Attendance]    Script Date: 04/15/2013 22:32:16 ******/
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (107, CAST(0x0000A193010537E0 AS DateTime), N'', CAST(0x0000A19301054398 AS DateTime), N'', CAST(0x0000A19301054398 AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (107, CAST(0x0000A1AB00000000 AS DateTime), N'', CAST(0x0000A1AB005265C0 AS DateTime), N'', CAST(0x0000A1A100F7326C AS DateTime))
INSERT [HumanResources].[Attendance] ([BusinessEntityId], [PunchIn], [PunchInNote], [PunchOut], [PunchOutNote], [ModifiedDate]) VALUES (108, CAST(0x0000A1A101591BA8 AS DateTime), N'', CAST(0x0000A1A101591BA8 AS DateTime), NULL, CAST(0x0000A1A101591BA8 AS DateTime))
