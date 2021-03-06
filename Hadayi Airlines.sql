USE [master]
GO
/****** Object:  Database [Hadayi_Airlines]    Script Date: 08/02/2019 7:01:22 a. m. ******/
CREATE DATABASE [Hadayi_Airlines]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hadayi_Airlines', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hadayi_Airlines.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hadayi_Airlines_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hadayi_Airlines_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hadayi_Airlines] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hadayi_Airlines].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hadayi_Airlines] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hadayi_Airlines] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hadayi_Airlines] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hadayi_Airlines] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hadayi_Airlines] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET RECOVERY FULL 
GO
ALTER DATABASE [Hadayi_Airlines] SET  MULTI_USER 
GO
ALTER DATABASE [Hadayi_Airlines] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hadayi_Airlines] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hadayi_Airlines] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hadayi_Airlines] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hadayi_Airlines] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hadayi_Airlines', N'ON'
GO
ALTER DATABASE [Hadayi_Airlines] SET QUERY_STORE = OFF
GO
USE [Hadayi_Airlines]
GO
/****** Object:  Table [dbo].[Avion]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avion](
	[matricula] [nchar](7) NOT NULL,
	[capacidad] [int] NULL,
	[modelo] [nchar](20) NOT NULL,
 CONSTRAINT [Avion_matricula_pk] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[cedula_c] [nchar](15) NOT NULL,
	[nombre] [nchar](15) NOT NULL,
	[apellido] [nchar](15) NULL,
	[tipo] [nchar](15) NOT NULL,
 CONSTRAINT [Cliente_cedula_c_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_c] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteVuelo]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteVuelo](
	[cedula_c] [nchar](15) NOT NULL,
	[vuelo_id] [nchar](7) NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [ClienteVuelo_codigo_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_c] ASC,
	[vuelo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lugar]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lugar](
	[lugar_id] [nchar](7) NOT NULL,
	[aeropuerto] [nchar](100) NOT NULL,
	[lugar] [nchar](20) NOT NULL,
	[pais] [nchar](15) NOT NULL,
 CONSTRAINT [Lugar_lugar_id_pk] PRIMARY KEY CLUSTERED 
(
	[lugar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[pago_id] [nchar](7) NOT NULL,
	[monto] [float] NOT NULL,
	[metodo] [nchar](35) NOT NULL,
	[cedula_c] [nchar](15) NOT NULL,
 CONSTRAINT [Pago_pago_id_pk] PRIMARY KEY CLUSTERED 
(
	[pago_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[cedula_p] [nchar](15) NOT NULL,
	[vuelo_id] [nchar](7) NOT NULL,
	[nombre] [nchar](15) NOT NULL,
	[apellido] [nchar](15) NULL,
	[salario] [float] NOT NULL,
	[cargo] [nchar](35) NOT NULL,
 CONSTRAINT [Personal_cedula_p_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_p] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[reserva_id] [nchar](7) NOT NULL,
	[clase] [nchar](15) NULL,
	[numero_puesto] [int] NULL,
	[cedula_c] [nchar](15) NOT NULL,
	[cod_familia] [nchar](20) NULL,
 CONSTRAINT [Reserva_reserva_id_pk] PRIMARY KEY CLUSTERED 
(
	[reserva_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 08/02/2019 7:01:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[vuelo_id] [nchar](7) NOT NULL,
	[matricula] [nchar](7) NOT NULL,
	[precio_económica] [decimal](10, 2) NOT NULL,
	[precio_ejecutivo] [decimal](10, 2) NOT NULL,
	[origen] [nchar](7) NULL,
	[destino] [nchar](7) NULL,
	[duración] [time](7) NULL,
 CONSTRAINT [Vuelo_vuelo_id_pk] PRIMARY KEY CLUSTERED 
(
	[vuelo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0010A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0011A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0012A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0013A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0014A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0015A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0016A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0017A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0018A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0019A  ', 94, N'Embraer 190AR       ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0020A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0021A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0022A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0023A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0024A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0025A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0026A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0027A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0028A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0029A  ', 160, N'Boeing 737-800      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0030A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0031A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0032A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0033A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0034A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0035A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0036A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0037A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0038A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0039A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0040A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0041A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0042A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0043A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Avion] ([matricula], [capacidad], [modelo]) VALUES (N'0044A  ', 124, N'Boeing 737-700      ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'10-254-564     ', N'Lola           ', N'Thompson       ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'10-34-869      ', N'Rafael         ', N'Thompson       ', N'niño           ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'2-432-213      ', N'Harry          ', N'Sparks         ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'2-772-932      ', N'Betty          ', N'Alain          ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'3-431-1998     ', N'Matteo         ', N'Navarro        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'4-222-565      ', N'Homero         ', N'Rosales        ', N'niño           ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'4-876-555      ', N'Sofía          ', N'Peralta        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'6-634-7854     ', N'Teodomiro      ', N'Linares        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'6-841-4647     ', N'Roberto        ', N'Linares        ', N'niño           ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'7-251-3567     ', N'Agustín        ', N'Meuner         ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'7-334-327      ', N'Ellen          ', N'Aguilar        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'7-871-6547     ', N'Selena         ', N'Vásquez        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'8-621-1634     ', N'Patricia       ', N'de Meuner      ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'8-642-9345     ', N'Iosef          ', N'Casillas       ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'8-672-995      ', N'Cheryl         ', N'Rosales        ', N'niño           ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'8-948-9678     ', N'Anmiel         ', N'Montoya        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'8-999-99       ', N'Manuel         ', N'Rosales        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'9-321-6785     ', N'Joann          ', N'Ballesteros    ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'9-34-567       ', N'Aileen         ', N'Flores         ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'9-524-9236     ', N'Jeancarlos     ', N'Salcedo        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'PE-21-547      ', N'Aubert         ', N'García         ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'PE-32-798      ', N'Astra          ', N'Meraz          ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'PE-35-231      ', N'William        ', N'Branson        ', N'adulto         ')
GO
INSERT [dbo].[Cliente] ([cedula_c], [nombre], [apellido], [tipo]) VALUES (N'PE-76-893      ', N'Zenaida        ', N'Arce           ', N'adulto         ')
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'10-254-564     ', N'BCCi1  ', CAST(N'2019-07-01' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'10-34-869      ', N'BCCi1  ', CAST(N'2019-07-01' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'2-432-213      ', N'BTBTi1 ', CAST(N'2019-07-27' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'2-772-932      ', N'BCCi1  ', CAST(N'2019-07-01' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'3-431-1998     ', N'SJCRiv1', CAST(N'2019-07-14' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'4-222-565      ', N'BTBTi1 ', CAST(N'2019-07-23' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'4-222-565      ', N'BTBTiv1', CAST(N'2019-07-27' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'4-876-555      ', N'BTBTi1 ', CAST(N'2019-07-23' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'6-634-7854     ', N'SJCRi1 ', CAST(N'2019-07-08' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'6-634-7854     ', N'SJCRiv1', CAST(N'2019-07-14' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'6-841-4647     ', N'MCi2   ', CAST(N'2019-07-10' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'6-841-4647     ', N'MCiv2  ', CAST(N'2019-07-16' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'7-251-3567     ', N'SJCRi1 ', CAST(N'2019-07-08' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'7-334-327      ', N'BCCi1  ', CAST(N'2019-07-01' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'7-334-327      ', N'BCCiv1 ', CAST(N'2019-07-03' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'7-871-6547     ', N'BCCi1  ', CAST(N'2019-07-01' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'8-621-1634     ', N'MCi1   ', CAST(N'2019-07-12' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'8-621-1634     ', N'MCiv1  ', CAST(N'2019-07-18' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'8-642-9345     ', N'ICPiv1 ', CAST(N'2019-07-04' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'8-672-995      ', N'SJCRi2 ', CAST(N'2019-07-17' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'8-948-9678     ', N'SJCRi1 ', CAST(N'2019-07-08' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'8-999-99       ', N'BTBTi1 ', CAST(N'2019-07-23' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'9-321-6785     ', N'ICPi1  ', CAST(N'2019-07-02' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'9-34-567       ', N'MCi1   ', CAST(N'2019-07-12' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'9-524-9236     ', N'SJCRi2 ', CAST(N'2019-07-17' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'PE-21-547      ', N'MCi2   ', CAST(N'2019-07-10' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'PE-21-547      ', N'MCiv2  ', CAST(N'2019-07-16' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'PE-32-798      ', N'SJCRi1 ', CAST(N'2019-07-08' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'PE-35-231      ', N'ICPi1  ', CAST(N'2019-07-02' AS Date))
GO
INSERT [dbo].[ClienteVuelo] ([cedula_c], [vuelo_id], [fecha]) VALUES (N'PE-76-893      ', N'BCCi1  ', CAST(N'2019-07-01' AS Date))
GO
INSERT [dbo].[Lugar] ([lugar_id], [aeropuerto], [lugar], [pais]) VALUES (N'BCC    ', N'Aeropuerto Internacional Enrique Malek                                                              ', N'David               ', N'Panamá         ')
GO
INSERT [dbo].[Lugar] ([lugar_id], [aeropuerto], [lugar], [pais]) VALUES (N'BTBT   ', N'Aeropuerto Internacional José Ezequiel Hall                                                         ', N'Bocas del Toro      ', N'Panamá         ')
GO
INSERT [dbo].[Lugar] ([lugar_id], [aeropuerto], [lugar], [pais]) VALUES (N'ICP    ', N'Aeropuerto de Coiba                                                                                 ', N'Isla Coiba          ', N'Panamá         ')
GO
INSERT [dbo].[Lugar] ([lugar_id], [aeropuerto], [lugar], [pais]) VALUES (N'MC     ', N'Aeropuerto Olaya Herrera                                                                            ', N'Medellín            ', N'Colombia       ')
GO
INSERT [dbo].[Lugar] ([lugar_id], [aeropuerto], [lugar], [pais]) VALUES (N'PP     ', N'Aeropuerto Internacional de Tocumen                                                                 ', N'Panamá              ', N'Panamá         ')
GO
INSERT [dbo].[Lugar] ([lugar_id], [aeropuerto], [lugar], [pais]) VALUES (N'SJCR   ', N'Aeropuerto Internacional Juan Santamaría                                                            ', N'Alajuela            ', N'Costa Rica     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'ea001  ', 940, N'Efectivo                           ', N'8-999-99       ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'ea002  ', 1680, N'Tarjeta de crédito                 ', N'7-251-3567     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'ea003  ', 2500, N'Transferencia bancaria             ', N'6-634-7854     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'ea004  ', 1300, N'Efectivo                           ', N'PE-21-547      ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'ea005  ', 820, N'Tarjeta de crédito                 ', N'3-431-1998     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'ea007  ', 260, N'Tarjeta de crédito                 ', N'9-321-6785     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca001 ', 150, N'Transferencia bancaria             ', N'2-772-932      ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca002 ', 300, N'Tarjeta de crédito                 ', N'10-254-564     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca003 ', 450, N'Efectivo                           ', N'7-334-327      ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca004 ', 300, N'Efectivo                           ', N'7-871-6547     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca005 ', 130, N'Efectivo                           ', N'PE-35-231      ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca007 ', 250, N'Tarjeta de crédito                 ', N'8-642-9345     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca008 ', 380, N'Efectivo                           ', N'8-948-9678     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca009 ', 200, N'Efectivo                           ', N'9-34-567       ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca010 ', 490, N'Transferencia bancaria             ', N'9-524-9236     ')
GO
INSERT [dbo].[Pago] ([pago_id], [monto], [metodo], [cedula_c]) VALUES (N'eca011 ', 150, N'Efectivo                           ', N'2-432-213      ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'10-111-176     ', N'SJCRiv1', N'Harold         ', N'Rosario        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'10-197-911     ', N'MCiv2  ', N'Angel          ', N'Rivera         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'10-381-745     ', N'MCi1   ', N'Clara          ', N'Fuentes        ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'10-645-31      ', N'SJCRi1 ', N'José           ', N'Blanco         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'10-665-11      ', N'SJCRi1 ', N'Elena          ', N'Pujol          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'1-156-923      ', N'ICPiv1 ', N'Antonio        ', N'Guerrero       ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'1-746-441      ', N'SJCRi1 ', N'Marta          ', N'Marín          ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'1-776-991      ', N'MCiv2  ', N'Leo            ', N'Guevara        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-132-634      ', N'MCi1   ', N'John           ', N'Serrano        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-231-1358     ', N'MCiv1  ', N'Iván           ', N'Marchoski      ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-326-1746     ', N'SJCRiv1', N'María          ', N'Cedeño         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-328-754      ', N'SJCRiv2', N'Eugenio        ', N'Díaz           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-356-451      ', N'MCiv2  ', N'Juan           ', N'Sanchéz        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-437-21       ', N'ICPi1  ', N'Alexis         ', N'Fernández      ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-476-954      ', N'SJCRiv2', N'Valerie        ', N'Tuñon          ', 2000, N'Jefa de Oficina                    ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-567-276      ', N'BTBTi1 ', N'Nora           ', N'Carrasco       ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-583-763      ', N'ICPi1  ', N'Jimena         ', N'Torres         ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-776-431      ', N'SJCRi1 ', N'Aitana         ', N'Morales        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-789-443      ', N'BTBTiv1', N'Iris           ', N'Pons           ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-835-231      ', N'BTBTiv1', N'Cesár          ', N'Moreno         ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-876-78       ', N'SJCRiv2', N'Carlos         ', N'Navarro        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-928-1762     ', N'MCiv1  ', N'Jennyfer       ', N'Alonso         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-945-411      ', N'MCiv2  ', N'Luna           ', N'Benitez        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'2-982-1768     ', N'MCiv1  ', N'Kevin          ', N'Batista        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-126-1589     ', N'SJCRi3 ', N'Kevin          ', N'Peñalba        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-254-297      ', N'BCCiv1 ', N'Fernando       ', N'Peña           ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-321-11       ', N'SJCRi2 ', N'Ariadna        ', N'Peréz          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-347-196      ', N'ICPi1  ', N'Diana          ', N'Caballero      ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-456-556      ', N'ICPi1  ', N'Noelia         ', N'Castro         ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-476-1989     ', N'SJCRi3 ', N'Aaron          ', N'Paredes        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-516-1762     ', N'SJCRi3 ', N'Evelyn         ', N'Cruz           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-551-671      ', N'SJCRi2 ', N'Hugo           ', N'Gallardo       ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-573-4419     ', N'MCi2   ', N'Eduardo        ', N'Mora           ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-673-5894     ', N'MCiv1  ', N'Ana            ', N'Cedeño         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'3-993-665      ', N'MCi1   ', N'Inés           ', N'Ruiz           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-214-4473     ', N'MCi3   ', N'Carin          ', N'Macrobio       ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-321-934      ', N'MCi1   ', N'Salma          ', N'Delgado        ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-332-945      ', N'BTBTiv1', N'Mateo          ', N'Herrera        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-346-176      ', N'SJCRiv1', N'Heraldo        ', N'Fonséca        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-664-2234     ', N'MCi3   ', N'Rosa           ', N'Alain          ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-771-4411     ', N'MCi3   ', N'Jimena         ', N'Medina         ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-776-4578     ', N'BTBTiv1', N'Joel           ', N'Navarro        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-833-655      ', N'MCi1   ', N'Andrés         ', N'Calvo          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-875-221      ', N'BTBTiv1', N'Pedro          ', N'Serrano        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'4-876-235      ', N'BCCiv1 ', N'Noriel         ', N'Cerrud         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-235-778      ', N'MCi2   ', N'Sara           ', N'Carrasco       ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-337-7869     ', N'MCi2   ', N'Francisco      ', N'Hidalgo        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-656-182      ', N'SJCRiv1', N'Stephany       ', N'Flores         ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-656-823      ', N'ICPiv1 ', N'Óscar          ', N'Molina         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-723-447      ', N'MCi2   ', N'Nil            ', N'Garcia         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-733-773      ', N'MCiv2  ', N'Carlos         ', N'Chacon         ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-777-442      ', N'MCi2   ', N'Lara           ', N'Rosales        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-777-5119     ', N'MCi2   ', N'Ariadna        ', N'Riera          ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-781-342      ', N'ICPiv1 ', N'Laia           ', N'Jimenez        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'5-884-331      ', N'MCiv2  ', N'Marc           ', N'Parra          ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-223-1158     ', N'MCiv1  ', N'Daiel          ', N'Wolf           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-294-411      ', N'MCiv2  ', N'Valeria        ', N'Fuentes        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-324-758      ', N'BTBTi1 ', N'Naia           ', N'Rubio          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-336-211      ', N'SJCRi1 ', N'Carolina       ', N'Alonso         ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-356-978      ', N'SJCRiv2', N'Lourdes        ', N'Guevara        ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-421-1279     ', N'SJCRi3 ', N'Kenia          ', N'Muñoz          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'6-823-115      ', N'MCi2   ', N'Ariel          ', N'Calvo          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-113-224      ', N'BTBTi1 ', N'Salma          ', N'García         ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-213-334      ', N'SJCRiv2', N'Sara           ', N'Ponce          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-221-884      ', N'SJCRiv2', N'Yaneth         ', N'Martínez       ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-331-111      ', N'SJCRi2 ', N'Ariadna        ', N'Peréz          ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-347-55       ', N'SJCRi2 ', N'Rocío          ', N'Garrido        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-383-1297     ', N'MCiv1  ', N'Camila         ', N'Castro         ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-432-199      ', N'SJCRiv2', N'Ramiro         ', N'Oses           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-443-7781     ', N'MCi1   ', N'Abril          ', N'Caballero      ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-600-233      ', N'MCi3   ', N'Raúl           ', N'Moya           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-723-1287     ', N'MCiv1  ', N'Dominique      ', N'González       ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-731-1278     ', N'SJCRi3 ', N'Ronitza        ', N'Peralta        ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-894-231      ', N'MCiv2  ', N'Rocío          ', N'Cabrera        ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'7-921-995      ', N'MCi1   ', N'Adrián         ', N'Moya           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-200-108      ', N'MCi3   ', N'Martina        ', N'Cruz           ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-354-2372     ', N'SJCRi3 ', N'Lissette       ', N'González       ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-437-2110     ', N'ICPi1  ', N'Alma           ', N'Blanco         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-443-9922     ', N'SJCRi2 ', N'Rubén          ', N'Mora           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-452-6342     ', N'MCi1   ', N'Érick          ', N'Segura         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-466-1298     ', N'SJCRi3 ', N'Norelys        ', N'Rodríguez      ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-553-116      ', N'MCi2   ', N'Roberto        ', N'Peréz          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-600-340      ', N'MCi3   ', N'Berta          ', N'Romero         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-834-173      ', N'SJCRiv1', N'Amarilis       ', N'Cerrud         ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-851-2235     ', N'BCCiv1 ', N'Martín         ', N'Cano           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-874-2245     ', N'SJCRiv1', N'Angel          ', N'Pimentel       ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-886-9452     ', N'SJCRi2 ', N'Julia          ', N'Moreno         ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-923-4065     ', N'MCi3   ', N'Emanuel        ', N'Carrera        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-932-434      ', N'MCiv1  ', N'Liz            ', N'Pimentel       ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-934-124      ', N'BCCi1  ', N'Eduardo        ', N'Medina         ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-936-1750     ', N'BCCi1  ', N'Yisel          ', N'Oses           ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-938-1528     ', N'BCCi1  ', N'Daniella       ', N'Ramos          ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-938-509      ', N'BCCiv1 ', N'Nadia          ', N'Sanchez        ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-940-2156     ', N'BCCiv1 ', N'Leyre          ', N'Parra          ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-943-6329     ', N'BCCi1  ', N'Alejandro      ', N'Peralta        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'8-945-67       ', N'BCCi1  ', N'Manuel         ', N'Rosales        ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'9-141-166      ', N'SJCRiv1', N'Augusto        ', N'Jaén           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'9-267-045      ', N'SJCRi2 ', N'Óliver         ', N'Soto           ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'9-454-1567     ', N'BTBTi1 ', N'Aitor          ', N'Leon           ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'9-621-056      ', N'SJCRi1 ', N'Ignacio        ', N'Ramirez        ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'9-689-5        ', N'SJCRi1 ', N'Fernando       ', N'Santiago       ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'9-812-238      ', N'BTBTi1 ', N'Aya            ', N'Soler          ', 5000, N'Piloto (Capitán)                   ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'PE-10-485      ', N'ICPiv1 ', N'Alonso         ', N'Calvo          ', 4000, N'Piloto (Primer Oficial)            ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'PE-14-185      ', N'ICPiv1 ', N'Esther         ', N'Nuñez          ', 2000, N'Jefa de Cabina                     ')
GO
INSERT [dbo].[Personal] ([cedula_p], [vuelo_id], [nombre], [apellido], [salario], [cargo]) VALUES (N'PE-18-1324     ', N'MCi3   ', N'Linsi          ', N'Lee            ', 900, N'Tripulante                         ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'001aec ', N'Económica      ', 5, N'PE-35-231      ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'002aec ', N'Económica      ', 2, N'2-772-932      ', N'0000004             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'003aec ', N'Económica      ', 1, N'2-432-213      ', N'0000004             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'004aec ', N'Económica      ', 6, N'9-34-567       ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'005aec ', N'Económica      ', 8, N'7-334-327      ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'006aec ', N'Económica      ', 9, N'10-34-869      ', N'0000005             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'007aec ', N'Económica      ', 23, N'10-254-564     ', N'0000005             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'009aec ', N'Económica      ', 24, N'9-524-9236     ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'010aec ', N'Económica      ', 25, N'8-642-9345     ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'013aec ', N'Económica      ', 32, N'PE-32-798      ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'015aec ', N'Económica      ', 28, N'PE-76-893      ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'01ae   ', N'Ejecutiva      ', 1, N'8-999-99       ', N'0000003             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'020aec ', N'Económica      ', 33, N'8-948-9678     ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'022aec ', N'Económica      ', 37, N'7-871-6547     ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'024aec ', N'Económica      ', 44, N'4-222-565      ', N'0000003             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'02ae   ', N'Ejecutiva      ', 4, N'4-876-555      ', N'0000003             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'030aec ', N'Económica      ', 45, N'8-672-995      ', N'0000003             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'03ae   ', N'Ejecutiva      ', 2, N'PE-21-547      ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'04ae   ', N'Ejecutiva      ', 3, N'8-621-1634     ', N'0000001             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'05ae   ', N'Ejecutiva      ', 5, N'7-251-3567     ', N'0000001             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'06ae   ', N'Ejecutiva      ', 6, N'6-841-4647     ', N'0000002             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'07ae   ', N'Ejecutiva      ', 7, N'6-634-7854     ', N'0000002             ')
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'08ae   ', N'Ejecutiva      ', 8, N'3-431-1998     ', NULL)
GO
INSERT [dbo].[Reserva] ([reserva_id], [clase], [numero_puesto], [cedula_c], [cod_familia]) VALUES (N'09ae   ', N'Ejecutiva      ', 9, N'9-321-6785     ', NULL)
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'BCCi1  ', N'0010A  ', CAST(150.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), N'PP     ', N'BCC    ', CAST(N'00:55:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'BCCiv1 ', N'0011A  ', CAST(300.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(10, 2)), N'BCC    ', N'PP     ', CAST(N'00:55:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'BTBTi1 ', N'0012A  ', CAST(150.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), N'PP     ', N'BTBT   ', CAST(N'01:20:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'BTBTiv1', N'0013A  ', CAST(300.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(10, 2)), N'BTBT   ', N'PP     ', CAST(N'01:20:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'ICPi1  ', N'0014A  ', CAST(130.00 AS Decimal(10, 2)), CAST(260.00 AS Decimal(10, 2)), N'PP     ', N'ICP    ', CAST(N'01:00:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'ICPiv1 ', N'0015A  ', CAST(250.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), N'ICP    ', N'PP     ', CAST(N'01:00:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'MCi1   ', N'0020A  ', CAST(200.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), N'PP     ', N'MC     ', CAST(N'02:07:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'MCi2   ', N'0021A  ', CAST(200.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), N'PP     ', N'MC     ', CAST(N'02:07:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'MCi3   ', N'0022A  ', CAST(200.00 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), N'PP     ', N'MC     ', CAST(N'02:07:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'MCiv1  ', N'0023A  ', CAST(450.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)), N'MC     ', N'PP     ', CAST(N'02:07:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'MCiv2  ', N'0024A  ', CAST(450.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)), N'MC     ', N'PP     ', CAST(N'02:07:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'SJCRi1 ', N'0030A  ', CAST(190.00 AS Decimal(10, 2)), CAST(380.00 AS Decimal(10, 2)), N'PP     ', N'SJCR   ', CAST(N'01:40:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'SJCRi2 ', N'0031A  ', CAST(190.00 AS Decimal(10, 2)), CAST(380.00 AS Decimal(10, 2)), N'PP     ', N'SJCR   ', CAST(N'01:40:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'SJCRi3 ', N'0032A  ', CAST(190.00 AS Decimal(10, 2)), CAST(380.00 AS Decimal(10, 2)), N'PP     ', N'SJCR   ', CAST(N'01:40:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'SJCRiv1', N'0033A  ', CAST(410.00 AS Decimal(10, 2)), CAST(820.00 AS Decimal(10, 2)), N'SJCR   ', N'PP     ', CAST(N'01:40:00' AS Time))
GO
INSERT [dbo].[Vuelo] ([vuelo_id], [matricula], [precio_económica], [precio_ejecutivo], [origen], [destino], [duración]) VALUES (N'SJCRiv2', N'0034A  ', CAST(410.00 AS Decimal(10, 2)), CAST(820.00 AS Decimal(10, 2)), N'SJCR   ', N'PP     ', CAST(N'01:40:00' AS Time))
GO
ALTER TABLE [dbo].[ClienteVuelo]  WITH CHECK ADD  CONSTRAINT [ClienteVuelo_cedula_c_fk] FOREIGN KEY([cedula_c])
REFERENCES [dbo].[Cliente] ([cedula_c])
GO
ALTER TABLE [dbo].[ClienteVuelo] CHECK CONSTRAINT [ClienteVuelo_cedula_c_fk]
GO
ALTER TABLE [dbo].[ClienteVuelo]  WITH CHECK ADD  CONSTRAINT [ClienteVuelo_vuelo_id_fk] FOREIGN KEY([vuelo_id])
REFERENCES [dbo].[Vuelo] ([vuelo_id])
GO
ALTER TABLE [dbo].[ClienteVuelo] CHECK CONSTRAINT [ClienteVuelo_vuelo_id_fk]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [Pago_cedula_c_fk] FOREIGN KEY([cedula_c])
REFERENCES [dbo].[Cliente] ([cedula_c])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [Pago_cedula_c_fk]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [Personal_vuelo_id_fk] FOREIGN KEY([vuelo_id])
REFERENCES [dbo].[Vuelo] ([vuelo_id])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [Personal_vuelo_id_fk]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [Reserva_cedula_c_fk] FOREIGN KEY([cedula_c])
REFERENCES [dbo].[Cliente] ([cedula_c])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [Reserva_cedula_c_fk]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [Vuelo_destino_fk] FOREIGN KEY([destino])
REFERENCES [dbo].[Lugar] ([lugar_id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [Vuelo_destino_fk]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [Vuelo_matricula_fk] FOREIGN KEY([matricula])
REFERENCES [dbo].[Avion] ([matricula])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [Vuelo_matricula_fk]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [Vuelo_origen_fk] FOREIGN KEY([origen])
REFERENCES [dbo].[Lugar] ([lugar_id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [Vuelo_origen_fk]
GO
USE [master]
GO
ALTER DATABASE [Hadayi_Airlines] SET  READ_WRITE 
GO
