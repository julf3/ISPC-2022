USE [master]
GO
/****** Object:  Database [ISPC - FS 2022]    Script Date: 12/12/2022 22:39:58 ******/
CREATE DATABASE [ISPC - FS 2022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ISPC - FS 2022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ISPC - FS 2022.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ISPC - FS 2022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ISPC - FS 2022_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ISPC - FS 2022] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ISPC - FS 2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ISPC - FS 2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ISPC - FS 2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ISPC - FS 2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ISPC - FS 2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ISPC - FS 2022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET RECOVERY FULL 
GO
ALTER DATABASE [ISPC - FS 2022] SET  MULTI_USER 
GO
ALTER DATABASE [ISPC - FS 2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ISPC - FS 2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ISPC - FS 2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ISPC - FS 2022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ISPC - FS 2022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ISPC - FS 2022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ISPC - FS 2022', N'ON'
GO
ALTER DATABASE [ISPC - FS 2022] SET QUERY_STORE = OFF
GO
USE [ISPC - FS 2022]
GO
/****** Object:  Table [dbo].[Datos Jugadores]    Script Date: 12/12/2022 22:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos Jugadores](
	[Num Camiseta] [int] NOT NULL,
	[Img] [nvarchar](max) NULL,
	[Nombre y Apellido] [nvarchar](255) NULL,
	[Posicion] [nvarchar](255) NULL,
	[Fecha de Nacimiento] [date] NULL,
	[Estatura] [float] NULL,
	[Pie] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posiciones]    Script Date: 12/12/2022 22:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posiciones](
	[IdPos] [int] NOT NULL,
	[Posicion] [nchar](25) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (23, N'https://w0.peakpx.com/wallpaper/311/125/HD-wallpaper-emiliano-martinez-soccer-copa-america-2021-argentina-adidas-argentine-football.jpg
', N'Emiliano Martinez', N'Arquero', CAST(N'1992-09-02' AS Date), 1.95, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (12, N'https://media.tycsports.com/files/2022/11/02/500760/geronimo-rulli-seleccion-argentina_862x485.webp', N'Geronimo Rulli', N'Arquero', CAST(N'1992-05-20' AS Date), 1.89, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (1, N'https://cdnmd.lavoz.com.ar/sites/default/files/styles/width_1072/public/galer_a_multimedia/1_armani_1560463673.jpg
', N'Franco Armani', N'Arquero', CAST(N'1986-10-16' AS Date), 1.89, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (13, N'https://media.tycsports.com/files/2021/07/04/302887/cristian-romero_w416.jpg', N'Cristian Romero', N'Defensor', CAST(N'1998-04-27' AS Date), 1.85, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (2, N'ttps://media.tycsports.com/files/2021/06/14/294125/lisandro-martinez_416x555.jpg', N'Lisandro Martinez', N'Defensor', CAST(N'1998-01-18' AS Date), 1.75, N'izquierdo')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (26, N'https://static.cdn.cadena3.com/admin/playerswf/fotos/ARCHI_436876.jpg', N'Juan Foyth', N'Defensor', CAST(N'1998-01-12' AS Date), 1.88, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (13, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBmI8eKrDDjcVP0myItaljecj0l6h2BdpshUwXOOZEgEm6lcvI4PrUMynvPNV8fghM6Ts&usqp=CAUhttps://argentinadorada.com.ar/img/perfiles/iYredk5j95hpxvYbsMpR6WJmpP9sbK8yeHO.jpg', N'Marcos Acuña', N'Defensor', CAST(N'1991-10-28' AS Date), 1.72, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (6, N'https://www.ceroacero.es/img/jogadores/42/751942_ori__20210214172921_german_pezzella.jpg', N'Germán Pezzella ', N'Defensor', CAST(N'1991-06-27' AS Date), 1.87, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (19, N'https://i.pinimg.com/736x/e1/fa/06/e1fa06b35d6e2046a65551795b9404a9.jpg', N'Nicolás Otamendi ', N'Defensor', CAST(N'1988-02-12' AS Date), 1.83, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (3, N'http://deportebox.com/wp-content/uploads/2020/04/tagliafico3_61771605_2167817716843296_3134841155180385518_n.jpg', N'Nicolás Tagliafico ', N'Defensor', CAST(N'1992-08-31' AS Date), 1.72, N'izquierdo')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (21, N'http://lmdiario.com.ar/download/multimedia.normal.be6c536aad8e4c41.4e616875656c204d6f6c696e6120436f70615f6e6f726d616c2e6a7067.jpg', N'Nahuel Molina ', N'Defensor', CAST(N'1998-04-06' AS Date), 1.75, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (4, N'https://www.ceroacero.es/img/jogadores/46/807646_ori__20210731231619_gonzalo_montiel.jpg', N'Gonzalo Montiel ', N'Defensor', CAST(N'1997-01-01' AS Date), 1.76, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (18, N'https://es.coachesvoice.com/wp-content/uploads/2022/06/guido_mobile.jpg', N'Guido Rodríguez ', N'Mediocampista', CAST(N'1994-04-12' AS Date), 1.85, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (5, N'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSCA-5gSP1xYXq32kYFdB9NmnOhDagbpexyqHh47WMaMyQ6FvBNojnqgxItzXlgt1O9', N'Leandro Paredes ', N'Mediocampista', CAST(N'1994-06-29' AS Date), 1.8, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (7, N'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcRXx9d4K1EH8UiB-CW4Q0s_VRkh3GXwU5jWW9GcKLoA4FQ5yEyCuLuhNvk4MV-thF1B', N'Rodrigo de Paul ', N'Mediocampista', CAST(N'1994-05-24' AS Date), 1.8, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (14, N'https://www.elgrafico.com.ar/media/cache/pub_news_details_large/media/i/39/5e/395e0a356d37701413a4d32a7a4dccab7b61e97e.jpeg', N'Enzo Fernández ', N'Mediocampista', CAST(N'2001-01-17' AS Date), 1.78, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (15, N'https://bolavip.com/export/sites/bolavip/img/2022/01/19/gettyimages-1273686460.jpg_890399288.jpg', N'Alexis Mac Allister ', N'Mediocampista', CAST(N'1998-12-24' AS Date), 1.74, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (8, N'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcTQp65xiJjPQuFsx-OOi_e8qQCfbtpPxcCbU5h7Uw6YnZDPBWpkUiv0SeTf2YVRoWsL', N'Exequiel Palacios', N'Mediocampista', CAST(N'1998-10-05' AS Date), 1.77, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (17, N'https://tntsports.com.ar/__export/1653872455196/sites/tntsports/img/2022/02/18/papu-gomez-en-la-selecciona-argentina.png_480736389.png', N'Alejandro Gómez ', N'Mediocampista', CAST(N'1988-02-15' AS Date), 1.67, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (16, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6PehDVDA6ypxbX33rzzkP-64rnQR4MfF83w&usqp=CAU', N'Thiago Almada', N'Mediocampista', CAST(N'2001-04-26' AS Date), 1.71, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (11, N'https://i.pinimg.com/736x/e6/fc/99/e6fc992f30d9560858989b4449ceb5f4.jpg', N'Ángel Di María ', N'Delantero', CAST(N'1988-02-14' AS Date), 1.8, N'izquierdo')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (10, N'https://www.elclasicodeportes.com.ar/wp-content/uploads/2021/05/messi.jpg', N'Lionel Messi ', N'Delantero', CAST(N'1987-06-24' AS Date), 1.7, N'izquierdo')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (17, N'https://www.elgrafico.com.ar/media/cache/pub_news_details_large/media/i/94/98/9498fa9f6c8b624c88acdf7c474aee1ae9fcab17.jpeg', N'Angel Correa ', N'Delantero', CAST(N'1995-03-09' AS Date), 1.74, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (22, N'https://i.pinimg.com/originals/f2/98/f3/f298f38299078efe3f2750ad1bce3594.jpg', N'Lautaro Martínez ', N'Delantero', CAST(N'1997-08-22' AS Date), 1.74, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (9, N'https://i.pinimg.com/originals/51/1f/79/511f79a51281fbb2ffa86ed0851d1fab.jpg', N'Julián Álvarez ', N'Delantero', CAST(N'2000-01-31' AS Date), 1.7, N'derecho')
INSERT [dbo].[Datos Jugadores] ([Num Camiseta], [Img], [Nombre y Apellido], [Posicion], [Fecha de Nacimiento], [Estatura], [Pie]) VALUES (21, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYvhuJ7L6plDOvIE6liNwMEG4mdGL78obDpLLaNSrhziac7ERvw9JlJ1FKIA_n9JMStD8&usqp=CAU', N'Paulo Dybala', N'Delantero', CAST(N'1993-11-15' AS Date), 1.77, N'izquierda')
GO
INSERT [dbo].[Posiciones] ([IdPos], [Posicion]) VALUES (1, N'Arquero                  ')
INSERT [dbo].[Posiciones] ([IdPos], [Posicion]) VALUES (2, N'Defensor                 ')
INSERT [dbo].[Posiciones] ([IdPos], [Posicion]) VALUES (3, N'Mediocampista            ')
INSERT [dbo].[Posiciones] ([IdPos], [Posicion]) VALUES (4, N'Delantero                ')
GO
USE [master]
GO
ALTER DATABASE [ISPC - FS 2022] SET  READ_WRITE 
GO
