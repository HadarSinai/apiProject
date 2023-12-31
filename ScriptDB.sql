USE [Shoes]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](20) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderSum] [money] NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_ApiOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [nchar](10) NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[ProductDescription] [nchar](50) NULL,
	[ProductImage] [nchar](20) NULL,
 CONSTRAINT [PK_Products_1] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RATING]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATING](
	[RaitingId] [int] IDENTITY(1,1) NOT NULL,
	[HOST] [nvarchar](60) NULL,
	[METHOD] [nchar](15) NULL,
	[PATH] [nvarchar](50) NULL,
	[REFERER] [nvarchar](90) NULL,
	[USER_AGENT] [nvarchar](max) NULL,
	[Record_Date] [date] NULL,
 CONSTRAINT [PK_RATING] PRIMARY KEY CLUSTERED 
(
	[RaitingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/12/2023 01:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](40) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[FirstName] [nchar](30) NULL,
	[LastName] [nchar](30) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231210002757_InitialCreate', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'winter              ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'shabbos             ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'women               ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'kids                ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'summer              ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1196, 26, 1073, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1197, 13, 1073, 2)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1198, 11, 1074, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1199, 21, 1074, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1200, 8, 1074, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1201, 15, 1074, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1202, 30, 1075, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1203, 21, 1075, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1204, 15, 1075, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1205, 41, 1075, 2)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1206, 30, 1077, 3)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1207, 8, 1077, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1208, 13, 1078, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1209, 26, 1078, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1210, 13, 1079, 2)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1211, 37, 1080, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1212, 13, 1081, 3)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1213, 26, 1081, 2)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1214, 13, 1082, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1215, 26, 1082, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1216, 13, 1083, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1217, 26, 1083, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1218, 13, 1084, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1219, 26, 1084, 1)
