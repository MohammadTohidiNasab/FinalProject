USE [master]
GO
/****** Object:  Database [DivarDb]    Script Date: 10/13/2024 2:36:59 PM ******/
CREATE DATABASE [DivarDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DivarDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DivarDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DivarDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DivarDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DivarDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DivarDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DivarDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DivarDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DivarDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DivarDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DivarDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DivarDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DivarDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DivarDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DivarDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DivarDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DivarDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DivarDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DivarDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DivarDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DivarDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DivarDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DivarDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DivarDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DivarDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DivarDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DivarDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DivarDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DivarDb] SET RECOVERY FULL 
GO
ALTER DATABASE [DivarDb] SET  MULTI_USER 
GO
ALTER DATABASE [DivarDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DivarDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DivarDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DivarDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DivarDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DivarDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DivarDb', N'ON'
GO
ALTER DATABASE [DivarDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [DivarDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DivarDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/13/2024 2:37:00 PM ******/
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
/****** Object:  Table [dbo].[advertisements]    Script Date: 10/13/2024 2:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](500) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[Category] [nvarchar](50) NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_advertisements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/13/2024 2:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241010100409_init', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[advertisements] ON 

INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (1, N'کامپیوتر دسکتاپ مدل H610T4490', N'کیس اسمبل شده H610T4490 Gaming یک رایانه خانگی/اداری و بازی رده بالاست که تمامی نیازمندیهای روزانه پیشرفته خانگی و اداری از جمله وبگردی، نمایش فیلم، مجموعه نرم افزار آفیس، برنامه نویسی و همچنین نرم افزارهای گرافیکی و بازی های رایانه ای را به خوبی پاسخ می‌دهد. این رایانه مجهز به پردازنده‌ی 12 هسته‌ای Intel Core i5-12400 با فرکانس 4.40GHZ متعلق به نسل 12 پردازنده های شرکت اینتل می‌باشد و همچنین یک کارت گرافیگ GeForce GTX 1650 D6 4G با خروجی HDMI و DVI میباشد که با 64 گیگ رم از نوع DDR4 و یک هارد د', N'https://m.media-amazon.com/images/I/71snht4ZY+L._AC_UF1000,1000_QL80_.jpg', 1000, CAST(N'2024-10-10T13:36:19.0593344' AS DateTime2), N'کامپیوتر', 1)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (2, N'ساعت مچی دیجیتال اسکمی مدل 88-16 کد 01', N'از پر‌طرفدار‌ترین اکسسوری‌های مردانه و زنانه، ساعت‌های مچی هستند که در انواع مختلف عقربه‌ای و دیجیتال در بازار عرضه می‌شوند. معمولا ساعت‌های مچی دارای تاریخ‌شمار روز، ماه و سال نیز هستند که در دو نوع مکانیکی و کوارتز وجود دارند. ساعت مچی دیجیتال اسکمی مدل 88-16 کد 01 دارای موتور کوارتز بوده، این نوع محصول نیروی مورد نیاز خود را از طریق یک باتری تامین می‌کنند. این مدل ساعت‌ها در اندازه‌گیری زمان بسیار دقیق و قابل اعتماد بوده و درصد خطای آن‌ها کم‌تر از انواع دیگر است. ساعت مچی دیجیتال اسکمی مدل 88', N'https://cdnfa.com/asnakala/c4f8/files/6400020.jpg', 600000, CAST(N'2024-10-10T13:36:47.3808394' AS DateTime2), N'ساعت', 1)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (3, N'گوشی موبایل سامسونگ مدل Galaxy A15', N'گوشی‌های میان‌رده سامسونگ توانسته‌اند تا به امروز با بهره بردن از مشخصات فنی مناسب، به نسبت قیمت در نظر گرفته شده، عملکرد بسیار خوبی را به‌نمایش بگذارند و این بار نوبت به سامسونگ Galaxy A15 رسیده است تا با قیمتی مقرون به‌صرفه روانه بازار شود. همانطور که می‌دانیم نسل قبلی این گوشی یعنی Galaxy A14 توانست محبوبیت بسیار بالایی در بین کاربران به دست آورد. این بار اما Galaxy A15 به نسبت نسل قبلی خود در بخش صفحه‌نمایش و پردازنده عملکرد به مراتب بهتری خواهد داشت. البته نباید فراموش کنیم که بهره بردن از ', N'https://coralphone.com/wp-content/uploads/2023/06/Coralphone-4-1.jpg', 8000, CAST(N'2024-10-10T13:37:14.8389279' AS DateTime2), N'گوشی', 1)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (4, N'کتاب تکه هایی از یک کل منسجم اثر پونه مقیمی نشر بینش نو', N'کتاب تکه‌هایی از یک کل منسجم کتاب تکه هایی از یک کل منسجم نوشته پونه مقیمی، روانشناس و روانکاو ایرانی، یکی از پرفروش‌ترین کتاب‌های روانشناسی سال‌های اخیر در ایران است. این کتاب در نه فصل و حول محور خودشناسی و نگاه به درون به رشته تحریر درآمده و با استقبال خوب خوانندگان فارسی زبان مواجه شده‌است. در ادامه به بررسی این کتاب می‌پردازیم. خلاصه‌ای از کتاب تکه‌هایی از یک کل منسجم نویسنده در این کتاب، با بهره‌گیری از دانش روانشناسی و تجربیات خود، به خواننده کمک می‌کند تا با نگاهی عمیق‌تر به خویشتن، و زن', N'https://phoo.ir/wp-content/uploads/edd/zhanet/23400-6016x4016-phoo.ir_.jpg', 500, CAST(N'2024-10-10T13:37:45.3958740' AS DateTime2), N'کتاب', 1)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (5, N'کامپیوتر دسکتاپ سادیتا مدل KDI-SS-core i5 SSD/Ram 12GB', N'این کامپیوتر مجهز به پردازنده (CPU): core i5 3470 و 12 گیگابایت حافظه رم (RAM) و هارد (Hard Drive) : 128GB SSD + 500GB HDD و کارت گرافیک : INTEL HD 3000 میباشد... از دیگر امکانات این پلتفرم میتوان به درایو نوری (DVD WR) اشاره کرد. پورت و خروجی های این دستگاه کامل میباشد و دارای 6 عدد پورت USB از نوع 3.0 و 2.0 میباشد ، خروجی های‌مختلف تصویر از مزایای دیگر این مدل کیس میباشد.', N'https://jalebamooz.com/wp-content/uploads/2019/04/desktop-program-750x405.jpg', 4222, CAST(N'2024-10-10T13:38:28.8977621' AS DateTime2), N'کامپیوتر', 1)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (6, N'ساعت مچی دیجیتال مدل تک زمانه کرنومتر دار کد ۱', N'نوع ساعت دیجیتال زنانه و مردانه

ساعت دیجیتال

رنگ بدنه

مشکی

رنگ صفحه

طوسی

نوع موتور ساعت

کوارتز

استایل کاربری

کلاسیک

رسمی

لوکس

فشن

کژوال

ورزشی', N'https://myroz.ir/wp-content/uploads/2024/04/19-.webp', 720, CAST(N'2024-10-10T13:39:58.7999353' AS DateTime2), N'ساعت', 2)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (7, N'گوشی موبایل اپل مدل iPhone 13 CH دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت - نات اکتیو', N'گوشی موبایل iPhone 13 CH پرچم‌دار جدید شرکت اپل است که با چند ویژگی جدید و دوربین دوگانه روانه بازار شده است. نمایشگر آیفون 13 به پنل Super Retina مجهز ‌شده است تا تصاویر بسیار مطلوبی را به کاربر عرضه کند. این نمایشگر رزولوشن بسیار بالایی دارد؛ به‌طوری‌که در اندازه­‌ی 6.1 اینچی‌اش، حدود 460 پیکسل را در هر اینچ جا داده است. امکان شارژ بی‌‌سیم باتری در این گوشی وجود دارد. تشخیص چهره با استفاده از دوربین جلو دیگر ویژگی است که در آیفون جدید اپل به کار گرفته شده است. از نظر سخت‌‌افزاری این گوشی از تر', N'https://www.technolife.ir/image/color_image_TLP-34773_9ee3202a-8a9d-4747-9354-2f9f8e718e74.png', 9000, CAST(N'2024-10-10T13:40:26.4211506' AS DateTime2), N'گوشی', 2)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (8, N'گوشی موبایل شیائومی مدل Redmi A3 دو سیم کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت', N'گوشی‌ها هر روز زرق و برق بیشتری پیدا می‌کنند و ویژگی‌های جدیدتری را به لیست خود اضافه می‌کنند. در میان افراد زیادی هم هستند که نیازی به این ویژگی‌های حرفه‌ای ندارند و یک گوشی کاربردی و معمولی برای استفاده روزانه می‌خواهند که قیمت نسبتا مناسب‌تری داشته باشد. گوشی موبایل شیائومی مدل Redmi A3 یک گوشی با این مشخصات است. این گوشی کیفیت ساخت مناسبی دارد و از نظر ابعاد و وزن هم در رنج استانداردی قرار می‌گیرد. طراحی این گوشی خیلی ساده نیست و به آن زیبایی خاصی داده است. در بخش نمایشگر، این مدل دارای پنل ', N'https://itsalat.ir/uploads/products/silver.jpg', 33000, CAST(N'2024-10-10T13:40:57.2198097' AS DateTime2), N'گوشی', 2)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (9, N'کتاب اسب سیاه اثر اگی اگاس انتشارات آیین محمود', N'در پروژه «اسب تاریک» در دانشکده تحصیلات تکمیلی هاروارد، نویسنده پرفروش و رهبر فکری تحسین شده تاد رز و عصب شناس اوگی اوگاس، زنان و مردانی را مورد مطالعه قرار دادند که به موفقیت چشمگیری دست یافتند، حتی اگر کسی آنها را ندیده باشد. اسب های تاریک مسیر خود را به سوی زندگی پر از شادی و رفاه می گذرانند. با این حال، آنچه بسیار قابل توجه است این است که در درون سفرهای به ظاهر منحصر به فرد آنها، اصول عملی برای دستیابی به موفقیت پنهان است که برای هرکسی کار می کند، مهم نیست که چه کسی هستید یا به چه چیزی امیدو', N'https://files.virgool.io/upload/users/140161/posts/foyd4qgymy50/gqtwnk5dkkqi.jpg', 11000, CAST(N'2024-10-10T13:41:22.5670305' AS DateTime2), N'کتاب', 2)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (10, N'کامپیوتر کامل تک زون مدل Game Monster 14900K', N'کامپیوتر Game Monster 14900K محصولی جدید از برند تک زون ایرانیکا است که بصورت تخصصی جهت کاربری بازی معرفی گردیده است. این محصول به عنوان قدرتمندترین کامپیوتر مخصوص بازی در ایران با هدف دستیابی به حداکثر قدرت پردازش و گرافیک، طراحی و بهینه سازی گردیده و برای ساخت آن از باکیفیت ترین قطعات موجود در بازار استفاده شده؛ به همین علت تا سالها پاسخگوی تمامی نیازها در زمینه کاربری گیم می باشد. قطعات مورد استفاده در این رایانه شامل مادربرد MB ASUS ROG MAXIMUS Z790 HERO بعنوان برترین موجود در بازار، پردازند', N'https://static.digiato.com/digiato/2018/08/Computer01.jpg', 93, CAST(N'2024-10-10T13:42:13.5445865' AS DateTime2), N'کامپیوتر', 2)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (11, N'کیس اسمبل شده کران تک مدل GEN10-i7321S2 VGA4GB', N'کیس اسمبل شده کران تک مدل GEN10-i7321S2 VGA 4GB یک کیس کامپیوتر پرقدرت و با کیفیت که قطعات آن توسط کارشناسان شرکت کرانه رایانه ارزیابی و مونتاژ شده است و تمامی نیازهای روزمره کاربران شامل اینترنت، آفیس، برنامه نویسی، بازی و پخش انواع رسانه را بر طرف می کند. مادربرد این سیستم مدل H410 یا H510 از برند با کیفیت ایسوس یا گیگابایت انتخاب شده که دارای چهار پورت SATA3 می باشد. این رایانه دارای پردازنده CORE i7 GEN 10 INTEL نسل که شامل 8 هسته پردازشی و فرکانس 4.8 گیگاهرتز و حافظه رم 32 گیگ از نوع DDR4 م', N'https://mag.mizbanfa.net/wp-content/uploads/2018/10/instagram-pc-post.png', 40, CAST(N'2024-10-10T13:44:24.4725256' AS DateTime2), N'کامپیوتر', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (12, N'کامپیوتر دسکتاپ فاطر مدل FSG-Eco2', N'سیستم قدیمی نخرید. سیستم فاطر مدل FSG-Eco2از جمله محصولات جدید از سری گیمینگ برند فاطر است که دارای کاربردهای اداری، خانگی و گیمینگ می‌باشد و در ساخت آن از قطعات نو، جدید و بروز استفاده شده است. در این سیستم از کیس فاطر بسیار زیبا و چشم نواز مدل FG-740G بهره برده شده است که دارای 7 جایگاه اسلات توسعه است و به مداربرد نسل جدید و حرفه ای B660 TUF Gaming مجهز شده است. وظیفه تامین انرژی مورد نیاز این سیستم توسط پاور قدرتمند 750 واتی RM750 فاطر تامین میگردد. همچنین این سیستم مجهز به پردازنده نسل جدید', N'https://wintip.ir/wp-content/uploads/2024/07/Computer-monitor.jpg', 500, CAST(N'2024-10-10T13:44:50.8980220' AS DateTime2), N'کامپیوتر', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (13, N'ساعت مچی دیجیتال مردانه اسکمی مدل 1628 BK', N'
این روزها دیگر همه به تاثیر ساعت بر تیپ و استایل آگاهی کامل دارند. کمتر کسی پیدا می شود که تصور کند یک ساعت فقط کالایی برای نشان دادن زمان است.هر چه جلوتر می رویم جای خالی این محصول لوکس و زیبا را روی مچ خیلی از افراد مشاهده می کنیم. زیرا این روزها صنعت مد و فشن رابطه مستقیمی با استفاده از این اکسسوری جذاب دارد.شاید به نظر شما آنقدری که می‌گویند خرید یک ساعت شیک و استفاده از آن اهمیت نداشته باشد', N'https://skmei-ir.com/wp-content/uploads/2021/09/skmei-watch-model-1742-12.jpg', 10, CAST(N'2024-10-10T13:45:29.7444167' AS DateTime2), N'ساعت', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (14, N'گوشی موبایل اپل مدل iPhone 13 CH دو سیم‌ کارت ظرفیت 128 گیگابایت و رم 4 گیگابایت - نات اکتیو', N'   گوشی‌های هوشمند خانواده آیفون 13 در قالب چهار گوشی آیفون 13 پرو مکس، آیفون 13 پرو، آیفون 13 و آیفون 13 مینی معرفی شدند. بدون شک دو مدل پرو و پرو مکس به عنوان پرچمداران این شرکت از مشخصات فنی قدرتمند‌تری بهره برده‌اند. اما در این میان آیفون 13 به همراه مدل مینی با قیمتی مقرون‌به‌صرفه‌تر روانه بازار شده‌اند تا امکان خرید برای کاربران بیشتری امکان‌پذیر باشد. در این مقاله خواهیم دید که آیفون 13 به نسبت نسل قبلی چه مشخصاتی با خود به‌همراه داشته و در بخش‌های مختلف چه عملکردی را از خودش به‌نمایش می‌', N'https://my-tell.com/wp-content/uploads/2023/11/05-4.jpg', 99, CAST(N'2024-10-10T13:46:11.7356845' AS DateTime2), N'گوشی', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (15, N'گوشی موبایل شیائومی مدل Redmi Note 13 Pro 4G دو سیم کارت ظرفیت 256 گیگابایت و رم 8 گیگابایت', N'
بدون هیچ تعریف اضافی باید قبول کنیم که گوشی‌های هوشمند میان‌رده سری Redmi تا به امروز توانسته‌اند عملکرد بسیار خوبی را از خود به‌نمایش بگذارند و شیائومی Redmi Note 13 Pro یکی از این میان‌رده‌های دوست داشتنی است که در برخی از مشخصات فنی در نظر گرفته شده، چیزی کم از یک پرچمدار ندارد. این گوشی به صفحه‌نمایش بسیار با‌کیفیت 6.67 اینچ با رزولوشن 1080×2400 پیکسل از نوع امولد با نمایش 395 پیکسل مجهز شده است.', N'https://icmobile.ir/wp-content/uploads/2023/11/oneplus-12-Black.jpg', 66, CAST(N'2024-10-10T13:46:51.3844490' AS DateTime2), N'گوشی', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (16, N'کتاب چرا تا به حال کسی این ها را به من نگفته بود؟ اثر دکتر جولی اسمیت نشر آذرگون', N'کتاب چرا تا به حال کسی این ها را به من نگفته بود اثر دکتر جولی اسمیت است. استاد جولی اسمیت با بهره گیری از سال ها تجربه و به عنوان یک روانشناس بالینی در کتاب اول خود، خوانندگان را برای به دست آوردن مهارت های لازم جهت تقویت و حفظ سلامت روان خودشان کمک می کند. او در این باره می گوید: افرادی که برای درمان می‌آمدند فکر می‌کردند احساسات دردناک آن‌ها نتیجه‌ی مشکل در مغز یا شخصیت آن‌هاست. باور نداشتند که قدرتی برای تأثیرگذاری بر آن احساسات دردآور دارند. با وجود اینکه برخی افراد نیاز به درمان طولانی‌مدت', N'https://cdn.yjc.ir/files/fa/news/1399/7/7/12665784_857.jpg', 75, CAST(N'2024-10-10T13:47:18.0416473' AS DateTime2), N'کتاب', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (17, N'کتاب اشراف‌زادگان فقیر اثر رضا حیات‌الغیب انتشارات سخنوران', N'«اشراف‌زادگان فقیر» می‌خواهد فریاد بزند فقر یک توهم به قدمت تمدن بشریت است‌‌. توهمی که عامل اصلی تمامی مصیبت‌های روی زمین است‌. زمانی که عموم مردم به توهم و غیر طبیعی بودن «فقر» پی ببرند، آن زمان سرتاسر زمین سرشار از صلح خواهد شد؛ چرا که دیگر دلیلی برای جنگیدن، رقابت و یا آسیب زدن به طبیعت وجود ندارد. این کتاب برای کسانی است که می‌خواهند آنچه که واقعا هستند را زندگی کنند، نه آنچه که جامعه و اطرافیان از آن‌ها انتظار دارند‌. و همچنین یک نقشه راه قدرتمند برای کسانی است که می‌خواهند در سفر زندگی‌شان', N'https://www.gfxdownload.ir/uploads/posts/2023-11/book10.jpg', 60, CAST(N'2024-10-10T13:47:38.7651569' AS DateTime2), N'کتاب', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (18, N'ساعت مچی عقربه‌ای مردانه کاسیو مدل ECB-900DB-1ADR', N'
رنگ صفحه

مشکی

جنس شیشه

رزین

فرم صفحه

گرد

جنس بدنه

استیل

رنگ بدنه

نقره‌ای', N'https://biwatch.ir/wp-content/uploads/2023/03/FDCA13D7-3566-4B1A-8F86-819FA6E29E09.jpeg', 50000, CAST(N'2024-10-10T13:48:25.2107546' AS DateTime2), N'ساعت', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (19, N'ساعت مچی دیجیتال کاسیو مدل W-218H-1AVDF', N'
فرم صفحه

مربع

جنس شیشه

رزین

رنگ بند

مشکی

جنس بند

رزین

ابعاد بدنه

۴۴.۴×۴۳.۲×۱۰.۸ میلی‌متر', N'https://skmei-ir.com/wp-content/uploads/2022/12/skmei-watch-model-1990-10.jpg', 7, CAST(N'2024-10-10T13:49:12.0331435' AS DateTime2), N'ساعت', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (20, N'کتاب انسان در جستجوی معنا اثر ویکتور فرانکل انتشارات جامیفرهنگ برتر', N'نقش لوگوتراپیست وسعت بخشیدن به میدان دید بیمار است، تا آنجایی که معنی و ارزش ها در میدان دید و حیطه خود آگاه بیمار قرار دارد. کسی که چرایی زندگی را یافته است، با هر چگونه ای خواهد ساخت. رنج وقتی معنا یافت، معنایی چون گذشت و فداکاری، دیگر آزار دهنده نیست. لوگوتراپی با در نظر گرفتن گذرایی هستی و وجود انسانی به جای بدبینی و انزوا، انسان را به تلاش و فعالیت فرا می خواند. اگر رنج را شجاعانه بپذیریم تا واپسین دم، زندگی معنی خواهد داشت. پس می توان گفت معنای زندگی امری مشروط نیست، زیرا معنای زندگی می تو', N'https://hamyartarahi.com/upload/product/orginal/hamyartarahi-com-2138.webp', 99, CAST(N'2024-10-10T13:50:07.0245215' AS DateTime2), N'کتاب', 3)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (21, N'd', NULL, NULL, 5222, CAST(N'2024-10-12T23:44:40.4841409' AS DateTime2), N'کامپیوتر', 4)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (22, N'fdf', NULL, NULL, 350000, CAST(N'2024-10-12T23:44:57.1428078' AS DateTime2), N'گوشی', 4)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (23, N'ee', NULL, NULL, 33, CAST(N'2024-10-12T23:45:14.1336779' AS DateTime2), N'کامپیوتر', 4)
INSERT [dbo].[advertisements] ([Id], [Title], [Content], [ImageUrl], [Price], [CreatedDate], [Category], [UserId]) VALUES (24, N'f', NULL, NULL, 33000, CAST(N'2024-10-12T23:45:28.3677997' AS DateTime2), N'گوشی', 4)
SET IDENTITY_INSERT [dbo].[advertisements] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [PasswordHash], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'mohamad', N'tohidi', N'mohammad@gmail.com', N'0910889945', N'$2a$11$DBWy.JCrHlTSS4OowW0eauPGaYJGld78VxWDmcoLjMv4353aRS0li', NULL, NULL, NULL, 0, N'6e629771-0757-46ac-9950-76659d0f3004', N'87bd61a5-738c-4696-9adc-be88b8672aca', 0, 0, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [PasswordHash], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'reza', N'kanjory', N'reza@gmail.com', N'09185665153', N'$2a$11$GsbLJSYLizdcc89EDV33FuLanbXw9hwa1xqeNs3QFBHUcG9vMA3jy', NULL, NULL, NULL, 0, N'3986736d-449b-4e07-8ed4-d7be0576193b', N'ce38ac39-a58a-45c0-b4c2-15b5b8a0490c', 0, 0, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [PasswordHash], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (3, N'Ali', N'kazemi', N'ali@gmail.com', N'09185665153', N'$2a$11$6cDX3CcRw8ayB5Nt56uH7uDqHSwCXJL26gRSF7XyRj2HeTGQJyiCy', NULL, NULL, NULL, 0, N'1ea3f1a5-4978-455a-9279-3546fc5468f6', N'9285446a-72bd-4519-99f6-0625ae005454', 0, 0, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [PasswordHash], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (4, N'sajad', N'nori', N'sajad@gmail.com', N'0939978589', N'$2a$11$utd.nFfj48XAmzus4T63mupFO6vlLVXp/.uAT0wKCHH0xP1/aRlPS', NULL, NULL, NULL, 0, N'21e5e70d-b06a-44a2-be73-13dd2e3dfd9b', N'eeb9a5d2-e46f-495f-8950-b76dea151929', 0, 0, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_advertisements_UserId]    Script Date: 10/13/2024 2:37:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_advertisements_UserId] ON [dbo].[advertisements]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[advertisements]  WITH CHECK ADD  CONSTRAINT [FK_advertisements_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[advertisements] CHECK CONSTRAINT [FK_advertisements_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [DivarDb] SET  READ_WRITE 
GO
