USE [master]
GO
/****** Object:  Database [OnlineAuctionDB]    Script Date: 1/21/2022 4:30:27 PM ******/
CREATE DATABASE [OnlineAuctionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineAuctionDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS04\MSSQL\DATA\OnlineAuctionDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineAuctionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS04\MSSQL\DATA\OnlineAuctionDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineAuctionDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineAuctionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineAuctionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineAuctionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineAuctionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineAuctionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineAuctionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineAuctionDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineAuctionDB] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineAuctionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineAuctionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineAuctionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineAuctionDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineAuctionDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineAuctionDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineAuctionDB] SET QUERY_STORE = OFF
GO
USE [OnlineAuctionDB]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[Image] [varchar](255) NULL,
	[Document] [varchar](255) NULL,
	[Condition] [varchar](100) NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[MinimumBid] [int] NOT NULL,
	[SalePrice] [int] NULL,
	[BidIncremenent] [int] NOT NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionBid]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionBid](
	[BidId] [int] IDENTITY(1,1) NOT NULL,
	[AuctionId] [int] NULL,
	[UserId] [int] NULL,
	[BidAmount] [int] NOT NULL,
	[Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Content] [text] NOT NULL,
	[Image] [varchar](255) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[AuctionId] [int] NULL,
	[ReceiverId] [int] NULL,
	[ReviewerId] [int] NULL,
	[Star] [int] NOT NULL,
	[Comment] [text] NULL,
	[CreateAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](150) NOT NULL,
	[Address] [varchar](255) NULL,
	[Role] [varchar](50) NOT NULL,
	[Status] [bit] NULL,
	[Fullname] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Winner]    Script Date: 1/21/2022 4:30:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Winner](
	[AuctionId] [int] NOT NULL,
	[WinnerId] [int] NULL,
	[IsCheckOut] [bit] NULL,
	[Report] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auction] ON 

INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (1, N'Foldable Storage Bag for Clothes Quilt Duvet Pillows Blanket Toto Organizer Clothing Bag', N'Highlights:
* Large capacity. To store quilt, blanket, duvet, pillow, clothing, winter jackets, toto
* Space saving. Can be folded up when not in use.
* Visual window in the middle. Conveniently view stored items
[Note: NO cardboard base, NO wire frame inside]

Storage Bag Dimension: 
Type A - 62L (46 x 28 x 48 cm)
Type B - 98L (70 x 50 x 28 cm)
Material: Non-woven Fabric
Package Weight: About 0.2kg
  
Package Content:
- 1 x Storage Bag', N'home1a.PNG,home1b.PNG,home1c.PNG', NULL, N'new', 4, 4, CAST(N'2022-12-31T00:00:00.000' AS DateTime), CAST(N'2022-01-19T15:37:00.000' AS DateTime), 10, 15, 5, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (2, N'Slim Body Dress', N'- Collar: Off shoulder
-Short hand
-Style:
Basic, Korean, Minimalist, Retro, Sexy
-Material: chinos, cotton, polyester
-Skirt style: tight skirt
-Made in China
-Pattern: Smooth
Sent from: Overseas', N'b11.png,b12.png', NULL, N'New', 3, 1, CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-18T18:14:00.000' AS DateTime), 40, 47, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (3, N'Women''s Bag FURLA Ribbon S Bucket Bag', N'- Color: pink black
-Material: genuine leather
-Other: detachable strap
Closure type: flap with Furla logo.
- Dimensions: 19 x 25 x 10 cm
-Adjustable strap: yes
-Origin: Italy
-Warranty: No warranty or premium warranty', N'bag1a.png,bag1b.png,bag1c.png', NULL, N'New', 3, 7, CAST(N'2022-01-18T00:00:00.000' AS DateTime), CAST(N'2022-01-18T19:17:00.000' AS DateTime), 560, 590, 2, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (4, N'Triangle Bed Sheet Clips Bed Button Buckles Elastic Fasteners Grippers Holder Mattress Cover', N'Features:
Quality nylon elastic rope, hold sheets tightly.
Metal plating, does not easy rust.
Duckbill clip containing soft plastics, does not will bite bad sheets and other items.
Can adjustment length, can be longer or shorter.
3 Pull Side of Each Corner. Simple operation.
Fit for bed sheets, mattress pads, tablecloths, ironing board covers, slipcovers and more.

Specifications:
Material: Plastic buckle + elastic band +Metal Clips
Band Width: 25mm
Length: 20 ~ 50 cm
Color: black
Quantity: 1 PC

Package includes:
 1 * Mattress Sheet Clips', N'home2a.PNG,home2b.PNG,home2c.PNG', NULL, N'new', 6, 4, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-31T00:00:00.000' AS DateTime), 16, 16, 5, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (5, N'Natural latex mattress', N'Lien A Classic Latex Mattress uses 100% natural rubber raw materials without impurities and impurities containing ingredients. The mattress has optimal elasticity thanks to the structure of one square hole and one small hole, combined with modern advanced deodorizing technology to provide absolute safety, no skin irritation, no unpleasant odors. guarantee the health of consumers.

Advantages
- With the advantage of being elastic and supple, Lien A Classic latex mattress helps support the spine well, evenly lifts body areas from head to toe, does not cause fatigue, back pain, and is not uncomfortable when used. No matter what position you lie in, the mattress will provide you with optimal support and support. In addition, when you turn while sleeping, the vibration is also reduced so it does not disturb the person lying next to you.
Using 100% natural rubber materials and manufacturing according to ISO - 9001:2008 standards.
 Warranty: 10 YEARS ', N'home1a.PNG,home1b.PNG,home1c.PNG', NULL, N'New', 4, 4, CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(N'2022-01-20T11:00:00.000' AS DateTime), 300, 300, 5, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (6, N'Men''s loafers ALDO PRYPIAFLEX', N'-Style: Featuring a decorative bell detail, this refined driver loafer completes your personal style.
-Details: Round toe loafers
-Leather', N'shoesa.PNG,shoesb.PNG,shoesc.PNG,shoesd.PNG', NULL, N'New', 4, 6, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 85, 86, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (7, N'Bamboo Blind / Bidai Buluh - Natural Colour ( 3''x6''-5''x6'' & 3''x7''-8''x7'' )', N'Technical Data : 
* Provide privacy and natural design.
* To resist rain, strong wind, sunlight and cool down interior temperature.
* Good ventilation and circulation of fresh air.
* Energy saving & Economy.
* Suitable for Outdoor.
* Made in Malaysia.
*  Made By Bamboo
* Colour : Natural.
* Available :  3''x6'' / 4''x6'' & 5''x6''
                    : 3''x7'' / 4''x7'' / 5''x7'' / 6''x7'' / 7''x7'' / 8''x7''', N'home3a.PNG,home3b.PNG,home3c.PNG', NULL, N'rare', 7, 4, CAST(N'2022-01-05T00:00:00.000' AS DateTime), CAST(N'2022-01-30T00:00:00.000' AS DateTime), 50, 50, 5, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (8, N'IKEA HYLLIS Shelving unit, in/outdoor, 60x27x74 cm', N'Practical storage solution in galvanised steel for small spaces indoors or outdoors. Just as suitable on the balcony as in the hallway, kitchen or bathroom. Sturdy, lightweight and approved for wet areas.

This storage unit is perfect for plant pots and plants ? and can easily be transformed into a greenhouse if you complete with HYLLIS cover.

Can be used both indoors and outdoors, and is just as suitable on the balcony as in the kitchen, hallway or bathroom.

With HYLLIS cover you protect your things from rain and dust, sold separately.

If you want a larger storage solution, you can combine several shelving units from the same series.

The included plastic feet protect the floor against scratching.

This shelf must be fastened to the wall; the back panel has predrilled holes to make it easier.

Different wall materials require different types of fixing devices. Use fixing devices suitable for the walls in your home, sold separately.

Width: 60 cm
Depth: 27 cm
Height: 74 cm
Max. load/shelf: 25 kg', N'home4a.PNG,home4b.PNG,home4c.PNG', NULL, N'used', 8, 4, CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), 5, 5, 2, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (9, N'Chair Leg Caps Rubber Feet Protector Pads Furniture Table Covers Bottom', N'Color: Pink,White,Gray
Material: Silicone
Fit for chair feet''s Inner diameter: 
Size : Less than 4 cm
Package : 1pcs

Note: 
1. Due to the light and screen setting difference, the items color may be slightly different from the pictures. 
2. Please allow slight dimension difference due to different manual measurement.
3. If you want extra protection, please add-on bubble wrap service in our store.', N'home5a.PNG,home5b.PNG,home5c.PNG', NULL, N'new', 9, 4, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2022-01-28T00:00:00.000' AS DateTime), 2, 2, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (10, N'Apple iPhone USB-C Power Adapter - OEM SPEC - Fast Charger', N'Color: White	
Items Included:	Aapter
Compatible Model:	For Apple iPhone 11, For Apple iPhone 12, For Apple iPhone 12 Pro Max	
Material:	Plastic
MPN:Does Not Apply	
Mounting Type: Clip
Brand:OEM Spec	
Type:Power Adapter
Number of Ports:	1	
Voltage:9 V
Design/Finish: Glossy	
Connectivity:	USB-C
Cable Length:	n/a	
Features:Fast Charge, OEM
Mounting Location:Wall	
Wireless Charging Standard:N/A
UPC:Does not apply', N'phon11a.PNG,phon11b.PNG,phon11c.PNG', NULL, N'New', 8, 2, CAST(N'2022-01-20T09:58:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), 11, 11, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (11, N'Power Bank 80000mAh Quick Charge Dual USB Large Capacity ', N'Compatible Brand:All smart phones, Universal, For Acer, For Alcatel, For Alcatel-Lucent, For Amazon, For Apple, For ASUS, For Audeze, For Audioengine, For Audiolab, For Dell, For Dopod, For Google, For Huawei, For LG, For Nokia, For OnePlus, For Samsung, For Xiaomi	
Material: Plastic
Connectivity:	Dual USB, Micro-USB, USB-C	
Type:Power Bank
Features: Adjustable Angle, Anti-Peeping, Anti-Scratch, Anti-Spy, Fast Charge	
Color:	Black 
Wireless Charging Standard:usb	Mounting Location:Any where you want
Brand:WST	
UPC: Dose Not Apply', N'phone12a.PNG,phone12b.PNG,phone12c.PNG', N'PowerBank80000mAhQuickChargeDualUSBLargeCapacityFastChargingbattery.docx', N'New', 8, 2, CAST(N'2022-01-18T10:10:00.000' AS DateTime), CAST(N'2022-01-21T10:10:00.000' AS DateTime), 23, 23, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (12, N'Nike Air Force 1 ''07 LX ‘Happy Pineapple’ Green Glow', N'US Shoe Size:	7	
Occasion:Activewear, Casual
Accents:	Logo	
Vintage:	No Cushioning Level:	Moderate	
Department:	Women
Release Year:	2021	
Style:Sneaker
Personalized:	No	
Outsole Material:	Rubber
Features:	Lace-Up	
Season:	Fall, Spring, Summer, Winter
Handmade:	No	
Shoe Shaft Style:	Low Top
UK Shoe Size:	4.5	
Pattern:Solid
Style Code:	CZ0268-300	
Character:	Happy Pineapple	
Color:	Multicolor
Lining Material:	Fabric	
Brand: Nike
Type:Athletic	
Model:Nike Air Force 1	
Theme: Colorful
Shoe Width:	Standard	
Upper Material:	
Synthetic
Insole Material:	Foam	
Country/Region of Manufacture:	
Vietnam
Performance/Activity:	Lifestyle, Casual, Basketball, School, Walking	Character 
Product Line:	Nike Air Force', N'shoe12a.PNG,shoe12c.PNG,shoe12d.PNG,shoes12b.PNG', NULL, N'New', 11, 6, CAST(N'2022-01-19T10:22:00.000' AS DateTime), CAST(N'2022-01-21T10:22:00.000' AS DateTime), 105, 105, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (13, N'Premium Long Sleeve Men''s T-Shirt', N'- The fabric is smooth to the touch, not wrinkled, not ruffled.
- Neck and hands are made of high quality materials, not afraid of peeling.
- Form Body is extremely standard, embracing the shoulder, wearing it very young and stylish, suitable for going out and going to work.
- Made in Viet Nam', N'somi11a.PNG,somi11b.PNG', NULL, N'New', 5, 1, CAST(N'2022-01-18T13:44:00.000' AS DateTime), CAST(N'2022-01-20T13:45:00.000' AS DateTime), 8, 8, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (14, N'Men''s long-sleeve t-shirt, sports style round neck men''s thermal vest', N'- Design: designed according to the latest standard form, suitable for Vietnamese people
- Style: In a sporty shape, it does not lose its form after washing many times
- Material: High quality, elastic, comfortable to exercise
- Special: soft and smooth, light fabric, breathable and quick-drying when washing
- Wear it to the gym, jogging, coffee, travel or everyday wear
- Colors: Black, White, Gray are very easy to match
- Place of production: Vietnam', N'ao11a.PNG,ao11b.PNG,ao11c.PNG,ao11d.PNG', NULL, N'New', 5, 1, CAST(N'2022-01-19T13:49:00.000' AS DateTime), CAST(N'2022-01-22T13:49:00.000' AS DateTime), 9, 9, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (15, N'Real Leather Men''s Needle Buckle Belts', N'+ Made in Vietnam
 + Material: Genuine cowhide - Needle lock face.
  Dimensions: 120cm long x 3.5cm wide
  + Easily coordinate the belt with common outfits
  + Actual product may be more beautiful than the photo.', N'thantlung11b.PNG,thatlung11a.PNG,thatlung11c.PNG', NULL, NULL, 5, 9, CAST(N'2022-01-20T13:55:00.000' AS DateTime), CAST(N'2022-01-21T13:55:00.000' AS DateTime), 12, 12, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (16, N'SAST 2200W . induction cooker', N'- Product line: Induction cooker - Single induction cooker
- Brand: SAST
- Voltage 220V-60Hz
- Power: 2200W
- Touch design
- There are 10 heat levels
- Material: Black glass
- Product size: 28*35cm
- Weight: 3kg
- Packing size:31.5*8.5*39.5cm', N'bep11a.PNG,bep11b.PNG,bep11c.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-17T14:02:00.000' AS DateTime), CAST(N'2022-01-20T14:02:00.000' AS DateTime), 25, 25, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (17, N'Energy-saving 2-way multi-function heating fan', N'_ Power: 220V/50Hz
_ Power 500W
_ Type: hot and wind fan
_ Weight: 1kg
_ Dimensions 25 x 12 x 25cm
_ There are 2 modes: cooling fan and heating
_ There is an activity indicator light
_ Auto shut off if spilled, extremely safe
_ Plastic material, sturdy steel frame
_ Ultra-quiet operation, low noise', N'quat11a.PNG,quat11b.PNG,quat11c.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-19T15:24:00.000' AS DateTime), CAST(N'2022-01-21T15:24:00.000' AS DateTime), 9, 9, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (18, N'Silk Wrap Blouse Shirt Top 3/4 Sleeve Plai', N'Country:	China	
Style:Wrap	
Fabric Type:	Silk
Season:	Fall, Spring, Summer, Winter	
Material:	Silk
Theme:	Classic	
Pattern:	Plaid
Fit:	Regular	
Type:	Blouse	
Features:	Adjustable, Lightweight, Unlined
Color:Multicolor	Collar 
Style: Stand-Up	
Neckline:V-Neck
Garment Care:	Dry Clean Only	
Closure:Tie
Sleeve Length:	3/4 Sleeve	
Occasion:	Casual
Brand:Charter Club	
Sleeve Type:	Classic
Hem Style:Straight Hem	', N'ao12a.PNG,ao12b.PNG,ao12c.PNG,ao12d.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-18T08:51:00.000' AS DateTime), CAST(N'2022-01-21T08:51:00.000' AS DateTime), 19, 19, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (19, N'Casual T-Shirt Large White ', N'Brand : A New Day    
Color: White
Size Type: Regular
Size	: L
Department	:Women
Pattern	:Solid
Closure	:Pullover
Material	:Cotton,Modal
Garment Care :Machine Washable
Neckline:	Crew Neck	
Sleeve Length:	Short Sleeve
Pattern:	Solid		
Occasion:	Casual', N'ao13a.PNG,ao13b.PNG,ao13c.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-19T08:59:00.000' AS DateTime), CAST(N'2022-01-21T08:59:00.000' AS DateTime), 9, 9, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (20, N'Soft Stretch Striped Long Sleeve T-Shirt X-Large Brown', N'Brand :A New Day    
Color: Beige
Size Type :Regular
Size :XL
Department	: Women
Pattern	:Striped
Closure	:Pullover
Material: 100% Cotton
Garment Care:Machine Washable
Neckline:	Crew Neck	
Sleeve Length:	Long Sleeve
Pattern:	Striped	
Occasion:	Casual
Closure:	Pullover	
Country:	Indonesia', N'ao14a.PNG,ao14b.PNG,ao14c.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-20T09:05:00.000' AS DateTime), CAST(N'2022-01-22T09:05:00.000' AS DateTime), 9, 9, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (21, N'Women''s Imitation Pants', N'SIZE M: waist 68cm, length 42cm, hip 96cm, thigh 62cm
+ Brand new skirt model mix very beautiful clothes
+ Soft fabric, the girls inside are comfortable
+ The figure is a bit spread, so it will cover many leg defects for girls
+ Because the pants have elastic waistband, the normal waist that has not been stretched will not differ too much.', N'quan11a.PNG,quan11b.PNG,quan11c.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-20T09:11:00.000' AS DateTime), CAST(N'2022-01-23T09:12:00.000' AS DateTime), 5, 5, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (22, N'Loose-Legged Jeans', N'Soft jeans KO stretch
 size : S M L ( 59kg turn head )
Loose leg pants, simple and easy to match basic
Product i pictures with real photos of the floor
Store the product in a cool place to keep its quality at its best.
Can''t wash the machine with white clothes
Expose the reverse side of the product to avoid fading', N'quan12a.PNG,quan12b.PNG,quan12c.PNG,quan12d.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-21T09:19:00.000' AS DateTime), CAST(N'2022-01-23T09:19:00.000' AS DateTime), 8, 8, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (23, N'SANMAY Wedding Dresses Young Office Dresses', N'- Made in Viet Nam
- Material: thick Mango material
- Color: Black
- Style: Flattering skirt, Very luxurious body hugging. Very delicate and elegant push button combination.
Collar: Round Neck
Occasion: Daily
Dress style: A-line skirt', N'vay11a.PNG,vay11b.PNG,vay11c.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-20T09:27:00.000' AS DateTime), CAST(N'2022-01-22T09:27:00.000' AS DateTime), 9, 9, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (24, N'Lovely Round Neck Short Sleeve Denim Dress', N'Collar: Round Neck
Sleeve Length: Short Sleeve
Material: Denim
Dress type: flare skirt
Suitable for everyday occasions
Length M 81.5 Sleeve length 33 Bust 91 Shoulder Width 38 Waist 76', N'vay12a.PNG,vay12b.PNG,vay12c.PNG', NULL, N'New', 4, 1, CAST(N'2022-01-20T09:33:00.000' AS DateTime), CAST(N'2022-01-23T09:33:00.000' AS DateTime), 6, 6, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (25, N'Left Right or Charging Case Replacement For 1st Generation Apple AirPods', N'Number of Earpieces:	Single	
Color:	White
Custom Bundle:	No	
Brand:	Apple
Form Factor:	In-Ear Only	
Type:	Earbud (In Ear)
Wireless Technology:	Bluetooth	
Model:	Apple AirPods
Connectivity:	Bluetooth	
Features:	
Built-in Microphone
Microphone Type:	Built-In	
Country/Region of Manufacture:	China', N'headset11a.PNG,headset11b.PNG', NULL, N'Used', 4, 2, CAST(N'2022-01-20T09:38:00.000' AS DateTime), CAST(N'2022-01-21T09:38:00.000' AS DateTime), 34, 34, 2, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (26, N'Plantronics BackBeat FIT 3150 True Wireless Sport Earbuds,Sweatproof Waterproof', N'Color Black
Wireless Technology
Bluetooth Connectivity
Micro USB
Form Factor Ear-hook
Microphone Type Built-In
Number of Earpieces :Double
Type :Canal Earbud (In Ear Canal)
Additional Product Features
Brand Color :Black
Year of Manufacture:2010s', N'headset12a.PNG,headset12b.PNG,headset12c.PNG', NULL, N'New', 4, 2, CAST(N'2022-01-21T09:42:00.000' AS DateTime), CAST(N'2022-01-22T09:43:00.000' AS DateTime), 48, 48, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (27, N'Samsung Galaxy S10 Black 128GB Sprint AT&T T-Mobile Verizon Factory Unlocked', N'Camera Resolution:	16.0 MP	
Model:	Samsung Galaxy S10
Country/Region of Manufacture:Vietnam	
Operating System:	Android
Style:	Bar
Custom Bundle:	Yes	
Cellular Band:GSM + CDMA 4G LTE Unlocked
Connectivity:	2G, 3G, 4G, 4G+, 5G, Bluetooth, DLNA, Dual-Band, GPRS, GPS, LTE, NFC, USB Type-C, WAP, Wi-Fi	
Features:	4K Video Recording, Accelerometer, Ambient Light Sensor, AMOLED Display, ANT+, Camera, Fast Charging, Fast Wireless Charging, Fingerprint Sensor, Global Ready, MMS (Multimedia Messaging), Speakerphone, Video Calling, Water-Resistant, Wi-Fi Capable
RAM:8 GB
Color:	Black	
Manufacturer Color:Prism Black', N'phone11a.PNG,phone11b.PNG', N'SamsungGalaxyS10Black128GB.docx', N'New', 4, 2, CAST(N'2022-01-20T09:49:00.000' AS DateTime), CAST(N'2022-01-21T09:49:00.000' AS DateTime), 269, 269, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (28, N'OnePlus 6 Duos 64GB Black A6003 (Unlocked) Reduced Price JW3183', N'Brand :OnePlus
Model :OnePlus 6
Storage Capacity :64 GB
Color Black
Connectivity :USB Type-C, Bluetooth, Wi-Fi, NFC
Processor :Octa Core
Style :Bar
Camera Resolution :20.0 MP
Screen Size :6.3 in
Display Technology :Optic Amoled
Manufacturer Color :Mirror Black
Battery Capacity :3300mAh
Network Technology :GSM / CDMA, Fdd-LTE, TD-LTE, TD-SCDMA, Wcdma (Umts)
Network Generation :4G, 3G, 2G', N'phone13a.PNG,phone13b.PNG,phone13c.PNG', NULL, N'Used', 4, 2, CAST(N'2022-01-20T10:31:00.000' AS DateTime), CAST(N'2022-01-23T10:31:00.000' AS DateTime), 94, 94, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (29, N'Fr iWatch Apple Watch Series 4 5 6 7 SE 40', N'Type:	Snap On
Material:	Plastic	
Compatible Brand:	For Apple
Compatible Model:	For Apple Watch Series 4, For Apple Watch Series 5, For Apple Watch Series 6, For Apple Watch SE, For Apple Watch Series 7	
Features:360 Protection, Anti-Fingerprint, Anti-Scratch, Dustproof, Full Coverage, Glossy, Lightweight, Shockproof, Tempered Glass, Water-Resistant, Reusable
Items Included:Hard Case, Screen Protector	
Color:	Clear
Design/Finish:Glossy, Thin Fit	
Brand:	E-Hightech', N'watch11a.PNG,watch11b.PNG,watch11c.PNG,watch11d.PNG', N'FriWatchAppleWatch.docx', N'Rare', 4, 1, CAST(N'2022-01-20T10:42:00.000' AS DateTime), CAST(N'2022-01-23T10:42:00.000' AS DateTime), 8, 8, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (30, N'Auto Screen Clicker for IOS Android Phone Game Video Live Streaming Auto Tapping', N'Features:	Speed Adjustable, Lightweight, Reusable
MPN:	CP0124	
Compatible Model:For Apple iPhone 11, For Apple iPhone 11 Pro, For Apple iPhone 11 Pro Max, For Apple iPhone 12, For Apple iPhone 12 Pro, For Apple iPhone 12 Pro Max, For Apple iPhone 12 mini, For LG 306G, For Lenovo A1000, For Apple iPhone 13, For Apple iPhone 13 mini, For Apple iPhone 13 Pro, For Apple iPhone 13 Pro Max
Voltage:	5 V		
Wireless Charging Standard:	NO
Mounting Location:	Desktop	
Fastening:	Clip
Compatible Network:	all	
Compatible Brand:for iPhone, For Samsung, For Acer, For Apple, Universal
Number of Ports:	1	
Connectivity:	USB
Brand:	AGPtek
Color:	Black', N'phone14.PNG,phone14a.PNG,phone14c.PNG', N'AutoScreenClickerforIOSAndroidPhoneTappingDeviceAutomaticClickerMachine.docx', N'Rare', 4, 2, CAST(N'2022-01-20T10:56:00.000' AS DateTime), CAST(N'2022-01-22T10:56:00.000' AS DateTime), 9, 9, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (31, N'Icon Upod Pro Micro MICRO Livestream Kit', N'+ Built-in 72 professional sound effects.
+ Suitable for home recording studio, service studio or used to sing live, sing online, sing karaoke on computers, phones.
+ Easily adjust 12 hardware keys without going through software, the top of the sound card has LED lights showing 72 effects when in use.
+ Icon Upod Pro also supports a variety of input and output ports, giving users more flexibility in using attached devices.
+ Icon Upod Pro also supports up to 2 48V Condenser recording mics with 1 musical instrument at the same time, which can be versatilely connected to devices such as Amplifiers, computers, phones...
+ Compatibility: Can be compatible with many Mac, Windows, Ios, Android operating systems.
Connectivity: Designed with 5 inputs, including 2 separate microphone ports, 1 instrument port, 1 RCA standard music input and 1 USB 2.0 I/O port. Along with 4 output ports, including 2 separate headphone output ports and 2 line out output ports. That''s why the upod pro icon can connect to all types of recording microphones, monitors, headphones, musical instruments such as guitars, lutes, ...', N'micro1a.PNG,micro1b.PNG,micto1c.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-20T12:50:00.000' AS DateTime), CAST(N'2022-01-21T12:50:00.000' AS DateTime), 130, 130, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (32, N'562 / 5.000 K?t qu? d?ch Mini refrigerator', N'- Using advanced proprietary technology, does not create harmful gases for the environment and users.
- Minimize noise when operating, the maximum noise is only equivalent to 40~50 dB.
- Heat preservation feature: in addition to cooling as low as 5°C, the 8l mini fridge also has a heat preservation feature. The cabinet can keep coffee, drinks, food warm... at the highest temperature of 65°C.
- Power source: The cabinet is equipped with 2 power cords, one that plugs directly into the household 220V line, the other one plugs into the 12V car charger (Not for 24V charger)', N'tulanh1a.PNG,tulanh1b.PNG,tulanh1c.PNG', NULL, NULL, 4, 3, CAST(N'2022-01-20T12:57:00.000' AS DateTime), CAST(N'2022-01-23T12:57:00.000' AS DateTime), 68, 68, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (33, N'CONTROLED CLOTH DRYER', N'- Clothes dryer with remote control, extremely convenient
- Dry clothes in just a few dozen minutes without having to hang them out in the sun.
- The dryer still retains the scent of the conditioner and the softness of the clothes without creasing and drying like conventional machines.
- Especially after drying clothes, there is a long-lasting fragrance on clothes.
- Using 360-degree fan technology and blowing air from 3 directions.??- The machine runs smoothly without making noise.
- The brackets of the Samsung clothes dryer are made of extremely strong stainless steel, The square frame design helps to hang more clothes
- Sensor function, automatic clothes drying
- Designed with many time settings, the highest is up to 180 minutes, the maximum temperature when drying is up to 70 degrees Celsius.
- Has a sterilization function to kill bacteria when drying up to 99%.
- Save up to 50% of electricity compared to traditional clothes dryers', N'tusay1a.PNG,tusay1b.PNG,tusay1c.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-21T13:01:00.000' AS DateTime), CAST(N'2022-01-22T13:01:00.000' AS DateTime), 21, 21, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (34, N'New generation HANFUEN sofa bed mattress vacuum cleaner', N'- Voltage / Frequency: 220V/50Hz
- Power: 300W
- Dust capacity: 0.?6L
- Weight: 1.4kg
-Designed with a vibrator
- Dimensions: 32x26x17cm
- Length of wire: 3m
- Installed anti-UV mode that automatically diffuses to the outside, just a slight tilt of 30 degrees will immediately turn off the beam light, very safe for people.
- The product is designed to be compact and light, with a weight of only about 1.2kg, easy to use with one hand even for women.
- Cleaning blankets, sheets, pillows, cushions is better than the traditional cleaning method because the grass uses ultraviolet rays to kill bacteria.', N'hutbui1a.PNG,hutbui1b.PNG,hutbui1c.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-20T13:07:00.000' AS DateTime), CAST(N'2022-01-22T13:07:00.000' AS DateTime), 30, 30, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (35, N'Mimi heating fan, Handy energy-saving mini heater with timer', N'- Voltage: 220V/50Hz
- Power: 400W
- Adjustable thermostal from 15-32 ?. Timer programming time
Handy hearter is designed with a compact size of 12 * 8.5 * 16cm, making it easy to move anywhere in the room or move through rooms in the house.
Using the Handy hearter energy-saving mini heating fan is also very simple, you just need to plug it in and the machine will work, quickly warming your room.
In particular, the display shows the temperature level so that you can easily increase or decrease the temperature in the room to be most suitable and comfortable. The product also has a timer off function, you can preset the time you want to use, then go to sleep without worrying about having to wake up to turn off the device.', N'maysuiama.PNG,maysuiamb.PNG,maysuiamc.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-20T13:10:00.000' AS DateTime), CAST(N'2022-01-21T13:11:00.000' AS DateTime), 10, 10, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (36, N'Sharp DW-D12A-W . Dehumidifier and Ionizer', N'With a modern and solid monolithic design, Sharp DW-D12A-W will enhance the elegance in your own home. Rooms with an area of ????20 - 25m2 will help the product work most effectively.
- Combines the ability to release Plasmacluster ions with a high density of 7000 ion particles/cm3. Kills 99.97% of dirt, eliminates bacteria, mold cells, allergens, odors and regenerates water molecules in the air to help keep the space clean.
- The water tank has a capacity of 4 liters to minimize the time to empty the water tray when the water is full, thoughtful when there is a glass line on the front to easily observe the amount of water in the tank. It has a convenient handle and wheels for easy movement.
- When the switch is turned on, the vent will automatically open, you can manually adjust the direction of the vent. In addition, the reverse louver function can be selected, which will automatically open to dehumidify and filter the air on a larger area, similarly when the louver switch is turned off, it will automatically close, folding it does not take up much space. do not use.', N'mayhutam.PNG,mayhutam2.PNG,mayhutam3.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-20T13:15:00.000' AS DateTime), CAST(N'2022-01-22T13:15:00.000' AS DateTime), 230, 230, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (37, N'Korean 2-compartment hot pot grill', N'Material: The stove uses non-stick enameled cast iron material, easy to clean, ensures food hygiene, is not harmful to health.
2-in-1 design: The kitchen is a 2-in-1 combination, grilling and hot pot to help us both enjoy grilled dishes and enjoy hot pot dishes, extremely attractive.
Model: luxurious design, cool, not peeling or rusting
Powerful power: 1200W power cooks food in the fastest time', N'noilaua.PNG,noilaub.PNG,noilauc.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-20T13:23:00.000' AS DateTime), CAST(N'2022-01-22T13:23:00.000' AS DateTime), 80, 80, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (38, N'Mini electric rice cooker', N'- Power used: 220V-50Hz
- Power: 400W
- Pot body material: Color coated metal.
- Material of inner pot: High quality non-stick coated alloy
- The lid creates pressure, keeping the steam to cook the rice more delicious and flexible.
- Safe, energy saving.
- Convenient and fast to use with just one button.
- The diameter of the heating plate is large, and the heat is distributed evenly.
- Compact and delicate design, giving you fragrant rice grains.', N'noicom1a.PNG,noicom1b.PNG,noicom1c.PNG', NULL, N'New', 4, 3, CAST(N'2022-01-21T13:26:00.000' AS DateTime), CAST(N'2022-01-23T13:26:00.000' AS DateTime), 20, 20, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (39, N'Foldable Laptop Table Laptop Desk', N'Dimension: 60cm(L) x 40cm(W) x 26cm(H)
Package Dimension: 75cm(L) x 45cm(W) x 6cm(H)
Volumetric Package Weight: 3.38kg
Product Weight: 2.5kg
Package Weight: 2.85kg

Highlights:
?? Simple and modern design
?? Portable & Foldable
?? Space Saving
?? Smooth surface.
?? Curve table corner
?? Stable W Shaped Table Stand', N'home6a.PNG,home6b,PNG,home6c.PNG', NULL, N'used', 10, 4, CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), 7, 7, 1, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (40, N'FlexC Extended 4 Tier Rack 1.2m Rak Dapur Rak Serbaguna 4 Tingkat Boleh Laras', N'Product Highlights:
-Adjustable feet effectively deal with uneven terrain.
-Barriers prevent items from falling out.
-Self-assemble without tools.

Product Specifications:
-Dimensions: 60 cm (L) x 40cm (W) x 120cm (H)
-Weight: 6.5kg
-Maximum load: 80kg
-Material: tamper-resistant, anti-rust carbon steel + PP gasket
-Suitable to be placed at home such as bedroom/kitchen/living room/storage room
-Plastic sheets are included', N'home7a.PNG,home7b.PNG,home7c.PNG', NULL, N'new', 11, 4, CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), 77, 77, 3, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (41, N'Kitchen Punch-free Wall Mounted Knife Storage Rack with Hook Cloth Holder Cookware Rest Utensils', N'Features:
1. Strong bearing capacity.
2. Good corrosion resistance.
3. Smooth surface.
4. Easy to install and clean.
5. 10 hooks and 3 gaps for knife provided.

Specifications:
Material: Steel
Colour: Black
Size: 60*7*8.5 cm', N'home8a.PNG,home8b.PNG,home8c.PNG', NULL, N'new', 4, 4, CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-20T10:37:00.000' AS DateTime), 22, 30, 2, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (42, N'3-in-1 EcoBee Premium Foldable Chaise Lounge Lazy Chair Napping Chair ', N'New Design 3-in-1 Napping Chair
Suitable for Sitting/Reading/ Laying/ Napping
Modern & Elegance design
3 levels adjustable leg position
Bearing capacity 200Kg
Light weight and Durable
Breathable 600D Oxford Fabric
52cm extra wide for comfortable
Foldable for easy storage and transportation
Best gift for parent and yourself
Alternative to tradition 3V Relax Chair
Color: Grey
Size: L178 x W66 x H32 cm (Opened), L98 x W68 x H15 cm(Folded)
Weight: 8Kg', N'home9a.PNG,home9b.PNG,home9c.PNG', NULL, N'used', 6, 4, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-24T00:00:00.000' AS DateTime), 50, 50, 10, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (43, N'Adjustable Swivel Med-Back Mesh Mixed Color Office Chair/Director Chair', N'Brand : KEMILNG TT-5
~ 3D Backrest
~ Streamlined Armrest
~ Adjustable Headrest
~ Ergonomic Handrail
~ Telescopic Feet
~ Comfortable Seat
~ Have Two Pillows
~ Lifting Handle
~ Back Handle
~ Five Second Get Bed < 150 >
~ Long Extended Backrest : suitable for people of all height
~ Thickened Futaba : Improved comfort
~ Increase waist area : relying on the waist
~ Can lie down and rest
~ DIY & Easy to assembly
~ High density sponge seat
~ Direct factory', N'home10a.PNG,home10b.PNG,home`0c.PNG', NULL, N'new', 7, 4, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-23T00:00:00.000' AS DateTime), 120, 120, 4, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (44, N'BUDGET GAMING PC / CUSTOM MADE PC / CPU DESKTOP / INTEL ', N' FREE COMFAST 1300Mbps USB 2.4G/5.8G WIFI ADAPTER

?? ALL 100% BRAND NEW ITEM WITH FULL WARRANTY
?? WINDOWS 10 PRO ACTIVATED 
?? BASIC SOFTWARE INSTALLATION
?? PLUG & PLAY TERUS
?? READY STOCK
?? SHIP OUT WITHIN 2 WORKING DAYS

?

?? ALL PACKING COME WITH 1TB HDD WITH FULL GAME INSTALLED
?? (OWN ACCOUNT TO PLAY)
?? STEAM PUBG, CSGO, DOTA2, GTAV, APEX LEGEND
?? VALORANT, GESHIN IMPACT, COD WARZONE

?? (FREE TO PLAY - OFFLINE MODE)
?? GTAV , FORZA HORIZON 5, LEFT 4 DEAD 2, TEKKEN 7
?? PES2021, FIFA19, NFS HEAT, MINECRAFT MULTIPLAYER
?? AMERICAN TRUCKS, BATTLEFIELD V, METAL SLUG XX
?? PLANTS VS ZOMBIES, STARCRAFT II, COUNTER STRIKE
?? RED ALERT 3, GAMEHOUSE GAME (130 GAMES)', N'computer1a.PNG,computer1b.PNG,computer1c.PNG', NULL, N'used', 8, 5, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 400, 400, 10, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (45, N'iMac 21 inch | All in one | Liquid Glossy TFT IPS technology display', N'(REFURBISHED) iMac  21" inch
?Processor: intel core 2 Duo 
?Ram: 4GB
?Processor Brand: Intel
?Storage: 128GB HDD/ 256GB HDD / 1TB HDD
?MAC OS X v 10.11.6 (El Capitan)
?Liquid Crystal display Glossy TFT Matrix LCD ', N'computer2a.PNG,computer2b.PNG,computer2c.PNG', NULL, N'used', 9, 5, CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), 200, 200, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (46, N'(CPU BAJET GAMING,OFFICE )DELL OPTIPLEX I5 4TH GEN', N'CPU DELL 3020/7020
??OS WINDOW 10 64BIT
??INTEL CORE I5 4TH GEN
??RAM 4GB / 8GB
????HDD500GB
??MANY USB PORT USB ( HAVE USB 3.0)
??DVD RW,VGA,LAN,
??INTEL HD 4600 GRAPHIC', N'computer3a.PNG,computer3b.PNG,computer3c.PNG', NULL, N'used', 10, 5, CAST(N'2022-01-15T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), 60, 60, 5, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (47, N'Intel Custom Gaming PC / Workstation 10th Gen i7 / i5 / i3 + RTX 3070', N'CPU: Intel Core i5 11400
Cooler: Deepcool Gammaxx 400 XT
MOBO: Asrock B560 Pro4
RAM: Zadak MOAB RGB 2x8GB (16GB) 3200MHz
GPU: iGame RTX 3070 Ultra White OC 8GB
SSD: PNY CS2140 512GB NVMe M.2 PCIe Gen4
PSU: Corsair CV 650W 80+ Bronze
CASE: Phanteks P400 Air White DRGB', N'computer4a.PNG,computer4b.PNG,computer4c.PNG', NULL, N'new', 11, 5, CAST(N'2022-01-16T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime), 1000, 1000, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (48, N'HP 14s-fq0058AU Notebook ( Gold )', N'AMD 3020e (1.2 GHz base clock, up to 2.6 GHz max boost clock, 4 MB L3 cache, 2 cores)
4 GB DDR4-2400 SDRAM (1 x 4 GB)
256 GB PCIe® NVMe™ M.2 SSD
14" HD (1366 x 768)
AMD Radeon™ Graphics
Windows 10 Home Single Language 64
1 year limited onsite parts and labour warranty', N'computer5a.PNG,computer5b.PNG,computer5c.PNG', NULL, N'new', 4, 5, CAST(N'2022-01-17T00:00:00.000' AS DateTime), CAST(N'2022-01-20T10:42:00.000' AS DateTime), 1200, 1260, 60, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (49, N' Lenovo 12.5" Laptops X240 X250 X260 X270 Intel Core SSD HDD Webcam Windows 10 Pro', N'Windows 10 Pro
Laptop comes with adapter
Laptop is skinned on the front casing and palm rest (Sticker A&C)
Upgrade to NEW 240SSD (Kingston 240GB A400 SATA3 2.5 SSD, 3yrs local warranty by distributor.)
External battery only, internal battery is removed. Minimum battery life will be 1 hour.
One month Warranty (Supplier warranty is covering hardware issues only and not covering any physical damages.)
Not installing any software', N'computer6a.PNG,computer6b.PNG,computer6c.PNG', NULL, N'used', 6, 5, CAST(N'2022-01-18T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime), 250, 250, 20, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (50, N'ASUS 10.1" Transformer Book T100 Intel Atom Z3735 Quad Core 1.3GHz 2GB RAM 32/64GB SSD Touchscreen', N'Screen Size:	10.1 inches
Screen Resolution:	1366x768
Max Screen Resolution:	1366 x 768 pixels
Processor:	1.3 GHz Atom Z3735
RAM:	2 GB DDR3
Hard Drive:	32/64 GB emmc
Graphics Coprocessor:	Intel HD Graphics
Card Description	:Integrated
Wireless Type:	Bluetooth
Number of USB 3.0 Ports:	1', N'computer7a.PNG,computer7b.PNG,computer7c.PNG', NULL, N'used', 7, 5, CAST(N'2022-01-19T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), 110, 110, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (51, N'BMAX Y13 360° Laptop 13.3 inch Notebook Windows 10 8GB LPDDR4', N'Windows 10 OS Installed
? 13.3 inch 360° Convertible Touchable IPS 1080P Screen 
? Intel  N4120 Quad Core Four Thread 1.1GHz, up to 2.4GHz
? Intel UHD Graphics 600 GPU 700MHz Frequency
? 8GB LPDDR4 RAM 256GB Expandable SSD
? 1.0MP Front Camera for Photos and Face Chat
? 1.25kg Weight with Backlight Keyboard
? Bluetooth 5.0 and 2*Type-C Ports', N'computer8a.PNG,computer8b.PNG,computer8c.PNG', NULL, N'new', 8, 4, CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), 700, 700, 20, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (52, N'Microsoft Surface Go 3 - Platinum (10.5"/6500Y/8GB/128GB SSD/W11)
4.9
', N'Processor - Dual-core Intel® Pentium® Gold 6500Y processor
Operating System - Windows 11 Home in s mode
Display Type - 10.5”( 1920 x 1280 (220 PPI)  PixelSense™ Display
Memory - 8GB RAM
Storage - 128GB SSD
Warranty - 1-year limited hardware warranty
Graphics - Intel® UHD Graphics 615
Color - Platinum', N'computer9a.PNG,computer9b.PNG,computer9c.PNG', NULL, N'new', 9, 5, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), 1500, 1500, 100, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (53, N'HP Chromebook X360 G3 11.6'' IPS HD Touch Intel Celeron N4020 4GB 32GB eMMC Chrome OS', N'Processor: Intel® Celeron® N4020 with Intel® UHD Graphics 600 (1.1 GHz base frequency, up to 2.8 GHz burst frequency, 4 MB cache, 2 cores)
Memory: 4 GB LPDDR4-2400 MHz RAM (onboard)
Internal Storage: 32 GB eMMC
Display: 11.6" diagonal, HD (1366 x 768), touch, IPS, BrightView, 220 nits, 50% NTSC
Cloud service-Google One™ (with 100 GB of storage and other exclusive benefits for 12 months)
Graphics (integrated): Intel® UHD Graphics 600
Ports: 2 USB 3.1 Type-C® Gen 1 (Power delivery, data transfer, DisplayPort™); 2 USB 3.1 Gen 1; 1 Stereo headphone/microphone combo jack
Camera: 720p HD camera
Audio features: HD audio, dual speakers, integrated microphone
Pointing device: Touchpad with multi-touch gesture support
Wireless: Intel® Wireless-AC 9560 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo (Supporting Gigabit file transfer speeds)
Power: 45 W USB Type-C™ adapter
Battery type: HP Long Life 2-cell, 47 Wh Li-ion polymer
Product color: Chalkboard gray
Minimum dimensions: (W x D x H)29.5 x 20.53 x 2.09 cm
Weight-Starting: 1.45 kg', N'computer10a.PNG,computer10b.PNG,computer10c.PNG', NULL, N'new', 10, 5, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 900, 900, 10, N'Approval')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (54, N'Wedding shoes woman wedding bridal shoes pointed rhinestone', N'Upper material : Silk and satin
Heel height: High heels(7cm)
Sole Material : rubber
Closed mode: Trochanter
style: Korean version
style: Mary Jane shoes
Manufacturing technology: Adhesive
Upper lining material: Microfiber skin
Insole material: latex
Toe style: Sharp point
Heel style: cone 
Depth of opening: Shallow mouth
function: light,ventilation,non-slip
pattern: Solid color
Popular elements: Buckle
Applicable occasions: daily', N'shoes1a.PNG,shoes1b.PNG,shoes1c.PNG', NULL, N'new', 11, 6, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-23T00:00:00.000' AS DateTime), 35, 35, 5, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (55, N'New Arrivals Printed Fashion Canvas Sneakers', N'Size : 36,37,38,39,40,41
 

 Outer Material: VENTILATED CANVAS

 Inner Material: Cotton

 Sole Material: Tendon Rubber', N'shoes2a.PNG,shoes2b.PNG,shoes2c.PNG', NULL, N'rare', 4, 6, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-24T00:00:00.000' AS DateTime), 15, 15, 5, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (56, N'Slippers Women''s Sandal EVA Fashion Slippers Upgrade Japanese', N'ABOUT SIZE: Size may have 2-5cm inaccuracy due to hand measure
ABOUT COLOR: The precise color of the product may vary depending on the specific monitor, the settings and the lighting conditions
Min. Spend RM1 Capped at RM3
100% used, valid till: 23.01.2022
Claim
Top Picks From Shop
READY STOCK??PASAY 2021 Kasut Wanita Home Selipar Room Slippers Women''s Sandal EVA Fashion Slippers Upgrade Japanese Comfortable 4.0cm Thick Sole Shower Slippers House Slippers Indoor Slipper
RM7.50 - RM8.90
READY STOCK??PASAY Kasut Wanita Men’s Shoes Women''s Home Lelaki Perempuan Room Selipar Indoor House ladies shoe Slippers sandal
RM5.60 - RM21.00
READY STOCK??PASAY Jelly Hillary H Sandal Women Shoe Kasut Slipper Flat Perempuan Wanita Women Shoes
RM5.90
', N'shoes3a.PNG,shoes3b.PNG,shoes3c.PNG', NULL, N'new', 6, 6, CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(N'2022-01-28T00:00:00.000' AS DateTime), 6, 6, 1, N'Approval')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (57, N'Wedding Shoes All-Matching Thick Heel Shoes Buckle Bridesmaid', N'Heel Height:Mid-Heel(3cm-5cm)
Sole Material:Rubber
Closure Types:Word-Buckle
Style:Korean-Style
Style:Professional Shoes
Listed Season:2021Spring
Production Process:Adhesive
Shoes Lining:PU
Insole:PU
Toe Style:Women''s Pointed-Toe
With Bottom Style:Chunky-Heel
Opening Depth:Low-Cut
Function:Wear-Resistant,Anti-Slip
Pattern:Solid Color
Popular Elements:Sequined
For the Crowd:Youth(18-40Years Old)
Applicable Occasions:Daily', N'shoes4a.PNG,shoes4b.PNG,shoes4c.PNG', NULL, N'new', 7, 6, CAST(N'2022-01-02T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), 24, 24, 2, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (58, N'Women''s Casual Flat Shoes comfortable Working Pointed loafers British style single shoes', N'Please allow 1-2cm differs due to manual measurement. Please compare the detailed size with yours before you buy.
2. The color of the actual items may slightly vary from the above images due to different computer screen, thanks for your understanding.', N'shoes5a.PNG,shoes5b.PNG,shoes5c.PNG', NULL, N'new', 8, 6, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), 19, 19, 1, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (59, N'Spanner Anti Slip Anti Smash Safety Shoes for Men', N'- SPANNER A Unique Outsole Technology
- Genuine leather upper
- Lace-up closure with round fabric laces and sturdy metal eyelets for a secure fit
- Padded collar and tongue add comfort and stability
- Steel toe protection
- Breathable cambrella lining
- Custom premoulded counter support
- Steel midsole and full outsole stitching
- Anti-slip rubber outsole', N'shoes6a.PNG,shoes6b.PNG,shoes6c.PNG', NULL, N'new', 9, 6, CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 47, 47, 2, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (60, N'Spanner Anti Slip Anti Smash Safety Shoes for Men', N'- SPANNER A Unique Outsole Technology
- Genuine leather upper
- Grip panels for easy pull on
- Padded collar and tongue add comfort and stability
- Steel toe protection
- Breathable cambrella lining
- Steel midsole and full outsole stitching
- Anti-slip sole resistance to oil and acids', N'shoes7a.PNG,shoes7b.PNG,shoes7c.PNG', NULL, N'rare', 10, 6, CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), 66, 66, 1, N'Approval')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (61, N'Elegant Pointed Toe Men Formal Office Brogues Laces Shoes Business Soft Leather ', N'Upper Material: Microfiber Leather
Outsole Material:TPU', N'shoes8a.PNG,shoes8b.PNG,shoes8c.PNG', NULL, N'new', 11, 6, CAST(N'2022-01-19T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), 70, 70, 2, N'Approval')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (62, N'YEEZY BOOST 350 V2 RED CORE BLACK', N'COLOR: Core Black / Core Black / Red
SIZE: 28.5 cm', N'yeezy1.jpg, yeezy2.jpg, yeezy3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 365, 365, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (65, N'Bearbrick BAPE × ALPHA BE @ RBRICK 400%', N'Bearbrick BAPE x ALPHA BE @ RBRICK 400%.
We have collected it as a collection, and we have exhibited a part of it.
I bought it at an auction before, so I don''t know how to get it, so I will consider it as a junk item.', N'bear1.jpg, bear2.jpg, bear3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 41, 41, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (66, N'CHROME HEARTS Dagger Ring Silver 925', N'Chrome Hearts CHROME HEARTS

Brand name   
Dagger ring

size
19.5

size
11', N'chrome1.jpg, chrome2.jpg, chrome3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 255, 255, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (67, N'Richard Orlinski Richard BEAR SPIRIT', N'(GOLD PINK EDITION) Limited Edition New Hublot', N'brick1.jpg, brick2.jpg, brick3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 399, 399, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (68, N'Hublot Classic Fusion', N'Diamond bezel Titanium rubber & alligator self-winding see-through', N'hubtlot1.jpg, hubtlot2.jpg, hoblot3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 4810, 4810, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (69, N'Rolex Datejust 1601', N'Self-winding operation product', N'rolex1.jpg, rolex2.jpg, rolex3.jpg', NULL, N'Used', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 484, 484, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (70, N'Louis Vuitton Saumur 35 Monogram Shoulder Bag', N'Slightly scratched and dirty', N'lvbag-4.jpg,lvbag-5.jpg,lvbag-6.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 120, 120, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (71, N'Monogram Shoulder Bag Men''s Express District', N'I think it is a beautiful product without any noticeable scratches or rubbing.
It will be a genuine product purchased at Tokyo Daimaru. I used it several times.', N'lvbag-1.jpg,lv-bag.jpg,lvbag-3.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 600, 600, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (72, N'Gucci rucksack GG PVC leather Blooms', N'Extreme beauty product', N'gu-1.jpg,gu-2.jpg,gu-3.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 108, 108, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (73, N'Disney Mickey Long wallet Bi-fold Men''s ', N'Gucci was founded in 1921 by Guccio Gucci, who founded a luxury leather goods store in Italy. The double G monogram "GG" devised by Guccio Gucci himself is still loved by people all over the world, and the minimum and sophisticated items are always the focus of the fashion world.', N'gu-4.jpg,gu-5.jpg,gu-6.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 580, 580, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (74, N'COACH Zippy wallet long wallet Snoopy', N' This product is an outlet genuine product purchased at an American officially managed factory store', N'coach-1.jpg,coach-2.jpg,coach-3.jpg', NULL, N'New', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 90, 90, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (75, N'Louis Vuitton Damier Graffit Vertical Round Zipper Wallet Zippy Wallet Long', N'There are no opening and closing problems with 2 fasteners.
There is no stickiness.', N'lv-1.jpg,lv-2.jpg,lv-3.jpg', NULL, N'New', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 458, 458, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (76, N'MCM Monogram Visetos Pattern Leather Handbag Mini Boston Bag', N'Slightly scratched and dirty', N'mcm-ba.jpg,mcm-bag.jpg,mcm-bag1.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 46, 46, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (77, N'MCM Waist Pouch Visetos Brown PVC', N'Outside: Thread on the corner
Inside: Slightly dirty
Metal fittings: Thread, Kusumi', N'mcm-1.jpg,mcm-2.jpg,mcm-3.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 270, 270, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (78, N'MCM Visetos backpack with side studs', N'Good product. A product that gives a good impression as a whole, although it has a little usability and aged.', N'mcm-4.jpg,mcm-5.jpg,mcm-6.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 406, 406, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (79, N'GG canvas × leather round shoulder bag Mickey Mouse', N'A cute Mickey Mouse is printed on the round shoulder bag ? It''s a bag that makes going out fun!', N'gc-1.jpg,gc-2.jpg,gc-3.jpg', NULL, N'Used', 1, 7, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 748, 748, 50, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (80, N'Kawasaki Z1000J Lawson Car', N'Kawasaki Z1000J Import new then full restore base', N'bike1.jpg,bike2.jpg,bike3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 1450, 1450, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (81, N'Honda Gyro Canopy Reiwa', N'The rear box is a little unusual type, so it looks fashionable.
Since it is a full normal car, the limiter operates at 55 km.
As shown in the picture, it has a USB terminal, so you can move while charging your mobile phone.', N'bike4.jpg,bike5.jpg,bike6.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 4980, 4980, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (82, N'Little Cub Engine production AA01', N' Displacement: 50 cc
? Chassis number : AA01-330 ***
 Coloring: Yellow
 Meter display: 65673 km', N'cub1.jpg,cub2.jpg,cub3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 3550, 3550, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (83, N'The Honda Dio SR AF25', N'engine has been confirmed to start with a parts cleaner . Since

there is no gasoline at present,
only a slight idling and an increase in engine speed have been confirmed.

There is no caliper only.
', N'dio1.jpg,dio2.jpg,dio3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 3580, 3580, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (84, N'HONDA CRM250 MD24', N'Engine will be in operation.
I think that the startability and the blow-up are good for the old two cycle.', N'xe1.jpg,xe2.jpg,xe3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 6000, 6000, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (85, N'Yamaha PAS Brace XL Yellow', N'Disc Brake Interior 8-speed gear Running 150km!', N'bic1.jpg,bic2.jpg,bic3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 191, 191, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (86, N'BROMPTON BLACK Edition', N'Mid C LINE Explorer M6L Turkish Green Brompton Folding Bike Black Edition', N'bicycle1.jpg,bicycle2.jpg,bicycle3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 216, 216, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (87, N'Bridgestone HYDEE.B', N'3-speed battery 8.7AH 26 inch 26 type', N'hyder1.jpg,hyder2.jpg,hyder3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 300, 300, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (88, N'YAMAHA Road Bike ypj-r', N'Beautiful goods with electric assist', N'yamaha2.jpg,yamaha1.jpg,yamaha3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 786, 786, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (89, N'Mercedes-Benz MB-20FD', N'20 inch folding bike', N'benz1.jpg,benz2.jpg,benz3.jpg', NULL, N'Used', 1, 8, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 330, 330, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (90, N'A Bathing Ape Camo Shark Face Mask', N'Neck warmer Cold protection hood muffler Hat', N'ape1.jpg,ape2.jpg,ape3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 47, 47, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (91, N'Nike AIR JORDAN 11 RETRO LOW', N'BLACK / TRUE RED-WHITE Black x Red x White Size US 9 (27cm)', N'jd1.jpg,jd2.jpg,jd3.jpg', NULL, N'Used', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 348, 348, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (92, N'Supreme Louis vuitton Monogram Hooded', N'Box Logo ZIP Sweat Red monogram Monogram Size L', N'supreme1.jpg,supreme2.jpg,supreme3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 4459, 4459, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (93, N'Fendi Monster Tote Nylon Leather', N'This is Fendi''s monster tote.
It consists of leather parts on a nylon base.', N'fendi1.jpg,fendi2.jpg,fendi3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 698, 698, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (94, N'YEEZY BOOST 350 V2 RED CORE BLACK', N'COLOR: Core Black / Core Black / Red
SIZE: 28.5 cm', N'yeezy1.jpg,yeezy2.jpg,yeezy3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 365, 365, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (95, N'Bearbrick BAPE × ALPHA BE @ RBRICK 400%', N'Bearbrick BAPE x ALPHA BE @ RBRICK 400%.
We have collected it as a collection, and we have exhibited a part of it.
I bought it at an auction before, so I don''t know how to get it, so I will consider it as a junk item.', N'bear1.jpg,bear2.jpg,bear3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 41, 41, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (96, N'CHROME HEARTS Dagger Ring Silver 925', N'Chrome Hearts CHROME HEARTS

Brand name   
Dagger ring

size
19.5

size
11', N'chrome1.jpg,chrome2.jpg,chrome3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 255, 255, 10, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (97, N'Richard Orlinski Richard BEAR SPIRIT', N'(GOLD PINK EDITION) Limited Edition New Hublot', N'brick1.jpg,brick2.jpg,brick3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 399, 399, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (98, N'Hublot Classic Fusion', N'Diamond bezel Titanium rubber & alligator self-winding see-through', N'hublot1.jpg,hublot2.jpg,hublot3.jpg', NULL, N'New', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 4810, 4810, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (99, N'Rolex Datejust 1601', N'Self-winding operation product', N'rolex1.jpg,rolex2.jpg,rolex3.jpg', NULL, N'Used', 1, 9, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 484, 484, 100, N'Inactive')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (100, N'Ngày mai an gì', N'An gì cung du?c', N'bear1.jpg,bear2.jpg,bear3.jpg', NULL, N'Used', 4, 9, CAST(N'2022-01-21T13:10:00.000' AS DateTime), CAST(N'2022-01-22T13:14:50.000' AS DateTime), 200, 200, 10, N'Active')
INSERT [dbo].[Auction] ([AuctionId], [Title], [Description], [Image], [Document], [Condition], [UserId], [CategoryId], [StartDate], [EndDate], [MinimumBid], [SalePrice], [BidIncremenent], [Status]) VALUES (101, N'Tom & Jerry', N'Tom is a cat, Jerry is not a cat', N'brick1.jpg,brick2.jpg,brick3.jpg', NULL, N'Used', 4, 1, CAST(N'2022-01-21T14:08:00.000' AS DateTime), CAST(N'2022-01-21T14:15:00.000' AS DateTime), 350, 400, 10, N'Inactive')
GO
SET IDENTITY_INSERT [dbo].[Auction] OFF
GO
SET IDENTITY_INSERT [dbo].[AuctionBid] ON 

INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (1, 1, 6, 15, CAST(N'2022-01-19T15:36:53.950' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (2, 2, 5, 45, CAST(N'2022-01-10T14:35:15.517' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (3, 8, 13, 30, CAST(N'2022-01-20T10:36:37.240' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (4, 16, 9, 1260, CAST(N'2022-01-20T10:41:05.653' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (6, 7, 5, 510, CAST(N'2022-01-14T14:50:46.367' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (7, 3, 4, 590, CAST(N'2022-01-18T19:16:50.670' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (8, 6, 5, 88, CAST(N'2022-01-19T16:29:26.040' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (9, 101, 18, 390, CAST(N'2022-01-21T14:14:25.170' AS DateTime))
INSERT [dbo].[AuctionBid] ([BidId], [AuctionId], [UserId], [BidAmount], [Time]) VALUES (10, 101, 18, 400, CAST(N'2022-01-21T14:14:44.967' AS DateTime))
SET IDENTITY_INSERT [dbo].[AuctionBid] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Fashion')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Phone and Accessories')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Electrical Appliances')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Home & life')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Computer')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Shoes')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Bag and Wallet')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (8, N'Motorcycle & Bicycle')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (9, N'Fashion accessorie')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (1, N'Signup', N'Firstly, you need to register an account', N'images/signupicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (2, N'Login', N'Secondly, let''s login your account', N'images/loginicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (3, N'Search', N'You can easily search for products by product name, price, category or condition', N'images/searchicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (4, N'Bid', N'You can also easily view product details, auction history and reviews about user that posted auction. After that, if you like the product, you can bid it right away', N'images/bidicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (5, N'Expired', N'When the auction expires and you are lucky to be the winner, admin will send an email for congratulationing you', N'images/emailicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (7, N'Checkout', N'Then you need to pay for good', N'images/payicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (8, N'Review', N'We look forward to receiving your feedback about the seller', N'images/reviewicon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Title], [Content], [Image], [CreateDate]) VALUES (9, N'Report', N'In the case you paid but don''t receive product or anything about product please send report to Admin ', N'images/reporticon.png', CAST(N'2022-01-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [AuctionId], [ReceiverId], [ReviewerId], [Star], [Comment], [CreateAt]) VALUES (1, 1, 4, 6, 10, N'Good Items', CAST(N'2022-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [AuctionId], [ReceiverId], [ReviewerId], [Star], [Comment], [CreateAt]) VALUES (2, 2, 3, 5, 10, N'Good Items', CAST(N'2022-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [AuctionId], [ReceiverId], [ReviewerId], [Star], [Comment], [CreateAt]) VALUES (3, 3, 3, 4, 10, N'Good Items', CAST(N'2022-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [AuctionId], [ReceiverId], [ReviewerId], [Star], [Comment], [CreateAt]) VALUES (4, 16, 4, 9, 10, N'Good Items', CAST(N'2022-01-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (1, N'admin', N'123', N'0937234555', N'admin@gmail.com', N'390 CMT8,P11,Q.3,TPHCM', N'admin', 1, N'Administrator')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (2, N'spring', N'123', N'09875142361', N'springseason@gmail.com', N'quan 1, tphcm', N'admin', 1, N'spring season')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (3, N'dung', N'123', N'0934555434', N'lisathu996@gmail.com', N'48 Hung Vuong, Can Tho', N'user', 1, N'Vo Kim Dung')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (4, N'thu', N'234', N'0912345678', N'nguyenminhthu168@gmail.com', N'23 Hong Bang', N'user', 1, N'Nguyen Minh Thu')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (5, N'thinh', N'123', N'0908888123', N'cubvn352k@gmail.com', N'346 HB, Ha Noi', N'user', 1, N'Phuc Thinh')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (6, N'summer', N'123', N'0896574123', N'summerseason@gmail.com', N'quan 2, tphcm', N'user', 1, N'summer season')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (7, N'huonglan86', N'123', N'0937234554', N'lanhuong@gmail.com', N'39 Hung Vuong,Nga Bay,Hau Giang', N'user', 1, N'Tran Huong Lan')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (8, N'hongphuc', N'123', N'0923423454', N'hongphuc@gmail.com', N'37/4 Pham Hong Thai,Q3,TPHCM', N'user', 1, N'Pham Hong Phuc')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (9, N'huynhanhchichi', N'123', N'098127833', N'chichihuynh@gmail.com', N'388 Hoang Van Thu, Q8,TPHCM', N'user', 1, N'Tran Huynh Anh')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (10, N'autumn', N'123', N'0987415236', N'autumnseason@gmail.com', N'quan 3, tphcm', N'user', 1, N'autumn season')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (11, N'ngocmai', N'123', N'0923434552', N'ngocmai23@gmail.com', N'372 Ly Thuong Kiet,Q8, TPHCM', N'user', 1, N'Nguyen Ngoc Mai')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (12, N'winter', N'123', N'0874512306', N'winterseason@gmail.com', N'quan 4, tphcm', N'user', 1, N'winter season')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (13, N'kasper', N'123', N'0985632014', N'kaspersmeichel@gmail.com', N'quan 5, tphcm', N'user', 1, N'kasper smeichel')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (14, N'kathy', N'123', N'0985632574', N'kathythaonguyen@gmail.com', N'quan 6, tphcm', N'user', 1, N'kathy thao nguyen')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (15, N'ryan', N'123', N'0954781023', N'ryanreynolds@gmail.com', N'quan 7, tphcm', N'user', 1, N'ryan reynolds')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (16, N'may', N'123', N'0748512365', N'luckyloof@gmail.com', N'quan 8, tphcm', N'user', 1, N'lucky loof')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (17, N'judy', N'123', N'0963258741', N'vothikimdung27@gmail.com', N'quan 9, tphcm', N'user', 1, N'judy')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Phone], [Email], [Address], [Role], [Status], [Fullname]) VALUES (18, N'Thinh Phan', N'123', N'0909123123', N'cubvn1404@gmail.com', N'590 CMT8', N'user', 1, N'Phuc Thinh')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[Winner] ([AuctionId], [WinnerId], [IsCheckOut], [Report]) VALUES (1, 6, 0, NULL)
INSERT [dbo].[Winner] ([AuctionId], [WinnerId], [IsCheckOut], [Report]) VALUES (2, 5, 0, NULL)
INSERT [dbo].[Winner] ([AuctionId], [WinnerId], [IsCheckOut], [Report]) VALUES (3, 4, 1, NULL)
INSERT [dbo].[Winner] ([AuctionId], [WinnerId], [IsCheckOut], [Report]) VALUES (16, 9, 0, NULL)
INSERT [dbo].[Winner] ([AuctionId], [WinnerId], [IsCheckOut], [Report]) VALUES (101, 18, 1, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534CABFEFE8]    Script Date: 1/21/2022 4:30:28 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [OnlineAuctionDB] SET  READ_WRITE 
GO
