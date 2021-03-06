USE [master]
GO
/****** Object:  Database [Razer]    Script Date: 8/19/2018 2:08:11 PM ******/
CREATE DATABASE [Razer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Razer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Razer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Razer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Razer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Razer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Razer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Razer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Razer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Razer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Razer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Razer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Razer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Razer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Razer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Razer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Razer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Razer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Razer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Razer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Razer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Razer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Razer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Razer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Razer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Razer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Razer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Razer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Razer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Razer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Razer] SET  MULTI_USER 
GO
ALTER DATABASE [Razer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Razer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Razer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Razer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Razer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Razer] SET QUERY_STORE = OFF
GO
USE [Razer]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Razer]
GO
/****** Object:  Table [dbo].[ArtistTBL]    Script Date: 8/19/2018 2:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistTBL](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](4000) NULL,
	[Gender] [int] NULL,
	[CoverPath] [nvarchar](500) NULL,
	[DOB] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistTBL]    Script Date: 8/19/2018 2:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistTBL](
	[PlaylistID] [int] IDENTITY(1,1) NOT NULL,
	[Private] [bit] NULL,
	[Title] [nvarchar](500) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongPlaylistTBL]    Script Date: 8/19/2018 2:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongPlaylistTBL](
	[PlaylistID] [int] NOT NULL,
	[SongID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongTBL]    Script Date: 8/19/2018 2:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongTBL](
	[SongID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistID] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTBL]    Script Date: 8/19/2018 2:08:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTBL](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](200) NULL,
	[Password] [nchar](100) NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[Phone] [nchar](12) NULL,
	[Address] [nvarchar](1000) NULL,
	[Admin] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ArtistTBL] ON 

INSERT [dbo].[ArtistTBL] ([ArtistID], [Title], [Description], [Gender], [CoverPath], [DOB]) VALUES (1, N'Hoàng Yến Chibi', N'1', 0, N'28424898_2016973008317025_1513751757060087978_o.jpg', CAST(N'2018-08-31' AS Date))
SET IDENTITY_INSERT [dbo].[ArtistTBL] OFF
SET IDENTITY_INSERT [dbo].[PlaylistTBL] ON 

INSERT [dbo].[PlaylistTBL] ([PlaylistID], [Private], [Title], [UserID]) VALUES (5, 0, N'Old guds...! :"}', 1)
SET IDENTITY_INSERT [dbo].[PlaylistTBL] OFF
INSERT [dbo].[SongPlaylistTBL] ([PlaylistID], [SongID]) VALUES (7, 9)
SET IDENTITY_INSERT [dbo].[SongTBL] ON 

INSERT [dbo].[SongTBL] ([SongID], [ArtistID], [Title], [FilePath]) VALUES (9, 1, N'Ngây ngô', N'NgayNgo-HoangYenChibi-2540994.mp3')
SET IDENTITY_INSERT [dbo].[SongTBL] OFF
SET IDENTITY_INSERT [dbo].[UserTBL] ON 

INSERT [dbo].[UserTBL] ([UserID], [Email], [Password], [Name], [Gender], [Phone], [Address], [Admin]) VALUES (1, N'crustyrat271@gmail.com                                                                                                                                                                                  ', N'123456                                                                                              ', N'Huy Hoang Phan', 1, N'0975000270  ', N'D302, FPT University', 1)
SET IDENTITY_INSERT [dbo].[UserTBL] OFF
ALTER TABLE [dbo].[UserTBL] ADD  CONSTRAINT [DF_UserTBL_Admin]  DEFAULT ((0)) FOR [Admin]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PlaylistID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SongPlaylistTBL'
GO
USE [master]
GO
ALTER DATABASE [Razer] SET  READ_WRITE 
GO
