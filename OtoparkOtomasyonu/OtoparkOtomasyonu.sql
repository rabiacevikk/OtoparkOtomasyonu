USE [master]
GO
/****** Object:  Database [Arac_Otopark]    Script Date: 22.02.2021 20:47:23 ******/
CREATE DATABASE [Arac_Otopark]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Arac_Otopark', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Arac_Otopark.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Arac_Otopark_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Arac_Otopark_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Arac_Otopark] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Arac_Otopark].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Arac_Otopark] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Arac_Otopark] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Arac_Otopark] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Arac_Otopark] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Arac_Otopark] SET ARITHABORT OFF 
GO
ALTER DATABASE [Arac_Otopark] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Arac_Otopark] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Arac_Otopark] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Arac_Otopark] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Arac_Otopark] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Arac_Otopark] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Arac_Otopark] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Arac_Otopark] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Arac_Otopark] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Arac_Otopark] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Arac_Otopark] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Arac_Otopark] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Arac_Otopark] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Arac_Otopark] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Arac_Otopark] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Arac_Otopark] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Arac_Otopark] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Arac_Otopark] SET RECOVERY FULL 
GO
ALTER DATABASE [Arac_Otopark] SET  MULTI_USER 
GO
ALTER DATABASE [Arac_Otopark] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Arac_Otopark] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Arac_Otopark] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Arac_Otopark] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Arac_Otopark] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Arac_Otopark] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Arac_Otopark', N'ON'
GO
ALTER DATABASE [Arac_Otopark] SET QUERY_STORE = OFF
GO
USE [Arac_Otopark]
GO
/****** Object:  Table [dbo].[arac_otopark_kaydi]    Script Date: 22.02.2021 20:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arac_otopark_kaydi](
	[tc] [nvarchar](50) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[soyad] [nvarchar](50) NOT NULL,
	[telefon] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[plaka] [nvarchar](50) NOT NULL,
	[marka] [nvarchar](50) NOT NULL,
	[seri] [nvarchar](50) NOT NULL,
	[renk] [nvarchar](50) NOT NULL,
	[parkyeri] [nvarchar](50) NOT NULL,
	[tarih] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aracdurumu]    Script Date: 22.02.2021 20:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aracdurumu](
	[parkyeri] [nvarchar](50) NOT NULL,
	[durumu] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[markabilgileri]    Script Date: 22.02.2021 20:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[markabilgileri](
	[marka] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satis]    Script Date: 22.02.2021 20:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parkyeri] [nvarchar](50) NULL,
	[plaka] [nvarchar](50) NULL,
	[gelis_tarihi] [nvarchar](50) NULL,
	[cikis_tarihi] [nvarchar](50) NULL,
	[sure] [decimal](18, 2) NULL,
	[tutar] [decimal](18, 2) NULL,
 CONSTRAINT [PK_satis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seribilgileri]    Script Date: 22.02.2021 20:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seribilgileri](
	[marka] [nvarchar](50) NOT NULL,
	[seri] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[arac_otopark_kaydi] ([tc], [ad], [soyad], [telefon], [email], [plaka], [marka], [seri], [renk], [parkyeri], [tarih]) VALUES (N'11111111111', N'Meryem', N'Çevik', N'5372832904', N'mery_56@hotmail.com', N'34E478', N'Mercedes', N'c180', N'Pembe', N'P-4', N'22.02.2021 20:06:23')
INSERT [dbo].[arac_otopark_kaydi] ([tc], [ad], [soyad], [telefon], [email], [plaka], [marka], [seri], [renk], [parkyeri], [tarih]) VALUES (N'300', N'Murat', N'Günay', N'5448670978', N'm6868@hotmail.com', N'48R900', N'Opel', N'Corsa', N'Gri', N'P-1', N'22.02.2021 18:46:56')
GO
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-1', N'DOLU')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-2', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-3', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-4', N'DOLU')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-5', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-6', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-7', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-8', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-9', N'BOŞ')
INSERT [dbo].[aracdurumu] ([parkyeri], [durumu]) VALUES (N'P-10', N'BOŞ')
GO
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'Opel')
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'Fiat')
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'Renault')
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'Toyota')
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'bmw')
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'Ford')
INSERT [dbo].[markabilgileri] ([marka]) VALUES (N'Mercedes')
GO
SET IDENTITY_INSERT [dbo].[satis] ON 

INSERT [dbo].[satis] ([ID], [parkyeri], [plaka], [gelis_tarihi], [cikis_tarihi], [sure], [tutar]) VALUES (1, N'P-6', N'45U800', N'22.02.2021 18:42:18', N'22.02.2021 18:47:27', CAST(0.08 AS Decimal(18, 2)), CAST(0.06 AS Decimal(18, 2)))
INSERT [dbo].[satis] ([ID], [parkyeri], [plaka], [gelis_tarihi], [cikis_tarihi], [sure], [tutar]) VALUES (2, N'P-10', N'34K600', N'22.02.2021 18:13:12', N'22.02.2021 18:47:40', CAST(0.57 AS Decimal(18, 2)), CAST(0.43 AS Decimal(18, 2)))
INSERT [dbo].[satis] ([ID], [parkyeri], [plaka], [gelis_tarihi], [cikis_tarihi], [sure], [tutar]) VALUES (3, N'P-5', N'34D400', N'22.02.2021 18:50:40', N'22.02.2021 18:51:38', CAST(0.01 AS Decimal(18, 2)), CAST(0.01 AS Decimal(18, 2)))
INSERT [dbo].[satis] ([ID], [parkyeri], [plaka], [gelis_tarihi], [cikis_tarihi], [sure], [tutar]) VALUES (4, N'P-6', N'16Z543', N'22.02.2021 20:07:39', N'22.02.2021 20:15:10', CAST(0.12 AS Decimal(18, 2)), CAST(0.09 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[satis] OFF
GO
INSERT [dbo].[seribilgileri] ([marka], [seri]) VALUES (N'Renault', N'Clio')
INSERT [dbo].[seribilgileri] ([marka], [seri]) VALUES (N'Renault', N'Megan')
INSERT [dbo].[seribilgileri] ([marka], [seri]) VALUES (N'Renault', N'Symbol')
INSERT [dbo].[seribilgileri] ([marka], [seri]) VALUES (N'Opel', N'Astra')
INSERT [dbo].[seribilgileri] ([marka], [seri]) VALUES (N'Opel', N'Corsa')
INSERT [dbo].[seribilgileri] ([marka], [seri]) VALUES (N'Mercedes', N'c180')
GO
USE [master]
GO
ALTER DATABASE [Arac_Otopark] SET  READ_WRITE 
GO
