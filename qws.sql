USE [master]
GO
/****** Object:  Database [ХранительПРО]    Script Date: 17.04.2025 14:41:39 ******/
CREATE DATABASE [ХранительПРО]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ХранительПРО_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ХранительПРО] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECOVERY FULL 
GO
ALTER DATABASE [ХранительПРО] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ХранительПРО] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ХранительПРО]
GO
/****** Object:  Table [dbo].[заявка]    Script Date: 17.04.2025 14:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[заявка](
	[id_заявки] [int] IDENTITY(1,1) NOT NULL,
	[id_пользователя] [int] NOT NULL,
	[тип_заявки] [nvarchar](50) NOT NULL,
	[id_статуса] [int] NOT NULL,
	[причина] [nvarchar](50) NULL,
	[дата_начала_срока_действия] [date] NOT NULL,
	[дата_окончания_окончания_срока_действия] [date] NOT NULL,
	[id_группы] [int] NULL,
	[id_подразделения] [int] NULL,
	[имя] [nvarchar](50) NULL,
	[фамилия] [nvarchar](50) NULL,
	[отчество] [nvarchar](50) NULL,
	[телефон] [nvarchar](50) NULL,
	[почта] [nvarchar](50) NULL,
	[организация] [nvarchar](50) NULL,
	[примечание] [nvarchar](50) NULL,
	[дата_рождения] [date] NULL,
	[серия_пас] [nvarchar](4) NULL,
	[номер_пас] [nvarchar](6) NULL,
	[ФИО_прин] [nvarchar](50) NULL,
	[подразделение] [nvarchar](50) NULL,
	[цель] [nvarchar](50) NULL,
 CONSTRAINT [PK_заявка] PRIMARY KEY CLUSTERED 
(
	[id_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[подразделение]    Script Date: 17.04.2025 14:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[подразделение](
	[Id_подразделения] [int] IDENTITY(1,1) NOT NULL,
	[инфо] [nvarchar](50) NULL,
 CONSTRAINT [PK_подразделение] PRIMARY KEY CLUSTERED 
(
	[Id_подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[пользователи]    Script Date: 17.04.2025 14:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[пользователи](
	[id_пользователя] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[телефон] [varchar](50) NOT NULL,
	[почта] [nvarchar](50) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[серия_паспорта] [nvarchar](50) NOT NULL,
	[номер_паспорта] [nvarchar](50) NOT NULL,
	[логин] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[примечание] [nvarchar](50) NULL,
	[организация] [nvarchar](50) NULL,
	[фотография] [varbinary](max) NULL,
 CONSTRAINT [PK_пользователи] PRIMARY KEY CLUSTERED 
(
	[id_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[посещение]    Script Date: 17.04.2025 14:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[посещение](
	[id_группы] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [nvarchar](50) NULL,
	[имя] [nvarchar](50) NULL,
	[отчество] [nvarchar](50) NULL,
	[телефон] [nvarchar](50) NULL,
	[почта] [nvarchar](50) NULL,
	[дата_рождения] [date] NULL,
	[серия] [nvarchar](50) NULL,
	[номер] [nvarchar](50) NULL,
	[логин] [nvarchar](50) NULL,
	[пароль] [nvarchar](50) NULL,
	[группа] [nvarchar](100) NULL,
	[назначение] [nvarchar](50) NULL,
	[подразделение] [nvarchar](50) NULL,
	[id_сотрудника] [int] NULL,
	[срок_действия_заявки] [date] NULL,
	[по] [date] NULL,
	[цель_посещения] [nvarchar](50) NULL,
 CONSTRAINT [PK_посещение_1] PRIMARY KEY CLUSTERED 
(
	[id_группы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[сотрудник]    Script Date: 17.04.2025 14:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[сотрудник](
	[Код_сотрудника] [int] NULL,
	[фамилия] [nvarchar](50) NOT NULL,
	[имя] [nvarchar](50) NOT NULL,
	[отчество] [nvarchar](50) NOT NULL,
	[Подразделение] [nvarchar](50) NULL,
	[отдел] [nvarchar](50) NULL,
	[ID_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[id_подразделения] [int] NULL,
 CONSTRAINT [PK_сотрудник] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[статус]    Script Date: 17.04.2025 14:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[статус](
	[id_статуса] [int] IDENTITY(1,1) NOT NULL,
	[Состояние] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_статус] PRIMARY KEY CLUSTERED 
(
	[id_статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[заявка] ADD  CONSTRAINT [DF_заявка_id_статуса]  DEFAULT ((3)) FOR [id_статуса]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_подразделение] FOREIGN KEY([id_подразделения])
REFERENCES [dbo].[подразделение] ([Id_подразделения])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_подразделение]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_пользователи] FOREIGN KEY([id_пользователя])
REFERENCES [dbo].[пользователи] ([id_пользователя])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_пользователи]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_посещение] FOREIGN KEY([id_группы])
REFERENCES [dbo].[посещение] ([id_группы])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_посещение]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_статус] FOREIGN KEY([id_статуса])
REFERENCES [dbo].[статус] ([id_статуса])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_статус]
GO
ALTER TABLE [dbo].[сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_сотрудник_подразделение] FOREIGN KEY([id_подразделения])
REFERENCES [dbo].[подразделение] ([Id_подразделения])
GO
ALTER TABLE [dbo].[сотрудник] CHECK CONSTRAINT [FK_сотрудник_подразделение]
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО] SET  READ_WRITE 
GO