INSERT [dbo].[OrderItem] ([OrderItemId], [ProductId], [OrderId], [Quantity]) VALUES (1220, 13, 1085, 1)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1073, 1011, 200.0000, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1074, 1011, 490.0000, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1075, 1012, 640.0000, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1077, 1013, 450.0000, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1078, 1011, 125.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1079, 1011, 150.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1080, 1014, 270.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1081, 1011, 325.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1082, 1011, 125.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1083, 1011, 125.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1084, 1011, 125.0000, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderSum], [OrderDate]) VALUES (1085, 1011, 75.0000, CAST(N'2023-12-13' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (1, 1, N'halfboots ', 250.0000, N'very nice and strong boots                        ', N'leather-boots2.png  ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (4, 1, N'halfboots2', 300.0000, N'Half boot in two colors                           ', N'leather-boots1.png  ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (8, 2, N'ElegantSho', 150.0000, N'Elegant Shabbat shoes                             ', N'ElegantLeather.png  ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (10, 2, N'woman-shoe', 200.0000, N'Cream colored thick heeled shoes                  ', N'woman-shoes.png     ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (11, 3, N'womanblue ', 100.0000, N'Amazing women''s shoes for everyday                ', N'woman-shoesB.png    ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (13, 3, N'sneaker   ', 75.0000, N'Comfortable and solid shoes                       ', N'sneakerShoes.png    ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (15, 4, N'whiteSneak', 140.0000, N'Impressive and comfortable shoes                  ', N'white-sneaker.png   ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (21, 4, N'girl-shoe ', 100.0000, N'Gold-colored shoes with a flower for decoration   ', N'baby-shoe.png       ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (23, 5, N'men-sandal', 350.0000, N'Ventilated and solid sandals                      ', N'men-sandal.png      ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (26, 5, N'womenBeige', 50.0000, N'Open shoes for summer in cream color              ', N'women-beige.png     ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (28, 4, N'bronzaShoe', 200.0000, N'Impressive and comfortable shoes                  ', N'bronza-shoes3.png   ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (29, 1, N'halfboots3', 300.0000, N'Winter walking boots                              ', N'leather-boots.png   ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (30, 4, N'youngShoe ', 100.0000, N'Children''s shoes for beginners                    ', N'young-childh.png    ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (31, 3, N'Pinkshoes ', 200.0000, N'Colorful shoes
                                  ', N'woman-shoes1.png    ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (33, 3, N'runninghoe', 350.0000, N'Comfortable and light running shoes               ', N'sport-running.png   ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (34, 5, N'Flip flops', 80.0000, N'Flip flops for fun                                ', N'men-leather.png     ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (35, 2, N'brownMan  ', 250.0000, N'Quality shoes for men                             ', N'brown-leather.png   ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (37, 1, N'BlackMan  ', 270.0000, N'Sneakers for men
                                ', N'black-sneakers.png  ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (39, 5, N'brownSndal', 300.0000, N'Brown sandals for men                             ', N'men-sandal2.png     ')
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [ProductPrice], [ProductDescription], [ProductImage]) VALUES (41, 3, N'womanShoe ', 150.0000, N'Nice and colorful shoes                           ', N'colorful-unisex.png ')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RATING] ON 

INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1, N'localhost:44355', N'GET            ', N'/style/product.css', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (2, N'localhost:44355', N'GET            ', N'/api/Category', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (3, N'localhost:44355', N'GET            ', N'/favicon.ico', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (4, N'localhost:44355', N'GET            ', N'/api/Product', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (5, N'localhost:44355', N'GET            ', N'/api/Category', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (6, N'localhost:44355', N'GET            ', N'/api/Product', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (7, N'localhost:44355', N'GET            ', N'/favicon.ico', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (8, N'localhost:44355', N'GET            ', N'/script/ShoppingBag.js', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (9, N'localhost:44355', N'POST           ', N'/api/User/login', N'https://localhost:44355/user.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (10, N'localhost:44355', N'GET            ', N'/api/Category', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (11, N'localhost:44355', N'GET            ', N'/api/Product', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (12, N'localhost:44355', N'GET            ', N'/script/ShoppingBag.js', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (13, N'localhost:44355', N'GET            ', N'/Images/icn-remove.png', N'https://localhost:44355/style/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (14, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (15, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (16, N'localhost:44355', N'GET            ', N'/style/product.css', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (17, N'localhost:44355', N'GET            ', N'/api/Category', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (18, N'localhost:44355', N'GET            ', N'/api/Product', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (19, N'localhost:44355', N'GET            ', N'/favicon.ico', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (20, N'localhost:44355', N'GET            ', N'/script/ShoppingBag.js', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (21, N'localhost:44355', N'POST           ', N'/api/User/login', N'https://localhost:44355/user.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (22, N'localhost:44355', N'GET            ', N'/api/Product', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (23, N'localhost:44355', N'GET            ', N'/api/Category', N'https://localhost:44355/product.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (24, N'localhost:44355', N'GET            ', N'/api/Category', N'https://localhost:44355/product.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (25, N'localhost:44355', N'GET            ', N'/api/Product', N'https://localhost:44355/product.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (26, N'localhost:44355', N'GET            ', N'/Images/icn-remove.png', N'https://localhost:44355/style/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (27, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (28, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (29, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (30, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (31, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (32, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (33, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (34, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (35, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (36, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (37, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (38, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (39, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (40, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (41, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (42, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (43, N'localhost:44355', N'GET            ', N'/api/Product/checkSumOrder', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
INSERT [dbo].[RATING] ([RaitingId], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (44, N'localhost:44355', N'POST           ', N'/api/Orders/post', N'https://localhost:44355/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', CAST(N'2023-12-14' AS Date))
SET IDENTITY_INSERT [dbo].[RATING] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [FirstName], [LastName]) VALUES (1011, N'HadarSinai@gnail.com                    ', N'justHashem12                                      ', N'Hadar                         ', N'Sinai                         ')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [FirstName], [LastName]) VALUES (1012, N'Tamar@gmail.com                         ', N'Tamar@gmail.com                                   ', N'Tamar                         ', N'gooldZvaig                    ')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [FirstName], [LastName]) VALUES (1013, N'sara@gmail.com                          ', N'saraemeno1                                        ', N'sara                          ', N'levi                          ')
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [FirstName], [LastName]) VALUES (1014, N'yuda@gmail.com                          ', N'digrds;gyhg                                       ', N'yuda                          ', N'sinai                         ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
