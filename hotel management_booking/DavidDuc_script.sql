USE [master]
GO
/****** Object:  Database [DavidDucHotel]    Script Date: 07/18/2013 00:31:52 ******/
CREATE DATABASE [DavidDucHotel] ON  PRIMARY 
( NAME = N'DavidDucHotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DavidDucHotel.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DavidDucHotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DavidDucHotel_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DavidDucHotel] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DavidDucHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DavidDucHotel] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DavidDucHotel] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DavidDucHotel] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DavidDucHotel] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DavidDucHotel] SET ARITHABORT OFF
GO
ALTER DATABASE [DavidDucHotel] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DavidDucHotel] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DavidDucHotel] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DavidDucHotel] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DavidDucHotel] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DavidDucHotel] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DavidDucHotel] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DavidDucHotel] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DavidDucHotel] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DavidDucHotel] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DavidDucHotel] SET  DISABLE_BROKER
GO
ALTER DATABASE [DavidDucHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DavidDucHotel] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DavidDucHotel] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DavidDucHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DavidDucHotel] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DavidDucHotel] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DavidDucHotel] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DavidDucHotel] SET  READ_WRITE
GO
ALTER DATABASE [DavidDucHotel] SET RECOVERY FULL
GO
ALTER DATABASE [DavidDucHotel] SET  MULTI_USER
GO
ALTER DATABASE [DavidDucHotel] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DavidDucHotel] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DavidDucHotel', N'ON'
GO
USE [DavidDucHotel]
GO
/****** Object:  User [kynh]    Script Date: 07/18/2013 00:31:52 ******/
CREATE USER [kynh] FOR LOGIN [kynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserLevel] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[BuildingManage] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserAccount] ON
INSERT [dbo].[UserAccount] ([UserID], [UserLevel], [UserName], [Password], [FullName], [PhoneNumber], [Address], [Email], [BuildingManage], [Status]) VALUES (1, 1, N'TungDA', N'E10ADC3949BA59ABBE56E057F20F883E', N'Ð A T', N'12345', N'sadas', N'tungda01659@fpt.edu.vn', NULL, 1)
INSERT [dbo].[UserAccount] ([UserID], [UserLevel], [UserName], [Password], [FullName], [PhoneNumber], [Address], [Email], [BuildingManage], [Status]) VALUES (8, 3, N'KyNH', N'E10ADC3949BA59ABBE56E057F20F883E', N'Nguyễn Hồng Kỳ', N'123456789', N'Phạm Hùng', N'tungda01659@fpt.edu.vn', NULL, 1)
INSERT [dbo].[UserAccount] ([UserID], [UserLevel], [UserName], [Password], [FullName], [PhoneNumber], [Address], [Email], [BuildingManage], [Status]) VALUES (9, 2, N'davidduc', N'E10ADC3949BA59ABBE56E057F20F883E', N'Vũ Tiến Đức', N'123456789', N'Phạm Hùng', N'tungda01659@gmail.com', N'2|4|1|', 1)
INSERT [dbo].[UserAccount] ([UserID], [UserLevel], [UserName], [Password], [FullName], [PhoneNumber], [Address], [Email], [BuildingManage], [Status]) VALUES (14, 2, N'duc123', N'E10ADC3949BA59ABBE56E057F20F883E', N'Vũ Tiến Đức', N'123456789', N'Phạm Hùng', N'tungda01659@fpt.edu.vn', N'3|', 1)
INSERT [dbo].[UserAccount] ([UserID], [UserLevel], [UserName], [Password], [FullName], [PhoneNumber], [Address], [Email], [BuildingManage], [Status]) VALUES (15, 1, N'test', N'098F6BCD4621D373CADE4E832627B4F6', N'test', N'123', N'asdsa', N'asd@sad.com', NULL, 0)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
/****** Object:  Table [dbo].[Stuff]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stuff](
	[StuffID] [int] IDENTITY(1,1) NOT NULL,
	[StuffContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Stuff] PRIMARY KEY CLUSTERED 
(
	[StuffID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Stuff] ON
INSERT [dbo].[Stuff] ([StuffID], [StuffContent]) VALUES (2, N'<p>
	<span style="font-size:16px;"><strong>Rentals</strong></span></p>
<p>
	<strong>Dear Customers</strong></p>
<p>
	At present our company has a number of nice apartments houses and villas of prestige. The price is very reasonable ranging from 500 USD to 15000 USD per month. Our apartments are located in the City Central, Westlake, including many luxurious apartments with standard quality equipment and fully furnished. Our properties have large gardens, beautiful view, some with swimming pool... many houses and villas in the Westlake District.</p>
<p>
	<strong>All services of our apartments: </strong></p>
<p>
	<u>Our main service:</u></p>
<ul>
	<li>
		24-hour security, maintenance, reception and laundry service.</li>
	<li>
		Maid service (room cleaning, laundry and ironing, dish washing).</li>
</ul>
<p>
	<u>Equipments and furniture:</u></p>
<br />
<ul>
	<li>
		Air-conditioner : split unit air conditioning system by heat and cool.</li>
	<li>
		Communication :
		<ul>
			<li>
				One IDD phone line for each apartment unit.</li>
			<li>
				Every room has Satellite TV antenna plug.</li>
		</ul>
	</li>
	<li>
		NHK, CNN, BBC WORLD, HBO, STAR SPORT, and local broadcast channels are all available.</li>
	<li>
		Water Heater: Electric water boiler for each apartment unit can supply hot water at anytime to bathroom and kitchen.</li>
	<li>
		Furniture: Bed, closet, dinning table and chairs, cupboard, sofa set...</li>
	<li>
		Appliances: Satellite television (21 to 50 inch), Electric cooking range, refrigerator, washing machine.</li>
</ul>
<p>
	<u>Common Facilities:</u></p>
<br />
<ul>
	<li>
		Generator: 100% back-up generator.</li>
	<li>
		Elevator: 2 elevators (11 people and 8 people).</li>
	<li>
		Parking lot: for 100 vehicles.</li>
	<li>
		Security: Automatic fire alarm system, fire plug, switchboard.</li>
	<li>
		Room rental charge and details of our service.</li>
</ul>
<p>
	<u>Details of our service:</u></p>
<br />
<ul>
	<li>
		Room maid service is available from Mon through Sat. However, Room maid service does not include shopping and cooking service.</li>
	<li>
		Here is a pictures of our properties for your reference. Please do not hesitate to contact us!</li>
</ul>
<p>
	All the contact information in About Us page.</p>
')
INSERT [dbo].[Stuff] ([StuffID], [StuffContent]) VALUES (3, N'<p>
	<span style="font-size:14px;"><strong>Moving</strong></span></p>
<p>
	Hanoi Capital &ndash; Viet Nam is an ideal destination for the Investors, Politicians, professionals...</p>
<p>
	Our company has senior experiences in doing business such as: investment and consultant of real estate for foreigners &amp; construction, interior design and manufacture wooden furniture. We believe that for all foreigners from Europe, Oceania, and Latin American, Americas&hellip;when they have plan to Hanoi for residence and working thus property is one of the important matter.</p>
<p>
	Davidduc Co.,Ltd with slogan: &ldquo; Customer is number one&rdquo; was supplying best services in property for foreigners such as : Villas, Apartments, Houses&hellip;At present our company real estate estimates hundreds of million US Dollar and spread at central Hanoi almost (Hoan Kiem, Hai Ba Trung, Ba Dinh and Tay Ho District) being the best choices of international customer when they come Hanoi. And beside the best services for residence our customers take convenience from others services as: International School at Tay Ho Dist, French school at Ba Dinh Dist, France &ndash; Vietnam Hospital, SOS international hospital at city centre, Shopping centre-Hoan Kiem Dist, Supermarkets with area within hundreds hectare as Big C or Metro,&hellip;especially the distance between Hanoi and Noibai International Airport is only 30 km, it&rsquo;s only take 20 minutes by car.</p>
<p>
	In addition, we will able to consult the others services to clients free such as: vehicles (Auto mobile or motorbike), entertainment &amp; leisure centre for foreigners, moving domestic and oversea service, best restaurants with Europe and Asia style&hellip;</p>
<p>
	Come with us and get it done!</p>
')
INSERT [dbo].[Stuff] ([StuffID], [StuffContent]) VALUES (4, N'<p>
	<span style="font-size:20px;"><strong>Top 10 insider secrets for buyer </strong></span></p>
<p>
	Updating...</p>
')
INSERT [dbo].[Stuff] ([StuffID], [StuffContent]) VALUES (5, N'<p>
	<span style="font-size:14px;"><strong>About Us</strong></span></p>
<p align="justify">
	&nbsp;</p>
<hr size="2" width="100%" />
<p align="justify">
	<strong>Dai Viet Dien Duc limited Liability Company (Davidduc Co., Ltd)</strong></p>
<p align="justify">
	Being founded from a small office with a major transaction and co-operation with foreign organizations, Dai Viet Dien Duc Limited Liability Company (Davidduc Co., Ltd) has just operated smoothly since 1992 but asserted and gained the prestige and position in the country with many customers worldwide. With determination to build Davidduc more and more developed, the Company has invested in key business of villas, apartments for foreigners to rent and high-quality wooden furniture manufacturing.</p>
<p align="justify">
	<strong><span style="text-decoration: underline;">Vote for the Golden Brand Awardsin 2008</span></strong><br />
	<br />
	Enterprise&rsquo;s name: Dai Viet Dien Duc limited liability Company (Davidduc Co.,Ltd)<br />
	Address: 244 Au Co &ndash; Quang An &ndash; Tay Ho &ndash; Hanoi &ndash; Vietnam<br />
	Office phone number: 043 7198312<br />
	Fax: 043 7183347<br />
	Email: <a href="mailto:davidduc@hn.vnn.vn">davidduc@hn.vnn.vn</a><br />
	Website: http://www.davidduc.com<br />
	<br />
	<br />
	Detailed information and business field of the enterprise.</p>
<div align="justify">
	During the process of operating and developing, DavidducCo., Ltd always determines its main goals such as striving for production, serving, raising the quality of products and services in order to meet the demand of the customers. Therefore, the products of company have been attracting a lot of foreign and domestic customers&rsquo; attention. The Company always fulfils production and business plans beyond its expectations. For example, annual turnover increases multiplicatively, the profit in the following year is higher than that in the last year, workers&rsquo; income increases rapidly. Moreover, the staffs and workers are increasing in quantity, quality, professional skills and levels with every passing day. Thanks to its permanent and continuous improvements, the company&rsquo;s products and services have been standing more stably than other same kind of products and services in the market, receiving the foreign and domestic customers&rsquo; high appreciation, particularly, prestige about products and services&rsquo; quality of company is increasing and market share are enlarged day by day.<br />
	After joining WTO, Viet Nam economy is developing with every passing day, many open- door policies of Vietnamese government attracted a lot of foreign investors in Viet Nam. Therefore, accommodation needs for foreign people who come to live and work in Viet Nam are increasing in quantity and quality dramatically. Being aware of this, steering committee and the whole cadres and staffs of Company have been striving continuously so that the products and services of Davidduc Real Estate &amp; Furniture will become a plentiful source of supply for those needs. At the moment, The Company keeps on raising prestige and popularizing company&rsquo;s image, giving information to introduce its logo, trade name and supplying the best products and services.</div>
<div align="justify">
	<br />
	After 20 years of founding and operating, Davidduc Co., Ltd experienced a lot of difficulties to exist and develop. Until now, the Company has gained the following valued results:</div>
<p align="justify">
	&bull; The Company has had a big amount of customers who are embassies, foreign organizations and offices in Viet Nam confidence in product and services.<br />
	&bull;<br />
	&bull; The company had the honor of receiving Viet Nam Golden Typical Enterprise Award in 2007 that was awarded by Viet Nam small and medium- sized business association.<br />
	&bull; Beautiful image of the Company was advertised in many domestic and foreign magazines.</p>
<p align="justify">
	Mr. Vu Tien Duc - Director receives the Golden Brand Awards.</p>
')
INSERT [dbo].[Stuff] ([StuffID], [StuffContent]) VALUES (6, N'<p>
	<strong style="font-size: 200%">Welcome to Davidduc</strong><br />
	<br />
	In Vietnam, Davidduc Co., Ltd is a senior and prestigious real estate company operates in investment, consultancy and comprehensive agency services.</p>
<p>
	With nearly twenty years experience, working with</p>
<p>
	Embassies, Organizations, Companies and Individuals come from many countries all over the world therefore we are expert in the Hanoi real estate market and the details knowledge of clients&rsquo; demands.<br />
	Come with us and enjoy wonderful services.</p>
')
INSERT [dbo].[Stuff] ([StuffID], [StuffContent]) VALUES (7, N'<p>
	<span style="font-size:14px;"><strong>Contact David Duc</strong></span></p>
<table border="0" width="100%">
	<tbody>
		<tr>
			<td>
				&nbsp;</td>
			<td align="right" rowspan="2" valign="top">
				&nbsp;</td>
		</tr>
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td rowspan="6" valign="top" width="100">
								Address:</td>
						</tr>
						<tr>
							<td valign="top">
								16 Dang Thai Mai Str- Tay Ho Dist - Hanoi</td>
						</tr>
					</tbody>
				</table>
				<br />
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td width="100">
								E-mail:</td>
							<td>
								<a href="mailto:davidduc@hn.vnn.vn">davidduc@hn.vnn.vn</a></td>
						</tr>
						<tr>
							<td width="100">
								Telephone:</td>
							<td>
								0904528587</td>
						</tr>
						<tr>
							<td width="100">
								Fax:</td>
							<td>
								+8437183347</td>
						</tr>
						<tr>
							<td width="100">
								Mobile Phone Number:</td>
							<td>
								0904258232</td>
						</tr>
						<tr>
							<td width="100">
								&nbsp;</td>
							<td>
								<a href="http://www.davidduc.com" target="_blank">http://www.davidduc.com</a></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<p>
	&nbsp;</p>
')
SET IDENTITY_INSERT [dbo].[Stuff] OFF
/****** Object:  Table [dbo].[FurnitureCollection]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FurnitureCollection](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_FurnitureCollection] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FurnitureCollection] ON
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (1, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (2, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (3, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (4, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (5, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (6, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (7, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (8, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (9, NULL)
INSERT [dbo].[FurnitureCollection] ([CollectionID], [Description]) VALUES (10, NULL)
SET IDENTITY_INSERT [dbo].[FurnitureCollection] OFF
/****** Object:  Table [dbo].[BuildingType]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingType](
	[BuildingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Available] [int] NULL,
	[Total] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[BuildingTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BuildingType] ON
INSERT [dbo].[BuildingType] ([BuildingTypeID], [Available], [Total], [Description]) VALUES (1, 10, 10, N'Villa')
INSERT [dbo].[BuildingType] ([BuildingTypeID], [Available], [Total], [Description]) VALUES (2, 20, 20, N'Apartment')
INSERT [dbo].[BuildingType] ([BuildingTypeID], [Available], [Total], [Description]) VALUES (3, 30, 30, N'House')
INSERT [dbo].[BuildingType] ([BuildingTypeID], [Available], [Total], [Description]) VALUES (4, 40, 40, N'Single Room')
INSERT [dbo].[BuildingType] ([BuildingTypeID], [Available], [Total], [Description]) VALUES (5, 2, 2, N'Warehouse')
INSERT [dbo].[BuildingType] ([BuildingTypeID], [Available], [Total], [Description]) VALUES (6, 10, 10, N'Hotel')
SET IDENTITY_INSERT [dbo].[BuildingType] OFF
/****** Object:  Table [dbo].[MenuBar]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuBar](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[MenuLevel] [int] NULL,
	[ParentID] [int] NULL,
	[AppearNo] [int] NULL,
 CONSTRAINT [PK_MenuBar] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MenuBar] ON
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (1, N'Home', N'Home.aspx', 1, NULL, 1)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (2, N'Rentals', N'Rental.aspx', 1, NULL, 2)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (3, N'Home List', N'House.aspx', 1, NULL, 3)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (4, N'Moving', N'Moving.aspx', 1, NULL, 4)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (5, N'Top 10 secrets', N'TopSecret.aspx', 2, 4, 5)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (6, N'About us', N'About.aspx', 1, NULL, 6)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (7, N'Welcome', N'Welcome.aspx', 2, NULL, 7)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (8, N'News', N'News.aspx', 2, 6, 8)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (9, N'Contact', N'Contact.aspx', 1, NULL, 9)
INSERT [dbo].[MenuBar] ([MenuID], [Title], [Link], [MenuLevel], [ParentID], [AppearNo]) VALUES (10, N'Register', N'RegisterCus.aspx', 1, NULL, 10)
SET IDENTITY_INSERT [dbo].[MenuBar] OFF
/****** Object:  Table [dbo].[FurnitureType]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FurnitureType](
	[FurnitureTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Available] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_FurnitureType] PRIMARY KEY CLUSTERED 
(
	[FurnitureTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FurnitureType] ON
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (1, N'Chair', 9, 23)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (2, N'Table', 9, 21)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (3, N'Television', 10, 20)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (4, N'Bed', 10, 20)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (5, N'Remote', 20, 100)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (6, N'Conditioning', 10, 20)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (7, N'Washer', 10, 20)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (8, N'Refrigerator', 10, 20)
INSERT [dbo].[FurnitureType] ([FurnitureTypeID], [Description], [Available], [Total]) VALUES (9, N'Cabinet', 20, 30)
SET IDENTITY_INSERT [dbo].[FurnitureType] OFF
/****** Object:  Table [dbo].[BannerPicture]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerPicture](
	[BannerID] [int] IDENTITY(1,1) NOT NULL,
	[Picture] [nvarchar](max) NULL,
 CONSTRAINT [PK_BannerPicture] PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BannerPicture] ON
INSERT [dbo].[BannerPicture] ([BannerID], [Picture]) VALUES (1, N'img1.jpg')
INSERT [dbo].[BannerPicture] ([BannerID], [Picture]) VALUES (2, N'img2.jpg')
INSERT [dbo].[BannerPicture] ([BannerID], [Picture]) VALUES (3, N'img3.jpg')
INSERT [dbo].[BannerPicture] ([BannerID], [Picture]) VALUES (4, N'img4.jpg')
SET IDENTITY_INSERT [dbo].[BannerPicture] OFF
/****** Object:  Table [dbo].[News]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[NewsContent] [nvarchar](max) NULL,
	[Poster] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([NewsID], [Title], [Date], [NewsContent], [Poster]) VALUES (1, N'Brazil – Anh: Tìm lại chất samba', CAST(0x44370B00 AS Date), N'<p>
	<font style="color: rgb(0, 0, 255);"><em>Trận đấu sẽ được Tường thuật trực tiếp tr&ecirc;n 24h.com.vn. Mời c&aacute;c bạn đ&oacute;n xem v&agrave; c&ugrave;ng tham gia b&igrave;nh luận!</em></font></p>
<p>
	Scolari, vị HLV gi&uacute;p Brazil v&ocirc; địch World Cup 2002 đ&atilde; trở lại dẫn dắt Selecao từ cuối năm 2012. Nhưng c&oacute; một thực tế m&agrave; NHM xứ sở samba đang phải chấp nhận, đ&oacute; l&agrave; đo&agrave;n qu&acirc;n &aacute;o xanh vẫn chưa t&igrave;m lại được sức mạnh ng&agrave;y n&agrave;o. Khởi đầu triều đại Scolari 2.0 bằng thất bại 1-2 trước ĐT Anh hồi th&aacute;ng 2 năm nay, t&iacute;nh trong năm 2013 sau 5 trận Brazil mới chỉ c&oacute; được chiến thắng duy nhất 4-0 trước Bolivia, c&ograve;n lại l&agrave; h&ograve;a 3 v&agrave; thua 1.</p>
<p>
	Những th&agrave;nh t&iacute;ch tr&ecirc;n s&acirc;n cỏ cho thấy, Selecao đang chật vật tr&ecirc;n con đường t&igrave;m lại vinh quang trong qu&aacute; khứ. Với một đất nước c&oacute; thể th&agrave;nh lập 2 ĐTQG c&oacute; tr&igrave;nh độ ngang nhau như Brazil như người ta vẫn thường n&oacute;i, th&igrave; giờ đ&acirc;y HLV Scolari đang rất kh&oacute; khăn trong việc định h&igrave;nh lối chơi cũng như giải b&agrave;i to&aacute;n nh&acirc;n sự. Big Phil đ&atilde; trao cơ hội cho những l&atilde;o tướng như Ronaldinho, Kaka, Fabiano&hellip; nhưng hiện tại &ocirc;ng đang buộc phải đặt niềm tin cho thế hệ trẻ t&agrave;i năng với những Neymar, Oscar, Moura&hellip; trong chiến dịch chinh phục chiếc c&uacute;p v&agrave;ng tr&ecirc;n qu&ecirc; nh&agrave; v&agrave;o m&ugrave;a h&egrave; sang năm.</p>
<p style="text-align: center;">
	<img alt="Brazil – Anh: Tìm lại chất samba, Bóng đá, brazil - anh, brazil vs anh, brazil, anh, scolari, neymar, rooney, confed cup 2013, hodgson, lich thi dau bong da, bong da, bong da so, ket qua bong da, tin bong da, bong da 24h, bao bong da" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370136952-bong-da-Brazil-Anh1.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	Neymar tiếp tục l&agrave; hạt nh&acirc;n trong lối chơi của Brazil</p>
<p>
	Để chuẩn bị cho trận giao hữu <strong>Brazil - Anh </strong>v&agrave; cũng l&agrave; danh s&aacute;ch thi đấu cho Confed Cup 2013, Scolari đ&atilde; loại những l&atilde;o tướng như Ronaldinho, Kaka hay những ng&ocirc;i sao đang thi đấu tại Premier League (Ramires, Rafael); Pato (Corinthians), Granso (Sao Paulo) cũng kh&ocirc;ng được g&oacute;p mặt. Điều đ&oacute; cho thấy, Big Phil vẫn đang loay hoay trong vấn đề nh&acirc;n sự.</p>
<p>
	Đặc biệt, lối chơi hiện nay của Brazil hi đang c&oacute; vấn đề. Những kết quả giao hữu kh&ocirc;ng tốt cho thấy c&aacute;ch vận h&agrave;nh của Selecao đang lỗi thời, c&aacute;c tiền vệ của họ vẫn c&ograve;n qu&aacute; rườm r&agrave; khi xử l&yacute; b&oacute;ng dẫn đến t&igrave;nh trạng tắc nghẽn ở kh&acirc;u triển khai b&oacute;ng, qua đ&oacute; khiến đối thủ c&oacute; thể dễ d&agrave;ng bắt b&agrave;i. Brazil vẫn đang sở hữu những cầu thủ tấn c&ocirc;ng xuất sắc như Neymar, Moura hay Oscar, nhưng vấn đề l&agrave; sự kết d&iacute;nh, t&iacute;nh khoa học chưa được tối ưu.</p>
<p>
	Ch&iacute;nh v&igrave; thế, b&agrave;i test ĐT Anh sẽ l&agrave; một liều thuốc thử hữu hiệu cho sự tiến bộ của Brazil dưới thời Big Phil. Selecao cần phải chơi nhanh, mạnh v&agrave; đồng đội hơn để tận dụng được hết những tố chất samba sẵn c&oacute;, nhất l&agrave; khi &ldquo;Tam sư&rdquo; kh&ocirc;ng c&oacute; được phong độ tốt th&igrave; cơ hội để đo&agrave;n qu&acirc;n &aacute;o v&agrave;ng xanh gi&agrave;nh chiến thắng c&agrave;ng cao.</p>
<p style="text-align: center;">
	<img alt="Brazil – Anh: Tìm lại chất samba, Bóng đá, brazil - anh, brazil vs anh, brazil, anh, scolari, neymar, rooney, confed cup 2013, hodgson, lich thi dau bong da, bong da, bong da so, ket qua bong da, tin bong da, bong da 24h, bao bong da" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370136952-bong-da-Anh.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	ĐT Anh vừa g&acirc;y thất vọng với trận h&ograve;a 1-1 tr&ecirc;n s&acirc;n nh&agrave; trước Ireland</p>
<p>
	Ở thời điểm hiện tại, vấn đề mu&ocirc;n thủa của ĐT Anh vẫn l&agrave; sự kết d&iacute;nh giữa c&aacute;c ng&ocirc;i sao đang chinh chiến tại giải đấu được cho l&agrave; hấp dẫn nhất h&agrave;nh tinh Premier League. C&oacute; thể, HLV Hodgson tạm tạo ra sự an to&agrave;n trong lối chơi, nhưng khi cần gi&agrave;nh chiến thắng th&igrave; &ldquo;Tam sư&rdquo; chưa l&agrave;m được. Trận h&ograve;a mới nhất trước đối thủ dưới cơ Ireland l&agrave; minh chứng cho thấy sự thiếu sắc sảo trong lối chơi của những ch&uacute; sư tử.</p>
<p>
	Confed Cup 2013 đang tới gần. Brazil rất cần một chiến thắng trước ĐT Anh để l&agrave;m động lực. Nếu biết tận dụng c&aacute;c yếu tố &ldquo;Thi&ecirc;n thời &ndash; Địa lợi &ndash; Nh&acirc;n h&ograve;a&rdquo;, Selecao ho&agrave;n to&agrave;n c&oacute; thể gi&agrave;nh chiến thắng để l&agrave;m b&agrave;n đạp cho Confed Cup v&agrave; đặc biệt l&agrave; World Cup 2014 sẽ được tổ chức tại xứ sở samba v&agrave;o m&ugrave;a h&egrave; sang năm.</p>
<p>
	<strong>Dự đo&aacute;n:</strong><em> </em><u>Brazil - Anh</u><strong> 3-1</strong></p>
<p>
	<strong>Đội h&igrave;nh dự kiến:</strong></p>
<p>
	<em>Brazil: Cesar, Alves, Thiago Silva, David Luiz, Marcelo, Fernando, Paulinho, Neymar, Oscar, Moura, Fred.</em></p>
<p>
	<em>Anh: Hart, Johnson, Cahill Jagielka, Cole, Carrick, Milner, Oxlade-Camberlain, Lampard, Walcott, Rooney.</em></p>
<p>
	<strong>Th&ocirc;ng tin b&ecirc;n lề:</strong></p>
<p>
	Lần cuối c&ugrave;ng ĐT Anh đ&aacute; tr&ecirc;n s&acirc;n Maracana l&agrave; v&agrave;o năm 1984. Ở trận đấu đ&oacute;, Tam sư đ&atilde; gi&agrave;nh chiến thắng với tỉ số 2-0 nhờ c&aacute;c b&agrave;n thắng của John Barnes v&agrave; Mark Hateley.</p>
<p>
	Mặc d&ugrave; mới 21 tuổi, nhưng Neymar đang l&agrave; ch&acirc;n s&uacute;t tốt nhất của Brazil trong đợt tập trung lần n&agrave;y với 20 b&agrave;n.</p>
<p>
	Rooney đang c&oacute; phong độ kh&aacute; tốt trong m&agrave;u &aacute;o ĐT Anh với 7 b&agrave;n sau 8 trận.</p>
<p>
	<em>Brazil đều ghi b&agrave;n trong 9 trận đấu gần đ&acirc;y gặp ĐT Anh</em>.</p>
', 1)
INSERT [dbo].[News] ([NewsID], [Title], [Date], [NewsContent], [Poster]) VALUES (2, N'Brazil – Anh: Tìm lại chất samba', CAST(0x2C370B00 AS Date), N'<p>
	<font style="color: rgb(0, 0, 255);"><em>Trận đấu sẽ được Tường thuật trực tiếp trên 24h.com.vn. Mời các bạn đón xem và cùng tham gia bình luận!</em></font></p>
<p>
	Scolari, vị HLV giúp Brazil vô địch World Cup 2002 đã trở lại dẫn dắt Selecao từ cuối năm 2012. Nhưng có một thực tế mà NHM xứ sở samba đang phải chấp nhận, đó là đoàn quân áo xanh vẫn chưa tìm lại được sức mạnh ngày nào. Khởi đầu triều đại Scolari 2.0 bằng thất bại 1-2 trước ĐT Anh hồi tháng 2 năm nay, tính trong năm 2013 sau 5 trận Brazil mới chỉ có được chiến thắng duy nhất 4-0 trước Bolivia, còn lại là hòa 3 và thua 1.</p>
<p>
	Những thành tích trên sân cỏ cho thấy, Selecao đang chật vật trên con đường tìm lại vinh quang trong quá khứ. Với một đất nước có thể thành lập 2 ĐTQG có trình độ ngang nhau như Brazil như người ta vẫn thường nói, thì giờ đây HLV Scolari đang rất khó khăn trong việc định hình lối chơi cũng như giải bài toán nhân sự. Big Phil đã trao cơ hội cho những lão tướng như Ronaldinho, Kaka, Fabiano… nhưng hiện tại ông đang buộc phải đặt niềm tin cho thế hệ trẻ tài năng với những Neymar, Oscar, Moura… trong chiến dịch chinh phục chiếc cúp vàng trên quê nhà vào mùa hè sang năm.</p>
<p style="text-align: center;">
	<img alt="Brazil – Anh: Tìm lại chất samba, Bóng đá, brazil - anh, brazil vs anh, brazil, anh, scolari, neymar, rooney, confed cup 2013, hodgson, lich thi dau bong da, bong da, bong da so, ket qua bong da, tin bong da, bong da 24h, bao bong da" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370136952-bong-da-Brazil-Anh1.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	Neymar tiếp tục là hạt nhân trong lối chơi của Brazil</p>
<p>
	Để chuẩn bị cho trận giao hữu <strong>Brazil - Anh </strong>và cũng là danh sách thi đấu cho Confed Cup 2013, Scolari đã loại những lão tướng như Ronaldinho, Kaka hay những ngôi sao đang thi đấu tại Premier League (Ramires, Rafael); Pato (Corinthians), Granso (Sao Paulo) cũng không được góp mặt. Điều đó cho thấy, Big Phil vẫn đang loay hoay trong vấn đề nhân sự.</p>
<p>
	Đặc biệt, lối chơi hiện nay của Brazil hi đang có vấn đề. Những kết quả giao hữu không tốt cho thấy cách vận hành của Selecao đang lỗi thời, các tiền vệ của họ vẫn còn quá rườm rà khi xử lý bóng dẫn đến tình trạng tắc nghẽn ở khâu triển khai bóng, qua đó khiến đối thủ có thể dễ dàng bắt bài. Brazil vẫn đang sở hữu những cầu thủ tấn công xuất sắc như Neymar, Moura hay Oscar, nhưng vấn đề là sự kết dính, tính khoa học chưa được tối ưu.</p>
<p>
	Chính vì thế, bài test ĐT Anh sẽ là một liều thuốc thử hữu hiệu cho sự tiến bộ của Brazil dưới thời Big Phil. Selecao cần phải chơi nhanh, mạnh và đồng đội hơn để tận dụng được hết những tố chất samba sẵn có, nhất là khi “Tam sư” không có được phong độ tốt thì cơ hội để đoàn quân áo vàng xanh giành chiến thắng càng cao.</p>
<p style="text-align: center;">
	<img alt="Brazil – Anh: Tìm lại chất samba, Bóng đá, brazil - anh, brazil vs anh, brazil, anh, scolari, neymar, rooney, confed cup 2013, hodgson, lich thi dau bong da, bong da, bong da so, ket qua bong da, tin bong da, bong da 24h, bao bong da" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370136952-bong-da-Anh.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	ĐT Anh vừa gây thất vọng với trận hòa 1-1 trên sân nhà trước Ireland</p>
<p>
	Ở thời điểm hiện tại, vấn đề muôn thủa của ĐT Anh vẫn là sự kết dính giữa các ngôi sao đang chinh chiến tại giải đấu được cho là hấp dẫn nhất hành tinh Premier League. Có thể, HLV Hodgson tạm tạo ra sự an toàn trong lối chơi, nhưng khi cần giành chiến thắng thì “Tam sư” chưa làm được. Trận hòa mới nhất trước đối thủ dưới cơ Ireland là minh chứng cho thấy sự thiếu sắc sảo trong lối chơi của những chú sư tử.</p>
<p>
	Confed Cup 2013 đang tới gần. Brazil rất cần một chiến thắng trước ĐT Anh để làm động lực. Nếu biết tận dụng các yếu tố “Thiên thời – Địa lợi – Nhân hòa”, Selecao hoàn toàn có thể giành chiến thắng để làm bàn đạp cho Confed Cup và đặc biệt là World Cup 2014 sẽ được tổ chức tại xứ sở samba vào mùa hè sang năm.</p>
<p>
	<strong>Dự đoán:</strong><em> </em><u>Brazil - Anh</u><strong> 3-1</strong></p>
<p>
	<strong>Đội hình dự kiến:</strong></p>
<p>
	<em>Brazil: Cesar, Alves, Thiago Silva, David Luiz, Marcelo, Fernando, Paulinho, Neymar, Oscar, Moura, Fred.</em></p>
<p>
	<em>Anh: Hart, Johnson, Cahill Jagielka, Cole, Carrick, Milner, Oxlade-Camberlain, Lampard, Walcott, Rooney.</em></p>
<p>
	<strong>Thông tin bên lề:</strong></p>
<p>
	Lần cuối cùng ĐT Anh đá trên sân Maracana là vào năm 1984. Ở trận đấu đó, Tam sư đã giành chiến thắng với tỉ số 2-0 nhờ các bàn thắng của John Barnes và Mark Hateley.</p>
<p>
	Mặc dù mới 21 tuổi, nhưng Neymar đang là chân sút tốt nhất của Brazil trong đợt tập trung lần này với 20 bàn.</p>
<p>
	Rooney đang có phong độ khá tốt trong màu áo ĐT Anh với 7 bàn sau 8 trận.</p>
<p>
	<em>Brazil đều ghi bàn trong 9 trận đấu gần đây gặp ĐT Anh</em>.</p>
', 1)
INSERT [dbo].[News] ([NewsID], [Title], [Date], [NewsContent], [Poster]) VALUES (3, N'Brazil – Anh: Tìm lại chất samba', CAST(0x2C370B00 AS Date), N'<p>
	<font style="color: rgb(0, 0, 255);"><em>Trận đấu sẽ được Tường thuật trực tiếp tr&ecirc;n 24h.com.vn. Mời c&aacute;c bạn đ&oacute;n xem v&agrave; c&ugrave;ng tham gia b&igrave;nh luận!</em></font></p>
<p>
	Scolari, vị HLV gi&uacute;p Brazil v&ocirc; địch World Cup 2002 đ&atilde; trở lại dẫn dắt Selecao từ cuối năm 2012. Nhưng c&oacute; một thực tế m&agrave; NHM xứ sở samba đang phải chấp nhận, đ&oacute; l&agrave; đo&agrave;n qu&acirc;n &aacute;o xanh vẫn chưa t&igrave;m lại được sức mạnh ng&agrave;y n&agrave;o. Khởi đầu triều đại Scolari 2.0 bằng thất bại 1-2 trước ĐT Anh hồi th&aacute;ng 2 năm nay, t&iacute;nh trong năm 2013 sau 5 trận Brazil mới chỉ c&oacute; được chiến thắng duy nhất 4-0 trước Bolivia, c&ograve;n lại l&agrave; h&ograve;a 3 v&agrave; thua 1.</p>
<p>
	Những th&agrave;nh t&iacute;ch tr&ecirc;n s&acirc;n cỏ cho thấy, Selecao đang chật vật tr&ecirc;n con đường t&igrave;m lại vinh quang trong qu&aacute; khứ. Với một đất nước c&oacute; thể th&agrave;nh lập 2 ĐTQG c&oacute; tr&igrave;nh độ ngang nhau như Brazil như người ta vẫn thường n&oacute;i, th&igrave; giờ đ&acirc;y HLV Scolari đang rất kh&oacute; khăn trong việc định h&igrave;nh lối chơi cũng như giải b&agrave;i to&aacute;n nh&acirc;n sự. Big Phil đ&atilde; trao cơ hội cho những l&atilde;o tướng như Ronaldinho, Kaka, Fabiano&hellip; nhưng hiện tại &ocirc;ng đang buộc phải đặt niềm tin cho thế hệ trẻ t&agrave;i năng với những Neymar, Oscar, Moura&hellip; trong chiến dịch chinh phục chiếc c&uacute;p v&agrave;ng tr&ecirc;n qu&ecirc; nh&agrave; v&agrave;o m&ugrave;a h&egrave; sang năm.</p>
<p style="text-align: center;">
	<img alt="Brazil – Anh: Tìm lại chất samba, Bóng đá, brazil - anh, brazil vs anh, brazil, anh, scolari, neymar, rooney, confed cup 2013, hodgson, lich thi dau bong da, bong da, bong da so, ket qua bong da, tin bong da, bong da 24h, bao bong da" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370136952-bong-da-Brazil-Anh1.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	Neymar tiếp tục l&agrave; hạt nh&acirc;n trong lối chơi của Brazil</p>
<p>
	Để chuẩn bị cho trận giao hữu <strong>Brazil - Anh </strong>v&agrave; cũng l&agrave; danh s&aacute;ch thi đấu cho Confed Cup 2013, Scolari đ&atilde; loại những l&atilde;o tướng như Ronaldinho, Kaka hay những ng&ocirc;i sao đang thi đấu tại Premier League (Ramires, Rafael); Pato (Corinthians), Granso (Sao Paulo) cũng kh&ocirc;ng được g&oacute;p mặt. Điều đ&oacute; cho thấy, Big Phil vẫn đang loay hoay trong vấn đề nh&acirc;n sự.</p>
<p>
	Đặc biệt, lối chơi hiện nay của Brazil hi đang c&oacute; vấn đề. Những kết quả giao hữu kh&ocirc;ng tốt cho thấy c&aacute;ch vận h&agrave;nh của Selecao đang lỗi thời, c&aacute;c tiền vệ của họ vẫn c&ograve;n qu&aacute; rườm r&agrave; khi xử l&yacute; b&oacute;ng dẫn đến t&igrave;nh trạng tắc nghẽn ở kh&acirc;u triển khai b&oacute;ng, qua đ&oacute; khiến đối thủ c&oacute; thể dễ d&agrave;ng bắt b&agrave;i. Brazil vẫn đang sở hữu những cầu thủ tấn c&ocirc;ng xuất sắc như Neymar, Moura hay Oscar, nhưng vấn đề l&agrave; sự kết d&iacute;nh, t&iacute;nh khoa học chưa được tối ưu.</p>
<p>
	Ch&iacute;nh v&igrave; thế, b&agrave;i test ĐT Anh sẽ l&agrave; một liều thuốc thử hữu hiệu cho sự tiến bộ của Brazil dưới thời Big Phil. Selecao cần phải chơi nhanh, mạnh v&agrave; đồng đội hơn để tận dụng được hết những tố chất samba sẵn c&oacute;, nhất l&agrave; khi &ldquo;Tam sư&rdquo; kh&ocirc;ng c&oacute; được phong độ tốt th&igrave; cơ hội để đo&agrave;n qu&acirc;n &aacute;o v&agrave;ng xanh gi&agrave;nh chiến thắng c&agrave;ng cao.</p>
<p style="text-align: center;">
	<img alt="Brazil – Anh: Tìm lại chất samba, Bóng đá, brazil - anh, brazil vs anh, brazil, anh, scolari, neymar, rooney, confed cup 2013, hodgson, lich thi dau bong da, bong da, bong da so, ket qua bong da, tin bong da, bong da 24h, bao bong da" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370136952-bong-da-Anh.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	ĐT Anh vừa g&acirc;y thất vọng với trận h&ograve;a 1-1 tr&ecirc;n s&acirc;n nh&agrave; trước Ireland</p>
<p>
	Ở thời điểm hiện tại, vấn đề mu&ocirc;n thủa của ĐT Anh vẫn l&agrave; sự kết d&iacute;nh giữa c&aacute;c ng&ocirc;i sao đang chinh chiến tại giải đấu được cho l&agrave; hấp dẫn nhất h&agrave;nh tinh Premier League. C&oacute; thể, HLV Hodgson tạm tạo ra sự an to&agrave;n trong lối chơi, nhưng khi cần gi&agrave;nh chiến thắng th&igrave; &ldquo;Tam sư&rdquo; chưa l&agrave;m được. Trận h&ograve;a mới nhất trước đối thủ dưới cơ Ireland l&agrave; minh chứng cho thấy sự thiếu sắc sảo trong lối chơi của những ch&uacute; sư tử.</p>
<p>
	Confed Cup 2013 đang tới gần. Brazil rất cần một chiến thắng trước ĐT Anh để l&agrave;m động lực. Nếu biết tận dụng c&aacute;c yếu tố &ldquo;Thi&ecirc;n thời &ndash; Địa lợi &ndash; Nh&acirc;n h&ograve;a&rdquo;, Selecao ho&agrave;n to&agrave;n c&oacute; thể gi&agrave;nh chiến thắng để l&agrave;m b&agrave;n đạp cho Confed Cup v&agrave; đặc biệt l&agrave; World Cup 2014 sẽ được tổ chức tại xứ sở samba v&agrave;o m&ugrave;a h&egrave; sang năm.</p>
<p>
	<strong>Dự đo&aacute;n:</strong><em> </em><u>Brazil - Anh</u><strong> 3-1</strong></p>
<p>
	<strong>Đội h&igrave;nh dự kiến:</strong></p>
<p>
	<em>Brazil: Cesar, Alves, Thiago Silva, David Luiz, Marcelo, Fernando, Paulinho, Neymar, Oscar, Moura, Fred.</em></p>
<p>
	<em>Anh: Hart, Johnson, Cahill Jagielka, Cole, Carrick, Milner, Oxlade-Camberlain, Lampard, Walcott, Rooney.</em></p>
<p>
	<strong>Th&ocirc;ng tin b&ecirc;n lề:</strong></p>
<p>
	Lần cuối c&ugrave;ng ĐT Anh đ&aacute; tr&ecirc;n s&acirc;n Maracana l&agrave; v&agrave;o năm 1984. Ở trận đấu đ&oacute;, Tam sư đ&atilde; gi&agrave;nh chiến thắng với tỉ số 2-0 nhờ c&aacute;c b&agrave;n thắng của John Barnes v&agrave; Mark Hateley.</p>
<p>
	Mặc d&ugrave; mới 21 tuổi, nhưng Neymar đang l&agrave; ch&acirc;n s&uacute;t tốt nhất của Brazil trong đợt tập trung lần n&agrave;y với 20 b&agrave;n.</p>
<p>
	Rooney đang c&oacute; phong độ kh&aacute; tốt trong m&agrave;u &aacute;o ĐT Anh với 7 b&agrave;n sau 8 trận.</p>
<p>
	<em>Brazil đều ghi b&agrave;n trong 9 trận đấu gần đ&acirc;y gặp ĐT Anh</em>.</p>
', 1)
INSERT [dbo].[News] ([NewsID], [Title], [Date], [NewsContent], [Poster]) VALUES (4, N'“Chelsea Việt Nam” giành cup đầu tiên', CAST(0x0D370B00 AS Date), N'<p>
	Trận đấu giữa <strong>B.Bình Dương</strong> và đội khách Kawasaki Frontale có tên chính thức là “Giao hữu bóng đá quốc tê tranh cúp Tokyu Bình Dương Garden City”. Dù chỉ là một trận đấu giao hữu nhưng cả hai đội đều vào trận với quyết tâm cao nhất với mong muốn cống hiến cho người hâm mộ một trận đấu mãn nhãn.</p>
<p>
	Quyết tâm ấy được thể hiện ngay ở đội hình xuất phát của cả hai đội. Với B.Bình Dương, ngoài hai vị trí của các tân binh Nguyễn Quốc Thiện Esele và Đặng Văn Robert thì những cái tên còn lại đều là những trụ cột của đội bóng đất Thủ. Còn với đội bóng Nhật Bản, trong đội hình xuất phát của họ cũng <a href="http://www.24h.com.vn/">bao</a> gồm những ngôi sao như Inamoto, Okubo, Tanaka, Nakazawa…</p>
<p style="text-align: center;">
	<img alt="“Chelsea Việt Nam” giành cup đầu tiên, Bóng đá, B.Binh duong, B.BD, chelsea viet nam, Kawasaki Frontale, Tokyu Bình Dương Garden City, le thuy hai, bong da viet nam, bong da, bongda, bao bong da, bong da 24h, bong da so, tin bong da, ket qua bong da, lich thi dau bong da, bang xep hang bong da, bao" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370140163-bong-da-5.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	NHM trên sân Gò Đậu được chứng kiến một trận đấu mãn nhãn</p>
<p>
	Được chơi trên sân nhà nên B.Bình Dương nhập cuộc hứng khởi hơn so với Kawasaki Frontale nhưng đội bóng Nhật Bản cũng ít nhiều chứng tỏ được đẳng cấp của mình với rất nhiều những tình huống phối hợp một chạm khá bài bản, sắc nét và gây nguy hiểm về phía khung thành của Nguyễn Quốc Thiện Esele.</p>
<p>
	Trận đấu đầu tiên ra mắt người hâm mộ đất Thủ sau khi vừa hoàn tất bản hợp đồng có thời hạn 3 tháng, có lẽ một thời gian dài nghỉ chơi bóng đỉnh cao đã khiến Nguyễn Quốc Thiện Esele phần nào bị ngợp. Thủ thành gốc Nigeria này liên tiếp có những pha ra vào rất lóng ngóng và tạo cảm giác bất an cho hàng ngàn người hâm mộ có mặt trên sân Gò Đậu.</p>
<p>
	Cũng chính từ một tình huống sai lầm của tân binh mới nhất mà ông Hải “lơ” tậu về này, Kawasaki Frontale có được bàn thắng mở tỉ số ở phút thứ 12. Tình huống phán đoán sai lầm của cựu thủ thành Nam Định này vô tình tạo cơ hội không thể tốt hơn cho Kobayashi đệm bóng tung lưới B.Bình Dương.</p>
<p>
	Có bàn thắng dẫn trước, Kawasaki Frontale chủ động chơi chậm lại và nhường thế trận cho chủ nhà <em>B.Bình Dương</em>. Được đội khách “cố tình” tạo điều kiện, các học trò của ông Hải “lơ” cũng tạo ra được khá nhiều cơ hội nguy hiểm trước khung thành của Sugiyama nhưng các chân sút của B.Bình Dương đều bỏ lỡ đáng tiếc.</p>
<p>
	Bước sang hiệp hai, tưởng như GĐKT Lê Thụy Hải sẽ thay Nguyễn Quốc Thiện Esele ra sân nhưng thủ thành gốc Nigeria này vẫn được giữ lại. Thay vào đó là hàng loạt những sự thay đổi như Tăng Tuấn thay Vũ Phong, Trung Hiếu thay Anh Đức, Công Huy thay Aneikan, Minh Đức thay Huỳnh Phú… (mỗi đội được thay tối đa 9 cầu thủ).</p>
<p style="text-align: center;">
	<img alt="“Chelsea Việt Nam” giành cup đầu tiên, Bóng đá, B.Binh duong, B.BD, chelsea viet nam, Kawasaki Frontale, Tokyu Bình Dương Garden City, le thuy hai, bong da viet nam, bong da, bongda, bao bong da, bong da 24h, bong da so, tin bong da, ket qua bong da, lich thi dau bong da, bang xep hang bong da, bao" class="news-image" src="http://img-hn.24hstatic.com:8008/upload/2-2013/images/2013-06-02/1370140180-bong-da-23.jpg" /></p>
<p style="text-align: center; font-style: italic; color: rgb(0, 0, 255);">
	B.Bình Dương nâng cup vô địch</p>
<p>
	Nhiệt huyết từ những cầu thủ trẻ khi được tung vào sân giúp B.Bình Dương phần nào có được thế trận tốt trước đội bóng của J-League. Sau rất nhiều nỗ lực thì người hâm mộ trên sân Gò Đậu cũng được dịp ăn mừng. Người lập công cho chủ nhà là Tăng Tuấn sau tình huống băng lên phá bẫy việt vị và dứt điểm quyết đoán ở phút thứ 75.</p>
<p>
	Trong những phút còn lại, dù cả hai đội đều chơi rất nỗ lực nhưng không có thêm bàn thắng nào được ghi. Và theo thể thức thi đấu thì hai đội sẽ bước vào loạt sút luân lưu để phân định thắng thua chứ không đá hai hiệp phụ. Trên chấm 11m, chủ nhà B.Bình Dương đã đánh bại Kawasaki Frontale với tỉ số 6-7 để đoạt Cúp Tokyu Bình Dương Garden City.</p>
<p>
	Giành chức vô địch giải đấu giao hữu trên sân nhà, B.Bình Dương nhận được giải thưởng trị giá 100 triệu đồng. Ngoài ra, thủ thành Nguyễn Quốc Thiện Esele được cũng nhận được 20 triệu đồng từ Ban tổ chức; các cầu thủ còn lại của <u>B.Bình Dương</u> đều nhận được những giải thưởng bằng hiện vật khá thú vị như tiền đạo Tăng Tuấn nhận vé máy bay khứ hồi từ thành phố Hồ Chí Minh đi Narita, Philani nhận được một bộ thiết bị nhà vệ sinh, Vũ Phong nhận được 1 thùng nước giải khát…</p>
<p>
	Thành Nam<span style="color:#cccccd"> (Khampha.vn)</span></p>
', 1)
INSERT [dbo].[News] ([NewsID], [Title], [Date], [NewsContent], [Poster]) VALUES (214, N'Văn hóa Việt – Thái thăng hoa trong Lễ tổng kết của SV Thái Lan', CAST(0xC0350B00 AS Date), N'<div class="mo-ta-bai-tin-tuc ">
	<p style="text-align: justify;">
		Chiều ngày 31/5, Lễ tổng kết chương trình "Getting to know Vietnam" dành cho 20 sinh viên Đại học NPRU (Thái Lan) đã diễn ra sôi nổi tại tòa nhà giảng đường Trường Đại học FPT Hòa Lạc. Bên cạnh nghi lễ trao chứng chỉ, văn hóa Việt Nam và Thái Lan qua các điệu múa, tiếng hát của sinh viên hai trường là điểm nổi bật của buổi lễ.</p>
</div>
<p style="text-align: justify;">
	TS. Nguyễn Thành Nam - Viện trưởng Viện Hợp tác Quốc tế, Phó Chủ tịch HĐQT Đại học FPT tham dự Lễ tổng kết và trực tiếp trao chứng chỉ hoàn thành chương trình "Getting to know Vietnam" cho một giảng viên và 20 sinh viên Trường bạn.</p>
<p style="text-align: center;">
	<em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_50.jpg" width="540" /></em></p>
<p style="text-align: center;">
	<em>TS. Nguyễn Thành Nam nhấn mạnh tầm quan trọng cũng như giá trị của khóa học “Getting to know Vietnam" đối với sinh viên Thái Lan.</em></p>
<p style="text-align: justify;">
	Khóa học ngắn hạn "Getting to know Vietnam" của 20 sinh viên Khoa Du lịch, Đại học NPRU kéo dài một tuần, bắt đầu từ 27-31/5. Đúng theo tính chất chuyên ngành học của sinh viên Thái Lan, chương trình "Getting to know Vietnam" được thiết kế với chủ yếu là các chuyến city tour và các hoạt động khám phá danh lam thắng cảnh cùng một số địa điểm du lịch nổi tiếng của Việt Nam. Trong khuôn khổ thời lượng của chương trình, Lăng Bác và phố cổ ở khu vực Hà Nội, vịnh Hạ Long- Quảng Ninh là những điểm chính mà "Getting to know Vietnam" hướng tới.</p>
<p style="text-align: justify;">
	Ngay sau lễ chào cờ với bài hát quốc ca Việt Nam và Thái Lan, TS. Nguyễn Thành Nam- đại diện Đại học FPT khai mạc chương trình. Phần mở đầu của thầy Viện trưởng Viện Hợp tác Quốc tế rất gần gũi với câu hỏi hướng tới một nam sinh viên trường bạn về sự khác nhau giữa Việt Nam và Thái Lan mà bạn cảm nhận được sau khóa học ngắn hạn "Getting to know Vietnam". TS. Thành Nam nhấn mạnh: “Tôi tin rằng, một tuần học tập tại Việt Nam không đem đến cho các bạn tiền bạc hay sự giàu có về vật chất, nhưng chắc chắn khóa học này sẽ làm cho các bạn giàu lên về vốn sống từ chính những trải nghiệm thực tế tại Việt Nam”.</p>
<p style="text-align: center;">
	<em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_49.jpg" width="540" /></em></p>
<p style="text-align: center;">
	<em>Một nam sinh Thái Lan chia sẻ, bạn rất ấn tượng trước sự hiếu khách và niềm nở của sinh viên FPT nói riêng và con người Việt Nam nói chung.</em></p>
<p style="text-align: justify;">
	Hai clip đầu tiên trong Lễ tổng kết chương trình "Getting to know Vietnam" thể hiện rõ nét những đánh giá, cảm nhận của các sinh viên Thái Lan về các danh lam thắng cảnh của Việt Nam, những địa điểm các bạn đã đến cũng như những con người mà các bạn đã gặp, đã chuyện trò tại Việt Nam.</p>
<p style="text-align: justify;">
	Cũng tại Lễ tổng kết, một đất nước Thái Lan với biểu tượng của chùa vàng và lễ hội đã xuất hiện thật gần gũi và sống động qua đoạn clip ngắn do chính các sinh viên Đại học NPRU thực hiện. Ngay sau đó, điệu nhảy trên nền bài hát Thái có giai điệu rộn ràng, tươi vui của 4 nữ sinh Thái Lan đã góp phần thổi lên không khí náo nhiệt, tưng bừng của Lễ tổng kết.</p>
<p style="text-align: center;">
	<img src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_3.jpg" width="540" /></p>
<p style="text-align: center;">
	<em>Nữ sinh Thái Lan trong một điệu múa của người Thái.</em></p>
<p>
	Ngay sau đó, TS Nguyễn Thành Nam đã thay mặt Nhà trường, trao tặng chứng chỉ hoàn thành chương trình "Getting to know Vietnam" cho giảng viên và 20 sinh viên Đại học NPRU. Theo danh sách và thực hiện đúng nghi lễ, từng người trong đoàn bước lên bục sân khấu, đón nhận chứng chỉ của mình.</p>
<p style="text-align: center;">
	<img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_13.jpg" width="540" /></p>
<p style="text-align: center;">
	<em>TS. Nguyễn Thành Nam trao chứng chỉ tốt nghiệp cho sinh viên Đại học NPRU.</em></p>
<p style="text-align: justify;">
	Phần văn nghệ sôi động và giàu màu sắc văn hóa Việt Nam do sinh viên FPT trình bày nối tiếp là điểm độc đáo của Lễ tổng kết lần này. Thông qua phần biểu diễn “Trống cơm”, “Áo dài và Nón lá”, “Gọi đò”, văn hóa dân gian, cái hay, nét duyên của những làn điệu dân ca của đất Việt cũng được các sinh viên Đại học FPT gửi gắm và truyền tải đến những người bạn- những vị khách đến từ xứ sở chùa Vàng.</p>
<p style="text-align: center;">
	<img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_21.jpg" width="540" /></p>
<p style="text-align: center;">
	<em>Sinh viên FPT nhí nhảnh tươi vui trong phần thể hiện múa và hát “Trống cơm”- tiết mục biểu diễn đặc trưng của người dân miền Bắc.</em></p>
<p style="text-align: center;">
	<em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_47.jpg" width="540" /></em></p>
<p style="text-align: center;">
	<em>Sinh viên Thái Lan thích thú trước tác phong cùng điệu bộ tươi vui trong tiết mục văn nghệ của Đại học FPT.</em></p>
<p style="text-align: justify;">
	Bùi Ngô Bảo Thiện, sinh viên khóa 8, người tham gia cả hai tiết mục múa Trống cơm và hát Gọi đò chia sẻ: “Trống cơm là đặc sản của miền Bắc còn bài hát Gọi đò mang âm hưởng của miền Nam Bộ. Qua những tiết mục văn nghệ này, chúng em muốn giới thiệu văn hóa các vùng, miền khác nhau của Việt Nam đến với sinh viên Thái Lan nói riêng và các vị khách quốc tế nói chung”.</p>
<p style="text-align: center;">
	<img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_35.jpg" width="540" /></p>
<p style="text-align: center;">
	<em>Với trang phục đặc trưng của người dân Nam bộ, Bùi Ngô Bảo Thiện thả hồn trong tiếng hát  “Gọi đò”.</em></p>
<p style="text-align: justify;">
	Đỗ Xuân Chinh, Phó Chủ nhiệm CLB No Shy thuộc Đại học FPT cho biết: “Toàn bộ chương trình văn nghệ được CLB chúng em biên đạo và chuẩn bị trong vòng một tuần, chủ yếu là tập luyện tranh thủ vào buổi tối. Cả ba tiết mục đều được các thành viên lấy ý tưởng từ văn hóa đặc trưng của Việt Nam, với mục đích gửi gắm tình cảm, sự vui tươi, hiếu khách của người Việt đến với các bạn sinh viên quốc tế”.</p>
<p style="text-align: center;">
	<img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_38.jpg" width="540" /></p>
<p style="text-align: center;">
	<em>Đoàn sinh viên Thái Lan trong Lễ tổng kết.</em></p>
<p style="text-align: justify;">
	Năm 2013 cũng là thời điểm mở màn cho các sự kiện trong chiến lược “Go Global” - mở phân hiệu tại nước ngoài, tăng cường tuyển sinh quốc tế, thu hút nhiều giảng viên nước ngoài của Trường Đại học FPT. Nửa năm học đầu tiên của năm Quý Tị đã ghi nhận nhiều hoạt động học tập, giao lưu của các đoàn sinh viên Nhật Bản, Thái Lan tại Đại học FPT. Mục tiêu cao nhất của các hoạt động này là đem đến cho sinh viên cơ hội được nâng cao hiểu biết về văn hóa các nước, được học tập và làm việc tại môi trường quốc tế…</p>
<p style="text-align: justify;">
	<strong>Một số hình ảnh trong Lễ tổng kết:</strong></p>
<p style="text-align: center;">
	<strong><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_7.jpg" width="540" /></strong></p>
<p style="text-align: center;">
	<em>Sinh viên Parpupong (Bang) thay mặt cho đoàn Thái Lan gửi lời cảm ơn sâu sắc đến đội ngũ cán bộ, giảng viên cũng như các sinh viên trong đội tutors của Đại học FPT.</em></p>
<p style="text-align: center;">
	<em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_8.jpg" width="540" /></em></p>
<p style="text-align: center;">
	<em>Cô Nguyễn Thị Mơ, Trưởng phòng Trao đổi sinh viên và các khóa đào tạo ngắn hạn- Viện Hợp tác Quốc tế- Trường Đại học FPT đọc Quyết định câp chứng chỉ hoàn thành chương trình học cho đoàn sinh viên Thái Lan.</em></p>
<p style="text-align: center;">
	<em><em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_5.jpg" width="540" /></em></em></p>
<p style="text-align: center;">
	<em>Giai điệu vui vẻ, nhịp điệu lý lắc của bài hát Thái Lan đã nhanh chóng lôi kéo mọi người lên sân khấu tham gia múa hát.</em></p>
<p style="text-align: center;">
	<img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_6.jpg" width="540" /></p>
<p style="text-align: center;">
	<em>Cùng các sinh viên Đại học FPT, TS Nguyễn Thành Nam cũng lên sân khấu, hòa cùng điệu múa và cổ vũ nhiệt tình cho các sinh viên.</em></p>
<p style="text-align: center;">
	<em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_42.jpg" width="540" /></em></p>
<p style="text-align: center;">
	<em>Sinh viên Thái Lan và Việt Nam trong trang phục của quê hương, đất nước mình.</em></p>
<p style="text-align: center;">
	<em><img height="405" src="http://www.fpt.edu.vn/sites/default/files/fuhn_sv_tl_tot_nghiep2_40.jpg" width="540" /></em></p>
<p style="text-align: center;">
	<em>Chương trình khép lại với nhiều điều thú vị và bổ ích cho người học, đồng thời mở ra nhiều tình bạn đẹp của sinh viên Đại học NPRU và Đại học FPT. </em></p>
', 1)
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[Building]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingTypeID] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Garage] [bit] NULL,
	[Pool] [bit] NULL,
	[Garden] [bit] NULL,
	[BedRoom] [int] NULL,
	[BathRoom] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Area] [int] NULL,
	[Picture] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[RentTime] [int] NULL,
	[District] [nvarchar](max) NULL,
	[Coordinates] [varchar](max) NULL,
	[NumberFloor] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Building] ON
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (1, 2, N'Number 23 Tay Ho Street Tay Ho District', 2500, 1, 0, 0, 3, 2, N'23 Tay Ho building apartment has 9 floors, completely brandnew and modern style with Lift, that is a tranquil hideaway for those who want to be close to the city center but without the hustle and bustle of city center living.  Apartments with 160m2, 2 and 3 bedrooms,2 bathrooms, open kitchen and living room, fully furnished and equipment. Internet ADSL, Cable Television, Security, Laundry and housekeeping services 3 times/week,24h/7days in surveillance and also support maintaining services.', 170, N'img24.jpg|bep23.jpg|pk23.jpg|ngu23.jpg|k23.jpg|kk23.jpg|vvc23.jpg|', 0, 50, N'Tay Ho', N'21.066019,105.825832', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (2, 2, N'Number 1 Lac Chinh Street, Ba Dinh District, Ha Noi City', 1100, 1, 0, 0, 1, 1, N'Number 1 Lac Chinh building apartment has 7 floors, absolutely brandnew,  lake view and modern style with elavator, that is a tranquil hideaway for those who want to be close to the city center but without the hustle and bustle of city center living.  Apartments with 80m2 with the lake view, 1 bedroom,1 bathroom, open kitchen, fully furnished and equipment. Laundry and housekeeping services 3 times/week,24/7 in surveillance and also support maintaining services. /1500 USD/month ( Pent  house 3000 USD/ month) negotiable.', 80, N'img26.jpg|bep1lc.jpg|k1lc.jpg|img_0397.jpg|', 3, 48, N'Ba Dinh', N'21.046317,105.841459', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (3, 2, N'Number 182 Tran Vu Street, Ba Dinh District, Ha Noi City', 1100, 0, 0, 0, 1, 1, N'Number 182 Tran Vu building apartment has 6 floors, absolutely brandnew,  lake view and modern style with elavator, that is a tranquil hideaway for those who want to be close to the city center but without the hustle and bustle of city center living.  Apartments with 70m2 with the lake view, 1 bedroom,1 bathroom, open kitchen, fully furnished and equipment. Laundry and housekeeping services 3 times/week,24/7 in surveillance and also support maintaining services. /1300 USD/month.', 70, N'img27.jpg|ktv.jpg|bep1lc.jpg|ntv.jpg|', 0, 0, N'Ba Dinh', N'21.044685,105.841531', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (4, 2, N'Number 14 Alley 31 Xuan Dieu Street, Tay Ho District, Ha Noi City', 1400, 1, 0, 1, 2, 2, N'Number 14 Alley 31 Xuan Dieu building apartment has 5 floors, absolutely brandnew, modern style with elavator, that is a tranquil hideaway for those who want to be close to the city center but without the hustle and bustle of city center living.  Apartments with 120m2 with 2 bedroom,2 bathroom, open kitchen, fully furnished and equipment. Laundry and housekeeping services 3 times/week,24/7 in surveillance and also support maintaining services. /1800 USD/month.', 120, N'img28.jpg|14xd.jpg|bepxd.jpg|nguxd.jpg|', 0, 44, N'Tay Ho', N'21.060967,105.832482', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (5, 2, N'Number 82 Alley 12 Dang Thai Mai ', 1200, 1, 0, 1, 2, 2, N'82 Alley 12 Dang Thai Mai building apartment has 6 floors, completely brandnew and modern style with Lift, lake view, that is a tranquil hideaway for those who want to be close to the city center but without the hustle and bustle of city center living.  Apartments with 120m2, 2 bedrooms, 2 bathrooms, open kitchen and living room, fully furnished and equipment. Internet ADSL, Cable Television, Security, Laundry and housekeeping services 3 times/week,24h/7days in surveillance and also support maintaining services.', 120, N'img29.jpg|pk82xc.jpg|bepxc1.jpg|pn82.jpg|k82xc.jpg|vvc82xc.jpg|', 0, 42, N'Tay Ho', N'21.063957,105.825784', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (6, 1, N'Number 31 Alley 67 To Ngoc Van Street', 2000, 1, 0, 1, 3, 3, N'Our Villa with court yard, garage locate in No 31 Alley 67 To Ngoc Van Street, Tay Ho District, Hanoi. French design, cozy and charming rooms and large window, balcony, modern kitchen, wooden also tile floor, wooden stair.', 150, N'img30.jpg|kh3167.jpg|bep3167.jpg|ngu3167.jpg|vv3167.jpg|an3167.jpg|', 0, 40, N'Tay Ho', N'21.068465,105.824626', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (7, 3, N'Office Number 16 Dang Thai mai Street Tay Ho District', 3500, 1, 0, 1, 1, 1, NULL, NULL, N'img31.jpg|off161.jpg|off162.jpg|off163.jpg|', 0, 38, N'Tay Ho', N'21.064157,105.826192', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (8, 1, N'Number 36A Alley 12 Dang Thai Mai Street', 2500, 1, 0, 1, 3, 3, NULL, NULL, N'img32.jpg|k36a.jpg|b36a.jpg|ng36a.jpg|', 0, 36, N'Tay Ho', N'21.063974,105.825816', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (9, 1, N'10 D2 - Ciputra', 2500, 1, 0, 1, 4, 4, N'A beautiful house, with court yard at back and front of house, locate on Block D2 Ciputra, Tay Ho, Hanoi.There is a beautiful kitchen, wooden floor, nice terrace on the roof...', 200, N'img569.jpg|10-d2---ciputra_2.jpg|10-d2---ciputra_3.jpg|10-d2---ciputra_4.jpg', 2, 34, N'Tay Ho', N'21.072807,105.811164', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (10, 2, N'Number 16 Alley 5/11 To Ngoc Van Street, Tay Ho District.', 2500, 1, 0, 1, 4, 4, N'Villa with big garden, out side table space, beautiful kitchen, tile and wooden floor', 80, N'img432432.jpg|img_0031.jpg|16-ngo-5-11-to-ngoc-van_3.jpg|16-ngo-5-11-to-ngoc-van_4.jpg|', 0, 32, N'Tay Ho', N'21.067972,105.82602', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (11, 1, N'Number 30 Alley 67 To Ngoc Van Street', 6000, 1, 0, 1, 5, 5, N'Our Villa with court yard, garage locate in No 30 Alley 67 To Ngoc Van Street, Tay Ho District, Hanoi. French design, cozy and charming rooms and large window, balcony, modern kitchen, wooden also tile floor, wooden stair.', 150, N'img6.jpg|30-ngo-67-to-ngoc-van_2.jpg|30-ngo-67-to-ngoc-van_3.jpg|30-ngo-67-to-ngoc-van_4.jpg|', 0, 30, N'Tay Ho', N'21.068162,105.825312', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (12, 1, N'Number 33 Alley 67 To Ngoc Van Street', 0, 1, 0, 0, 4, 4, N'Our department with 3 warm bed rooms, a comfortable living room and a large glass door to catch the sunshine and lake view, a modern elevator taking you to door.The design of modern style gives you a feeling of being at your home.', 160, N'img10.jpg|', 0, 28, N'Tay Ho', N'21.065439,105.827136', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (13, 2, N'Number 13 Mac Dinh Chi Street', 1000, 1, 0, 0, 1, 1, N'Our Building located in 13 Mac Dinh Chi Street with a warm bed room, a luxurious living room and a modern Kitchen.The modern elevator will take you to apartment door.The design of modern style gives you a feeling of being at your home.', 80, N'img11.jpg|13-mac-dinh-chi_2.jpg|13-mac-dinh-chi_3.jpg|13-mac-dinh-chi_4.jpg|', 0, 0, N'Ba Dinh', N'21.046655,105.841416', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (14, 2, N'Number 34 Nguyen Khac Hieu Street', 700, 1, 0, 0, 1, 1, N'Our Building is located at 14 Mac Dinh Chi Street with a warm bed room, a comfortable living room and a modern kitchen.The design of apartment is simple style but it gives you a feeling of being at your home.', 80, N'img12.jpg|14-mac-dinh-chi_2.jpg|14-mac-dinh-chi_3.jpg|14-mac-dinh-chi_4.jpg|', 0, 24, N'Ba Dinh', N'21.045917,105.840918', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (15, 3, N'Number 136 E Tran Vu Street', 3000, 1, 0, 0, 3, 2, N'Our apartment with 3 warm bed rooms, a comfortable living room and a large glass door to catch the sunshine and lake view, a modern elevator taking you to door.The design of modern style gives you a feeling of being at your home.', 160, N'img13.jpg|136-tran-vu_2.jpg|img_0394.jpg|img_0279.jpg|', 0, 22, N'Ba Dinh', N'21.044933,105.840799', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (16, 1, N'Number 224 Au Co Street', 450, 1, 0, 1, 1, 1, N'Our Building located in 14 Au Co Street with a warm bed room, a luxurious living room and a modern Kitchen. The design of modern style gives you a feeling of being at your home.', NULL, N'img14.jpg|224-au-co_2.jpg|224-au-co_3.jpg|224-au-co_4.jpg|', 0, 20, N'Tay Ho', N'21.068699,105.826182', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (17, 2, N'Number 136 G Tran Vu Street', 0, 1, 0, 0, 1, 1, NULL, NULL, N'img17.jpg|136g-tranvu-1.jpg|136g-tranvu-2.jpg|136g-tranvu-3.jpg|', 0, 18, N'Ba Dinh', N'21.044933,105.840799', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (18, 1, N'Number 12 Alley 70 Dang Thai Mai Street', 2700, 1, 1, 1, 5, 5, N'Our Villa with court yard, garage locate in No 12 Alley 70 Dang Thai Mai Street, Tay Ho District, Hanoi. French design, cozy and charming rooms and large window, balcony, modern kitchen, wooden also tile floor, wooden stair, Swimming pool.', 150, N'img18.jpg|bep.jpg|beboi.jpg|', 0, 16, N'Tay Ho', N'21.064166,105.826186', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (19, 2, N'Number 136 F Tran Vu Street', 1800, 0, 0, 0, 2, 1, N'Our apartment with 1 warm bed room, a comfortable living room and a large glass door to catch the sunshine and lake view, a modern elevator taking you to door.The design of modern style gives you a feeling of being at your home.', 160, N'img19.jpg|136g-tranvu-2.jpg|phongngu2.jpg|phongngu3.jpg|', 0, 14, N'Ba Dinh', N'21.044933,105.840799', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (20, 3, N'Number 117b Yen Phu Village, Tay Ho District, Ha Noi City', 1000, 0, 0, 0, 3, 4, N'Our Building located in 117 Yen Phu Village, Tay Ho Distrist, Ha Noi City with a warm bed room, a luxurious living room and a modern Kitchen.', 400, N'img20.jpg|bepyp.jpg|lamviec.jpg|ngu.jpg|', 0, 12, N'Tay Ho', N'21.053885,105.836813', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (22, 1, N'Number 06 Alley 49 To Ngoc Van Street', 0, 1, 0, 1, 4, 4, N'Villa with court yard, garden and garage locate in Alley 11/18 To Ngoc Van, Tay Ho, Hanoi. French design, cozy and charming rooms and large window, balcony, modern kitchen, wooden also tile floor, wooden stair.', 300, N'img2112e3.jpg|6-ngo-11-18-to-ngoc-van_2.jpg|6-ngo-11-18-to-ngoc-van_3.jpg|6-ngo-11-18-to-ngoc-van_4.jpg|', 0, 10, N'Tay Ho', N'21.068409,105.824705', 5)
INSERT [dbo].[Building] ([BuildingID], [BuildingTypeID], [Address], [Price], [Garage], [Pool], [Garden], [BedRoom], [BathRoom], [Description], [Area], [Picture], [Status], [RentTime], [District], [Coordinates], [NumberFloor]) VALUES (33, 5, N'Xuân Thủy', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, N'Cau Giay', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Building] OFF
/****** Object:  Table [dbo].[Room]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingID] [int] NULL,
	[Floor] [int] NULL,
	[CurrentCustomerID] [int] NULL,
	[Status] [int] NULL,
	[RoomNo] [int] NULL,
	[IsWarehouse] [bit] NULL,
	[Price] [float] NULL,
	[BedRoom] [int] NULL,
	[BathRoom] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Area] [float] NULL,
	[Picture] [varchar](max) NULL,
 CONSTRAINT [PK_Room_1] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (1, 1, 1, NULL, 0, 101, 0, 1000, 2, 2, NULL, 200, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (2, 1, 1, NULL, 0, 102, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (3, 1, 2, NULL, 0, 201, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (4, 2, 1, NULL, 0, 101, 0, 1000, 2, 1, NULL, 150, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (5, 2, 2, NULL, 0, 201, 0, 1100, 1, 1, NULL, 120, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (6, 2, 3, NULL, 0, 301, 0, 1200, 2, 2, NULL, 160, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (7, 4, 1, NULL, 0, 101, 0, 1300, 2, 2, NULL, 170, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (8, 5, 1, NULL, 0, 101, 0, 1400, 3, 2, NULL, 180, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (9, 1, 4, NULL, 3, 401, 0, 1500, 3, 2, NULL, 190, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (10, 1, 4, NULL, 0, 402, 0, 1600, 3, 2, NULL, 200, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (11, 1, 4, NULL, 3, 403, 0, 1700, 3, 2, NULL, 210, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (12, 1, 5, NULL, 3, 501, 0, 1800, 4, 2, NULL, 220, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (13, 3, 1, NULL, 0, 101, 0, 1900, 4, 2, NULL, 230, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (14, 8, 5, NULL, 3, 505, 0, 2000, 4, 2, NULL, 240, NULL)
INSERT [dbo].[Room] ([RoomID], [BuildingID], [Floor], [CurrentCustomerID], [Status], [RoomNo], [IsWarehouse], [Price], [BedRoom], [BathRoom], [Description], [Area], [Picture]) VALUES (15, 1, 5, NULL, 0, 502, 0, 2100, 4, 2, NULL, 250, N'1337310324_BBBBBBBBBB.jpg|')
SET IDENTITY_INSERT [dbo].[Room] OFF
/****** Object:  Table [dbo].[RequestFurniture]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestFurniture](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[RequestUser] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_RequestFurniture] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furniture]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Furniture](
	[FurnitureID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentBuildingID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[FurnitureTypeID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[MadeIn] [nvarchar](max) NULL,
	[StartWarranty] [date] NULL,
	[EndWarranty] [date] NULL,
	[HandoverID] [int] NULL,
	[CollectionID] [int] NULL,
	[NumberInCollection] [int] NULL,
	[Picture] [varchar](max) NULL,
	[CurrentRoomID] [int] NULL,
	[ApproveDelete] [int] NULL,
	[TargetRoomID] [int] NULL,
	[ApproveMove] [int] NULL,
	[Reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_Furniture] PRIMARY KEY CLUSTERED 
(
	[FurnitureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Furniture] ON
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (25, 33, NULL, 100, 1, N'Chair', 0, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair1.jpg', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (26, 1, N'tét', 110, 2, N'Table', 0, N'Sri Lanka', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table1.jpg', 2, 1, NULL, NULL, N'<p>
	zxcv</p>
')
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (27, 2, N'Sony Pravia 40 Inch', 120, 3, N'Television', 0, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv1.jpg', 5, 2, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (28, 1, NULL, 130, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed1.jpg', 2, NULL, 1, 0, N'<p>
	qưer</p>
')
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (29, 1, NULL, 140, 5, N'TV Remote', 0, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote1.jpg', 7, 1, NULL, 0, N'<p>
	abc</p>
')
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (30, 1, NULL, 150, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition1.jpg', 7, 1, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (31, 1, NULL, 160, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (32, 1, NULL, 170, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (33, 1, NULL, 180, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (215, 2, NULL, 190, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair2.jpg', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (216, 2, NULL, 200, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table2.jpg', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (217, 2, NULL, 210, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv2.jpg', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (218, 2, NULL, 220, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed2.jpg', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (219, 2, NULL, 230, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote2.jpg', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (220, 2, NULL, 240, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition2.jpg', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (221, 2, NULL, 250, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (222, 2, NULL, 260, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (223, 2, NULL, 270, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (224, 33, NULL, 280, 1, N'Chair', 0, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair3.jpg', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (225, 3, NULL, 290, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (226, 3, NULL, 300, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (227, 3, NULL, 310, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (228, 3, NULL, 320, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (229, 3, NULL, 330, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (230, 3, NULL, 340, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (231, 3, NULL, 350, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (232, 3, NULL, 360, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (233, 4, NULL, 370, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (234, 4, NULL, 380, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (235, 4, NULL, 390, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (236, 4, NULL, 400, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (237, 4, NULL, 410, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (238, 4, NULL, 420, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (239, 4, NULL, 430, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (240, 4, NULL, 440, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (241, 4, NULL, 450, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet4.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (242, 5, NULL, 460, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (243, 5, NULL, 470, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (244, 5, NULL, 480, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (245, 5, NULL, 490, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (246, 5, NULL, 510, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (247, 5, NULL, 520, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (248, 5, NULL, 530, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (249, 5, NULL, 540, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (250, 5, NULL, 550, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet5.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (251, 6, NULL, 560, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (252, 6, NULL, 570, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (253, 6, NULL, 580, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (254, 6, NULL, 590, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (255, 6, NULL, 600, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (256, 6, NULL, 100, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (257, 6, NULL, 110, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (258, 6, NULL, 120, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (259, 6, NULL, 130, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet6.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (260, 7, NULL, 140, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (261, 7, NULL, 150, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (262, 7, NULL, 160, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (263, 7, NULL, 170, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (264, 7, NULL, 180, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (265, 7, NULL, 190, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (266, 7, NULL, 200, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (267, 7, NULL, 210, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (268, 7, NULL, 220, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet7.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (269, 8, NULL, 230, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (270, 8, NULL, 240, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (271, 8, NULL, 250, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (272, 8, NULL, 260, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (273, 8, NULL, 270, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (274, 8, NULL, 280, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (275, 8, NULL, 290, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (276, 8, NULL, 300, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (277, 8, NULL, 310, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet8.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (278, 9, NULL, 320, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (279, 9, NULL, 330, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (280, 9, NULL, 340, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (281, 9, NULL, 350, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (282, 9, NULL, 360, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (283, 9, NULL, 370, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (284, 9, NULL, 380, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (285, 9, NULL, 390, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (286, 9, NULL, 400, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet9.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (287, 10, NULL, 410, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (288, 10, NULL, 420, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (289, 10, NULL, 430, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (290, 10, NULL, 440, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (291, 10, NULL, 450, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (292, 10, NULL, 460, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (293, 10, NULL, 470, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (294, 10, NULL, 480, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (295, 10, NULL, 490, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet10.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (296, 11, NULL, 500, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (297, 11, NULL, 510, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (298, 11, NULL, 520, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (299, 11, NULL, 530, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (300, 11, NULL, 540, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (301, 11, NULL, 550, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (302, 11, NULL, 560, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (303, 11, NULL, 570, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (304, 11, NULL, 580, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet11.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (305, 12, NULL, 590, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair12.jpg', NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (306, 12, NULL, 600, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (307, 12, NULL, 100, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (308, 12, NULL, 110, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (309, 12, NULL, 120, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (310, 12, NULL, 130, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (311, 12, NULL, 140, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (312, 12, NULL, 150, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (313, 12, NULL, 160, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet12.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (314, 13, NULL, 170, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (315, 13, NULL, 180, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (316, 13, NULL, 190, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (317, 13, NULL, 200, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (318, 13, NULL, 210, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (319, 13, NULL, 220, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (320, 13, NULL, 230, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (321, 13, NULL, 240, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (322, 13, NULL, 250, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet13.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (323, 14, NULL, 260, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (324, 14, NULL, 270, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (325, 14, NULL, 280, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (326, 14, NULL, 290, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (327, 14, NULL, 300, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (328, 14, NULL, 310, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (329, 14, NULL, 320, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (330, 14, NULL, 330, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (331, 14, NULL, 340, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet14.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (332, 15, NULL, 350, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (333, 15, NULL, 360, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (334, 15, NULL, 370, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (335, 15, NULL, 380, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (336, 15, NULL, 390, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (337, 15, NULL, 400, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (338, 15, NULL, 410, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (339, 15, NULL, 420, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (340, 15, NULL, 430, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet15.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (341, 16, NULL, 440, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (342, 16, NULL, 450, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (343, 16, NULL, 460, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (344, 16, NULL, 470, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (345, 16, NULL, 480, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (346, 16, NULL, 490, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (347, 16, NULL, 500, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (348, 16, NULL, 510, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (349, 16, NULL, 520, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet16.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (350, 17, NULL, 530, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (351, 17, NULL, 540, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (352, 17, NULL, 550, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (353, 17, NULL, 560, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (354, 17, NULL, 570, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (355, 17, NULL, 580, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (356, 17, NULL, 590, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (357, 17, NULL, 600, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (358, 17, NULL, 100, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet17.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (359, 18, NULL, 110, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (360, 18, NULL, 120, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (361, 18, NULL, 130, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (362, 18, NULL, 140, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (363, 18, NULL, 150, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (364, 18, NULL, 160, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (365, 18, NULL, 170, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (366, 18, NULL, 180, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (367, 18, NULL, 190, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (368, 19, NULL, 200, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (369, 19, NULL, 210, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (370, 19, NULL, 220, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (371, 19, NULL, 230, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (372, 19, NULL, 240, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (373, 19, NULL, 250, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (374, 19, NULL, 260, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (375, 19, NULL, 270, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (376, 19, NULL, 280, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet19.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (377, 20, NULL, 290, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (378, 20, NULL, 300, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (379, 20, NULL, 310, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (380, 20, NULL, 320, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (381, 20, NULL, 330, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (382, 20, NULL, 340, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (383, 20, NULL, 350, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (384, 20, NULL, 360, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (385, 20, NULL, 370, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet20.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (395, 22, NULL, 380, 1, N'Chair', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 6, N'chair21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (396, 22, NULL, 390, 2, N'Table', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'table21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (397, 22, NULL, 400, 3, N'Television', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (398, 22, NULL, 410, 4, N'Bed', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'bed21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (399, 22, NULL, 420, 5, N'TV Remote', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'remote21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (400, 22, NULL, 430, 6, N'Air condition', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'aircondition21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (401, 22, NULL, 440, 7, N'Washer', NULL, N'Korea', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'washer21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (402, 22, NULL, 450, 8, N'Refrigerator', NULL, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'refrigerator21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (403, 22, NULL, 460, 9, N'Cabinet', NULL, N'Vietnam', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'cabinet21.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (417, 1, N'Sony Pravia 50 Inch', 470, 3, N'Television', 0, N'Japan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, 1, 1, N'tv1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (418, 5, N'test1', 480, 4, N'test1', 1, N'Afghanistan', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, N'test')
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (419, 1, N'test2', 490, 9, N'test2', 0, N'Albania', CAST(0x26350B00 AS Date), CAST(0x01380B00 AS Date), NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Furniture] ([FurnitureID], [CurrentBuildingID], [Description], [Price], [FurnitureTypeID], [Name], [Status], [MadeIn], [StartWarranty], [EndWarranty], [HandoverID], [CollectionID], [NumberInCollection], [Picture], [CurrentRoomID], [ApproveDelete], [TargetRoomID], [ApproveMove], [Reason]) VALUES (420, 3, N'<p>
	zxcvb</p>', 100, 1, N'Chair', 1, N'Albania', CAST(0x49370B00 AS Date), CAST(0x67370B00 AS Date), NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Furniture] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[LastCheckIn] [date] NULL,
	[LastCheckOut] [date] NULL,
	[LastStay] [int] NULL,
	[LastRoomID] [int] NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
	[Stay] [int] NULL,
	[Discount] [int] NULL,
	[Prepaid] [float] NULL,
	[Remain] [float] NULL,
	[Total] [float] NULL,
	[Email] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Password] [varchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [MiddleName], [LastName], [Gender], [PhoneNumber], [LastCheckIn], [LastCheckOut], [LastStay], [LastRoomID], [CheckInDate], [CheckOutDate], [Stay], [Discount], [Prepaid], [Remain], [Total], [Email], [Status], [Password]) VALUES (2, N'Tung', NULL, N'Do', 0, N'123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tungda01659@fpt.edu.vn', NULL, N'E10ADC3949BA59ABBE56E057F20F883E')
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[FurnitureHistory]    Script Date: 07/18/2013 00:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FurnitureHistory](
	[FurnitureID] [int] NULL,
	[BuildingID] [int] NULL,
	[RoomID] [int] NULL,
	[MoveDate] [date] NULL,
	[HandoverID] [int] NULL,
	[Reason] [nvarchar](max) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (26, 5, 8, CAST(0x94360B00 AS Date), 8, N'Chuyển đồ lần 1')
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (26, 4, 7, CAST(0xB4360B00 AS Date), 8, N'Chuyển đồ lần 2')
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (26, 2, 6, CAST(0xD1360B00 AS Date), 8, N'Chuyển đồ lần 3')
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (26, 1, 2, CAST(0x57370B00 AS Date), 8, N'Chuyển đồ lần 4')
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (33, 8, 14, CAST(0xF1360B00 AS Date), 8, N'Chuyển đồ lần 1')
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (33, 3, 13, CAST(0x10370B00 AS Date), 8, N'Chuyển đồ lần 2')
INSERT [dbo].[FurnitureHistory] ([FurnitureID], [BuildingID], [RoomID], [MoveDate], [HandoverID], [Reason]) VALUES (33, 1, 1, CAST(0x4F370B00 AS Date), 8, N'Chuyển đồ lần 3')
/****** Object:  ForeignKey [FK_MenuBar_MenuBar]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[MenuBar]  WITH CHECK ADD  CONSTRAINT [FK_MenuBar_MenuBar] FOREIGN KEY([ParentID])
REFERENCES [dbo].[MenuBar] ([MenuID])
GO
ALTER TABLE [dbo].[MenuBar] CHECK CONSTRAINT [FK_MenuBar_MenuBar]
GO
/****** Object:  ForeignKey [FK_News_UserAccount]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_UserAccount] FOREIGN KEY([Poster])
REFERENCES [dbo].[UserAccount] ([UserID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_UserAccount]
GO
/****** Object:  ForeignKey [FK_Room_RoomType]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([BuildingTypeID])
REFERENCES [dbo].[BuildingType] ([BuildingTypeID])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Room_RoomType]
GO
/****** Object:  ForeignKey [FK_Room_Building]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Building] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Building]
GO
/****** Object:  ForeignKey [FK_RequestFurniture_Room]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[RequestFurniture]  WITH CHECK ADD  CONSTRAINT [FK_RequestFurniture_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[RequestFurniture] CHECK CONSTRAINT [FK_RequestFurniture_Room]
GO
/****** Object:  ForeignKey [FK_RequestFurniture_UserAccount]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[RequestFurniture]  WITH CHECK ADD  CONSTRAINT [FK_RequestFurniture_UserAccount] FOREIGN KEY([RequestUser])
REFERENCES [dbo].[UserAccount] ([UserID])
GO
ALTER TABLE [dbo].[RequestFurniture] CHECK CONSTRAINT [FK_RequestFurniture_UserAccount]
GO
/****** Object:  ForeignKey [FK_Furniture_Building]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_Building] FOREIGN KEY([CurrentBuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_Building]
GO
/****** Object:  ForeignKey [FK_Furniture_FurnitureCollection]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_FurnitureCollection] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[FurnitureCollection] ([CollectionID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_FurnitureCollection]
GO
/****** Object:  ForeignKey [FK_Furniture_FurnitureType]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_FurnitureType] FOREIGN KEY([FurnitureTypeID])
REFERENCES [dbo].[FurnitureType] ([FurnitureTypeID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_FurnitureType]
GO
/****** Object:  ForeignKey [FK_Furniture_Room]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_Room] FOREIGN KEY([CurrentRoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_Room]
GO
/****** Object:  ForeignKey [FK_Furniture_Room1]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_Room1] FOREIGN KEY([TargetRoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_Room1]
GO
/****** Object:  ForeignKey [FK_Furniture_UserAccount]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_UserAccount] FOREIGN KEY([HandoverID])
REFERENCES [dbo].[UserAccount] ([UserID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_UserAccount]
GO
/****** Object:  ForeignKey [FK_Customer_Room]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Room] FOREIGN KEY([LastRoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Room]
GO
/****** Object:  ForeignKey [FK_FurnitureHistory_Building]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[FurnitureHistory]  WITH CHECK ADD  CONSTRAINT [FK_FurnitureHistory_Building] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
GO
ALTER TABLE [dbo].[FurnitureHistory] CHECK CONSTRAINT [FK_FurnitureHistory_Building]
GO
/****** Object:  ForeignKey [FK_FurnitureHistory_Furniture]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[FurnitureHistory]  WITH CHECK ADD  CONSTRAINT [FK_FurnitureHistory_Furniture] FOREIGN KEY([FurnitureID])
REFERENCES [dbo].[Furniture] ([FurnitureID])
GO
ALTER TABLE [dbo].[FurnitureHistory] CHECK CONSTRAINT [FK_FurnitureHistory_Furniture]
GO
/****** Object:  ForeignKey [FK_FurnitureHistory_Room]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[FurnitureHistory]  WITH CHECK ADD  CONSTRAINT [FK_FurnitureHistory_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[FurnitureHistory] CHECK CONSTRAINT [FK_FurnitureHistory_Room]
GO
/****** Object:  ForeignKey [FK_FurnitureHistory_UserAccount]    Script Date: 07/18/2013 00:31:54 ******/
ALTER TABLE [dbo].[FurnitureHistory]  WITH CHECK ADD  CONSTRAINT [FK_FurnitureHistory_UserAccount] FOREIGN KEY([HandoverID])
REFERENCES [dbo].[UserAccount] ([UserID])
GO
ALTER TABLE [dbo].[FurnitureHistory] CHECK CONSTRAINT [FK_FurnitureHistory_UserAccount]
GO
