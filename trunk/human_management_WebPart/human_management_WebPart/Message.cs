﻿public class Message
{
    //connection string
    internal const string ConnectionString = "Data Source=localhost;Initial Catalog=HRMORBIS;User ID=hr;Password=123456";
    internal const string Excel03ConString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;";
    internal const string Excel07ConString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;";

    //database table
    internal const string TableAttendance = "HumanResources.Attendance";
    internal const string TableJobTitle = "HumanResources.JobTitle";
    internal const string TableVacancy = "HumanResources.JobVacancy";
    internal const string TableCandidateStatus = "HumanResources.Candidatestatus";
    internal const string TableJobCandidate = "HumanResources.JobCandidate";
    internal const string TableUser = "HumanResources.Users";
    internal const string TableJobCategory = "HumanResources.JobCategories";
    internal const string TableEmployee = "HumanResources.Employee";
    internal const string TablePassword = "HumanResources.Password";
    internal const string TablePerson = "HumanResources.Person";
    internal const string TableCheckpointQuestion = "HumanResources.CheckpointQuestion";
    internal const string TableEvaluatePoint = "HumanResources.EvaluatePoint";
    internal const string TablePersonProject = "HumanResources.PersonProject";
    internal const string TableTask = "HumanResources.Task";
    internal const string TableProject = "HumanResources.Project";
    internal const string TableTimesheet = "HumanResources.Timesheet";
    internal const string TableDepartment = "HumanResources.Department";
    internal const string TableHistoryDepartment = "HumanResources.EmployeeDepartmentHistory";
    internal const string TableShift = "HumanResources.Shift";

    //database column
    internal const string PunchInColumn = "PunchIn";
    internal const string PunchOutColumn = "PunchOut";
    internal const string PunchInNoteColumn = "PunchInNote";
    internal const string PunchOutNoteColumn = "PunchOutNote";
    internal const string JobTitleColumn = "JobTitle";
    internal const string VacancyNameColumn = "VacancyName";
    internal const string StatusColumn = "Status";
    internal const string FullNameColumn = "FullName";
    internal const string EmailColumn = "Email";
    internal const string StreetColumn = "AddressStreet";
    internal const string CityColumn = "City";
    internal const string StateColumn = "State";
    internal const string ZipCodeColumn = "ZipCode";
    internal const string CountryColumn = "Country";
    internal const string HomePhoneColumn = "HomePhone";
    internal const string MobileColumn = "Mobile";
    internal const string WorkPhoneColumn = "WorkPhone";
    internal const string JobVacancyColumn = "JobVacancy";
    internal const string KeywordColumn = "Keywords";
    internal const string HiringManagerColumn = "HiringManager";
    internal const string MethodOfApplyColumn = "MethodOfApply";
    internal const string ApplyDateColumn = "ApplyDate";
    internal const string CommentColumn = "Comment";
    internal const string UserNameColumn = "LoginID";
    internal const string PasswordColumn = "PasswordHash";
    internal const string RankColumn = "Rank";
    internal const string NameColumn = "Name";
    internal const string JobDescriptionColumn = "JobDes";
    internal const string NoteColumn = "Note";
    internal const string JobCategoryColumn = "JobCategory";
    internal const string NumberOfPositionColumn = "NoOfPos";
    internal const string DescriptionColumn = "Description";
    internal const string BusinessEntityIDColumn = "BusinessEntityId";
    internal const string JobIDColumn = "JobID";
    internal const string LastModifiedColumn = "ModifiedDate";
    internal const string BirthDateColumn = "BirthDate";
    internal const string MaritalStatusColumn = "MaritalStatus";
    internal const string GenderColumn = "Gender";
    internal const string HireDateColumn = "HireDate";
    internal const string SalariedFlagColumn = "Salary";
    internal const string VacationHoursColumn = "VacationDate";
    internal const string SickLeaveHoursColumn = "SickLeaveDate";
    internal const string CurrentFlagColumn = "CurrentFlag";
    internal const string ModifiedDateColumn = "ModifiedDate";
    internal const string LoginIDColumn = "LoginID";
    internal const string QuestionIDColumn = "QuestionID";
    internal const string QuestionTitleColumn = "Title";
    internal const string AnserTypeColumn = "AnserType";
    internal const string PerfectLevelColumn = "PerfectLevel";
    internal const string GreatLevelColumn = "GreatLevel";
    internal const string NormalLevelColumn = "NormalLevel";
    internal const string BadLevelColumn = "BadLevel";
    internal const string VeryBadLevelColumn = "VeryBad";
    internal const string FirstNameColumn = "FirstName";
    internal const string MiddleNameColumn = "MiddleName";
    internal const string LastNameColumn = "LastName";
    internal const string QuarterColumn = "Quarter";
    internal const string PointColumn = "Point";
    internal const string AveragePointColumn = "AveragePoint";
    internal const string TotalPointColumn = "TotalPoint";
    internal const string TaskIdColumn = "TaskId";
    internal const string ProjectIDColumn = "ProjectID";
    internal const string ProjectNameColumn = "ProjectName";
    internal const string PersonNameColumn = "Name";
    internal const string TaskNameColumn = "TaskName";
    internal const string StartDateColumn = "StartDate";
    internal const string EndDateColumn = "EndDate";
    internal const string InterviewDateColumn = "InterviewDate";
    internal const string ImageColumn = "Image";
    internal const string EmailAddressColumn = "EmailAddress";
    internal const string AddressColumn = "AddressStreet";
    internal const string SSNNumberColumn = "SSNNumber";
    internal const string PersonProjectStartDateColumn = "StartDate";
    internal const string PersonProjectEndDateColumn = "EndDate";
    internal const string TaskDescriptionColumn = "TaskDes";
    internal const string TimesheetDateColumn = "WorkDate";
    internal const string TimesheetTimeColumn = "Time";
    internal const string TimesheetIDColumn = "TimesheetId";
    internal const string WorkDateColumn = "WorkDate";
    internal const string PersonProjectIdColumn = "PersonProjectId";
    internal const string ShiftIDColumn = "ShiftID";
    internal const string DepartmentIDColumn = "DepartmentID";

    //Page
    internal const string HomePage = "Home.aspx";
    internal const string PunchAttendancePage = "PunchAttendance.aspx";
    internal const string EditAttendancePage = "EditAttendance.aspx";
    internal const string AttendancePage = "AttendanceRecord.aspx";
    internal const string CandidatePage = "Candidates.aspx";
    internal const string EditCandidatePage = "EditCandidate.aspx";
    internal const string AddCandidatePage = "AddCandidate.aspx";
    internal const string PIMPage = "PersonalInfo.aspx";
    internal const string JobTitlePage = "JobTitles.aspx";
    internal const string AddJobTitlePage = "AddJobTitle.aspx";
    internal const string EditJobTitlePage = "EditJobTitle.aspx";
    internal const string VacancyPage = "Vacancies.aspx";
    internal const string AddVacancyPage = "AddVacancy.aspx";
    internal const string EditVacancyPage = "EditVacancy.aspx";
    internal const string EmployeeListPage = "EmployeeList.aspx";
    internal const string ListCheckpointQuestionPage = "QuestionList.aspx";
    internal const string AddCheckpointQuestionPage = "AddCheckpointQuestion.aspx";
    internal const string EditCheckpointQuestionPage = "EditQuestion.aspx";
    internal const string EvaluateEmployeePage = "EvaluateEmployee.aspx";
    internal const string ChangePasswordPage = "ChangePassword";
    internal const string AccessDeniedPage = "AccessDenied.aspx";
    internal const string SearchEmployeePage = "AssignEmployee.aspx";
    internal const string PersonProjectPage = "PersonProject.aspx";
    internal const string AssignLeavePage = "AssignLeave.aspx";
    internal const string AssignDayOffPage = "DayOff.aspx";
    internal const string UserHomePage = "User.aspx";
    internal const string AdminHomePage = "Admin.aspx";
    internal const string SupervisorJudgmentPage = "SupervisorJudgment.aspx";
    internal const string ApplyLeavePage = "ApplyLeave.aspx";
    internal const string MyLeavePage = "MyLeave.aspx";
    internal const string TimesheetPage = "MyTimesheet.aspx";
    internal const string ApproveTimesheetPage = "ApproveTimesheet.aspx";
    internal const string ViewEmployeeReportPage = "ViewEmployeeReport.aspx";
    internal const string ViewProjectReportPage = "ViewProjectReport.aspx";
    internal const string ProjectListPage = "ProjectList.aspx";
    internal const string AddProjectPage = "AddProject.aspx";
    internal const string EditProjectPage = "EditProject.aspx";
    internal const string AddTaskPage = "AddTask.aspx";
    internal const string EditTaskPage = "EditTask.aspx";
    internal const string TaskListPage = "TaskList.aspx";
    internal const string DailyAttendancePage = "DailyAttendance.aspx";
    internal const string EditEmployeePage = "EditEmployee.aspx";
    internal const string AddLeaveTypePage = "AddLeaveType.aspx";
    internal const string EditLeaveTypePage = "EditLeaveType.aspx";
    internal const string MyTimesheetPage = "MyTimesheet.aspx";
    internal const string EditMyTimesheetPage = "LogTimesheet.aspx";
    internal const string EditEmployeeDepartmentPage = "EditDepartment.aspx";
    internal const string MyDepartmentPage = "MyDepartment.aspx";
    internal const string MyTaskPage = "MyTask.aspx";

    //success sentences
    internal const string AffectedRow = "Success! Number of row affected is ";
    internal const string UpdateSuccess = "Update successfully!";

    //error sentences
    internal const string AcessDenied = "Access Denied";
    internal const string EmployeeNameError = "You must enter employee's name";
    internal const string NotChooseDate = "You must choose a date";
    internal const string NotChooseTime = "You must enter time (hh:mm)";
    internal const string InvalidDate = "Invalid date. Try again";
    internal const string InvalidDateTime = "Invalid date time. Try again";
    internal const string NotChooseFromToDate = "You must choose From and To date";
    internal const string PunchAttendanceError = "You must enter punch in and punch out time"; 
    internal const string PunchOutAfterPunchIn = "Punch Out time must be later than Punch In time";
    internal const string PunchIn = "You have Punch In in ";
    internal const string PunchOut = " and Punch Out in ";
    internal const string PunchInError = ",you can not Punch In in ";
    internal const string PunchOutError = ",you can not Punch Out in ";
    internal const string PunchDateError = "Invalid Punch In or Punch Out date";
    internal const string LastPunchOut = "Your last punch out is ";
    internal const string PunchOutAfterTime = ", you must enter the time after this time";
    internal const string LastPunchIn = "Your last punch in is "; 
    internal const string PunchInAfterTime = ", you must enter a time after punch in time";
    internal const string CandidateNameError = "You must enter candidate's name";
    internal const string EmailError = "You must enter email!"; 
    internal const string EmailContain = "Email must be contained @";
    internal const string ApplyDateError = "Apply Date must be DateTime type";
    internal const string PhoneError = "Home phone, Work phone and Mobile phone must be number"; 
    internal const string OldPassword = "You must enter old, new and confirm password";
    internal const string OldPasswordError = "Your old password is incorrect. Please try again";
    internal const string ConfirmPassword = "Your new password and confirm password are not the same. Please try again";
    internal const string UserName = "You must enter user name"; 
    internal const string Password = "You must enter password";
    internal const string InvalidUserPass = "Invalid username and password";
    internal const string Welcome = "Welcome ";
    internal const string CategoryNameError = "You must enter name of category";
    internal const string JobTitleError = "You must enter Job Title name";
    internal const string VacancyNameError = "You must enter name of vacancy"; 
    internal const string NumberOfPosition = "Number of positions must be a number";
    internal const string EmployeeName = "EmployeeName";
    internal const string InvalidExcel = "You must select an excel type file";
    internal const string StartRowColumnError = "You must enter start row and start column";
    internal const string InvalidStartRowColumn = "Start row and start integer must be number"; 
    internal const string NotSelectSheet = "You must select excel sheet";
    internal const string Excel2007Type = "This function only accepts excel 2007 type. Please convert your file first"; 
    internal const string NotEnterQuestion = "You must enter question";
    internal const string NotEnterAllLevel = "You must enter all levels";
    internal const string NotAnswerAll = "You must answer all questions"; 
    internal const string NotExistData = "There is no data matching your request";
    internal const string ToDateAfterFrom = "From date must be earlier than To date";
    internal const string NotHaveCheckPointYet = "You do not have supervisor judgment in this quarter<br /><br />"; 
    internal const string NotHaveLoginID = "This person doesn't have login ID";
    internal const string NotExistLoginID = "This login ID does not exist. If you just change employee login ID, please save first"; 
    internal const string AlreadyExistLoginID = "There are 2 or more people having the same login ID";
    internal const string NotEnterProjectName = "You must enter project's name";
    internal const string NotEnterStartEndDate = "You must enter start date and end date";
    internal const string AlreadyExistProject = "There is another project already having the same name , please choose other names"; 
    internal const string NotSelectProject = "You must select a project first";
    internal const string AlreadyExistTask = "There is another task in this project already having the same name, please choose other names ";
    internal const string StartLargeThanEnd = "Start date must be earlier than end date";
    internal const string ConfirmProject = "If you want to create a project without start date and end date. Please let these both field blank. If you don't, please choose a date for both field";
    internal const string ConfirmSave = "Are you sure that you want to save?";
    internal const string ConfirmDelete = "Are you sure that  you want to delete?";
    internal const string ConfirmChangePassword = "Are you sure that you want to change password?";
    internal const string NotChooseItemEdit = "You must choose an item";
    internal const string NotChooseItemDelete = "You must choose one or more items";
    internal const string AlreadyExistCategory = "There is another Job Category with the same name exists!";
    internal const string LitmitDateError = "Limit Date must be a natural number";
    internal const string DepartmentNameError = "You must enter name of department";
    internal const string AlreadyExistDepartment = "There is another Department with the same name exists!";
    internal const string NotEnterTime = "You must enter time";
    internal const string NotEnterWorkDate = "You must choose a work date";
    internal const string InvalidTime = "Time must be a number that smaller than 24 and larger than 0";
}