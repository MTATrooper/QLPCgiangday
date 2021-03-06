USE [master]
GO
/****** Object:  Database [QL_PCvaTDgiangday]    Script Date: 1/5/2019 3:47:19 PM ******/
CREATE DATABASE [QL_PCvaTDgiangday]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_PCvaTDgiangday', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QL_PCvaTDgiangday.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QL_PCvaTDgiangday_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QL_PCvaTDgiangday_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_PCvaTDgiangday].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET  MULTI_USER 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_PCvaTDgiangday', N'ON'
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET QUERY_STORE = OFF
GO
USE [QL_PCvaTDgiangday]
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
USE [QL_PCvaTDgiangday]
GO
/****** Object:  User [hiepoccho]    Script Date: 1/5/2019 3:47:19 PM ******/
CREATE USER [hiepoccho] FOR LOGIN [hiepoccho] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hiepoccho]
GO
/****** Object:  UserDefinedFunction [dbo].[GetPhancong]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetPhancong](@tenbm nvarchar(50)) returns @table table (MALOP char(10),
MAGV1 char(10), MAGV2 char(10), KIPHOC nvarchar(20), DIADIEM nvarchar(50), SOTIET int,
KYHOC nvarchar(50), NAMHOC nvarchar(50))
as
begin
	insert into @table
	select MALOP,MAGV1,MAGV2,KIPHOC,DIADIEM,SOTIET,KYHOC,NAMHOC
	from PHANCONG pc,GIAOVIEN gv,BOMON bm
	where pc.MAGV1 = gv.MAGV and gv.MABM = bm.MABM and bm.TENBM = @tenbm
return
end
GO
/****** Object:  UserDefinedFunction [dbo].[SOTIETDAY]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[SOTIETDAY](@magv char(10)) returns int
as
begin
	declare @hsgt int, @dmgd int, @sotiet int
	select @hsgt = dbo.Tong_HSGT(MAGV) from GIAOVIEN where MAGV = @magv
	if(@hsgt > 50)
	begin
		set @hsgt = 50
	end
	select @dmgd = DMGIANGDAY from CHUCDANH where MACD in (Select MACD from KYHOC where MAGV = @magv)
	set @sotiet = @dmgd - @dmgd * @hsgt /100
	return @sotiet
end
GO
/****** Object:  UserDefinedFunction [dbo].[THEODOIGD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[THEODOIGD](@mabm char(10), @ky nvarchar(20), @nam nvarchar(50)) 
returns @table table (MAGV char(10), DMGD int, TONGTIET int, SODU int)
as
begin
	declare @tam table (STT int, MAGV char(10))
	insert into @tam
	select ROW_NUMBER() over(order by MAGV), MAGV from GIAOVIEN where MABM = @mabm
	declare @magv char(10), @dinhmuc int, @tongtiet int, @sodu int, @dem int, @count int
	set @dem = 1
	select @count = count(MAGV) from GIAOVIEN where MABM = @mabm
	while (@dem <= @count)
	begin
		select @magv = MAGV from @tam where STT = @dem
		set @dinhmuc = dbo.SOTIETDAY(@magv)
		select @tongtiet = sum(SOTIET) from PHANCONG 
		where MAGV1 = @magv and KYHOC = @ky and NAMHOC = @nam
		set @sodu = @tongtiet - @dinhmuc
		insert into @table values (@magv, @dinhmuc, @tongtiet, @sodu)
		set @dem = @dem + 1
	end
return
end
GO
/****** Object:  UserDefinedFunction [dbo].[Tong_HSGT]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Tong_HSGT] (@magv char(10)) RETURNS INT
as
begin
declare @tong int
select @tong = sum(HESOGIAMTAI) from CHUCVU cv, KYHOC kh where MAGV = @magv and cv.MACV = kh.MACV
return @tong
end
GO
/****** Object:  Table [dbo].[BOMON]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOMON](
	[MABM] [char](10) NOT NULL,
	[TENBM] [nvarchar](50) NULL,
	[SOGV] [int] NULL,
	[MAChunhiem] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MABM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUCDANH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCDANH](
	[MACD] [char](10) NOT NULL,
	[TENCD] [nvarchar](50) NULL,
	[DMGIANGDAY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MACD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCVU](
	[MACV] [char](10) NOT NULL,
	[TENCV] [nvarchar](50) NULL,
	[HESOGIAMTAI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MACV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MAGV] [char](10) NOT NULL,
	[TENGV] [nvarchar](50) NULL,
	[NGAYSINH] [date] NULL,
	[SDT] [char](11) NULL,
	[DIACHI] [nvarchar](50) NULL,
	[MABM] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HEDAOTAO]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HEDAOTAO](
	[MAHEDT] [char](10) NOT NULL,
	[TENHEDT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHEDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCPHAN]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCPHAN](
	[MAHP] [char](10) NOT NULL,
	[TENHP] [nvarchar](50) NULL,
	[SOTC] [int] NULL,
	[SOTIET] [int] NULL,
	[MAMH] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KYHOC]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KYHOC](
	[MAGV] [char](10) NOT NULL,
	[MACD] [char](10) NOT NULL,
	[MACV] [char](10) NOT NULL,
	[TENKY] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC,
	[MACD] ASC,
	[MACV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPHOCPHAN]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPHOCPHAN](
	[MALOP] [char](10) NOT NULL,
	[TENLOP] [nvarchar](50) NULL,
	[QUANSO] [int] NULL,
	[NGONNGUGD] [nvarchar](50) NULL,
	[MAHP] [char](10) NULL,
	[MATD] [char](10) NULL,
	[MAHEDT] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MAMH] [char](10) NOT NULL,
	[TENMH] [nvarchar](50) NULL,
	[MABM] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MALOP] [char](10) NOT NULL,
	[MAGV1] [char](10) NOT NULL,
	[MAGV2] [char](10) NULL,
	[KIPHOC] [nvarchar](20) NULL,
	[DIADIEM] [nvarchar](50) NULL,
	[SOTIET] [int] NULL,
	[KYHOC] [nvarchar](50) NULL,
	[NAMHOC] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC,
	[MAGV1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[username] [varchar](50) NULL,
	[MAGV] [varchar](10) NULL,
	[Permission] [varchar](20) NULL,
	[Pass] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THOIKHOABIEU]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THOIKHOABIEU](
	[MALOP] [char](10) NULL,
	[THU] [nvarchar](20) NULL,
	[TUAN] [nvarchar](20) NULL,
	[KIPHOC] [nvarchar](20) NULL,
	[TIET] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRINHDODT]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRINHDODT](
	[MATD] [char](10) NOT NULL,
	[TENTD] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MATD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BOMON] ([MABM], [TENBM], [SOGV], [MAChunhiem]) VALUES (N'BM01      ', N'Toán', 4, N'GV001     ')
INSERT [dbo].[BOMON] ([MABM], [TENBM], [SOGV], [MAChunhiem]) VALUES (N'BM02      ', N'Công nghệ mạng', 4, N'GV007     ')
INSERT [dbo].[BOMON] ([MABM], [TENBM], [SOGV], [MAChunhiem]) VALUES (N'BM03      ', N'Khoa học máy tính', 6, N'GV011     ')
INSERT [dbo].[BOMON] ([MABM], [TENBM], [SOGV], [MAChunhiem]) VALUES (N'BM04      ', N'Hệ thống thông tin', 7, N'GV017     ')
INSERT [dbo].[BOMON] ([MABM], [TENBM], [SOGV], [MAChunhiem]) VALUES (N'BM05      ', N'Công nghệ phần mềm', 7, N'GV024     ')
INSERT [dbo].[BOMON] ([MABM], [TENBM], [SOGV], [MAChunhiem]) VALUES (N'BM06      ', N'An toàn thông tin', 7, N'GV031     ')
INSERT [dbo].[CHUCDANH] ([MACD], [TENCD], [DMGIANGDAY]) VALUES (N'CD01      ', N'Giáo sư', 155)
INSERT [dbo].[CHUCDANH] ([MACD], [TENCD], [DMGIANGDAY]) VALUES (N'CD02      ', N'Phó giáo sư', 145)
INSERT [dbo].[CHUCDANH] ([MACD], [TENCD], [DMGIANGDAY]) VALUES (N'CD03      ', N'Giảng viên chính/TS-GV', 140)
INSERT [dbo].[CHUCDANH] ([MACD], [TENCD], [DMGIANGDAY]) VALUES (N'CD04      ', N'Giảng viên/TS-TG', 130)
INSERT [dbo].[CHUCDANH] ([MACD], [TENCD], [DMGIANGDAY]) VALUES (N'CD05      ', N'Trợ giảng', 50)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV01      ', N'Chủ nhiệm khoa', 30)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV02      ', N'Phó chủ nhiệm khoa', 25)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV03      ', N'Chủ nhiệm bộ môn', 25)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV04      ', N'Phó chủ nhiệm bộ môn', 15)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV05      ', N'Giáo vụ khoa', 30)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV06      ', N'Trưởng phòng thí nghiệm', 15)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV07      ', N'Thư ký bộ môn', 15)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV08      ', N'Bí thư đảng ủy', 20)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV09      ', N'Phó bí thư đảng ủy', 15)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV10      ', N'Bí thư Chi bộ', 10)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV11      ', N'Phó bí thư chi bộ', 5)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV12      ', N'Không chức vụ', 0)
INSERT [dbo].[CHUCVU] ([MACV], [TENCV], [HESOGIAMTAI]) VALUES (N'CV13      ', N'Bí thư Chi Đoàn', 10)
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV001     ', N'Tạ Ngọc Ánh', CAST(N'1981-09-19' AS Date), N'0913006814 ', N'Bắc Từ Liêm, Hà Nội', N'BM01      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV004     ', N'Phạm Thế Anh', CAST(N'1981-04-15' AS Date), N'0983013340 ', N'Bắc Từ Liêm, Hà Nội', N'BM01      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV005     ', N'Nguyễn Văn Hồng', CAST(N'1966-10-21' AS Date), N'0912088334 ', N'Cầu Giấy,Hà Nội', N'BM01      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV006     ', N'Đỗ Anh Tuấn', CAST(N'1981-08-15' AS Date), N'0976115380 ', N'Long Biên, Hà Nội', N'BM01      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV007     ', N'Tạ Minh Thanh', CAST(N'1980-01-10' AS Date), N'0986007979 ', N'Bắc Từ Liêm, Hà Nội', N'BM02      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV008     ', N'Lưu Hồng Dũng', CAST(N'1966-08-27' AS Date), N'0906000013 ', N'Cầu Giấy, Hà Nội', N'BM02      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV009     ', N'Nguyễn Quang Uy', CAST(N'1980-03-04' AS Date), N'0968490399 ', N'Bắc Từ Liêm, Hà Nội', N'BM02      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV010     ', N'Nguyễn Trung Thành', CAST(N'1983-02-01' AS Date), N'0988903198 ', N'Bắc Từ Liêm, Hà Nội', N'BM02      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV011     ', N'Ngô Hữu Phúc', CAST(N'1976-06-25' AS Date), N'0913006814 ', N'Tây Hồ, Hà Nội', N'BM03      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV012     ', N'Hà Chí Trung', CAST(N'1979-05-16' AS Date), N'0168558202 ', N'Khu Tập Thế HVKTQS', N'BM03      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV013     ', N'Vi Bảo Ngọc', CAST(N'1985-11-21' AS Date), N'0983408885 ', N'Khu tập thể 212', N'BM03      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV014     ', N'Phan Thị Hải Hồng', CAST(N'1984-10-03' AS Date), N'0984725552 ', N'Đông Anh, Hà Nội', N'BM03      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV015     ', N'Dương Thị Minh Soan', CAST(N'1986-06-13' AS Date), N'0983588613 ', N'Khu Tập Thế HVKTQS', N'BM03      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV016     ', N'Nguyễn Trung Tín', CAST(N'1983-06-03' AS Date), N'0963983602 ', N'Đống Đa, Hà Nội', N'BM03      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV017     ', N'Hoa Tất Thắng', CAST(N'1979-06-11' AS Date), N'01233936886', N'Nam Từ Liêm, Hà Nội', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV018     ', N'Tống Minh Đức', CAST(N'1976-01-22' AS Date), N'0984485888 ', N'Nam Từ Liêm, Hà Nội', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV019     ', N'Nguyễn Hoài Anh', CAST(N'1977-07-13' AS Date), N'045521038  ', N'Thanh Xuân, Hà Nội', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV020     ', N'Nguyễn Mậu Uyên', CAST(N'1978-08-10' AS Date), N'0983602237 ', N'Bắc Từ Liêm, Hà Nội', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV021     ', N'Nguyễn Văn Giang', CAST(N'1981-10-18' AS Date), N'0968290551 ', N'Tập thể 361, HVKTQS', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV022     ', N'Đỗ Thị Mai Hường', CAST(N'1979-10-10' AS Date), N'0983366922 ', N'Nam Từ Liêm, Hà Nội', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV023     ', N'Trần Văn An', CAST(N'1985-11-30' AS Date), N'0965853399 ', N'Hà Nội', N'BM04      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV024     ', N'Phan Nguyên Hải', CAST(N'1979-06-13' AS Date), N'0984709262 ', N'Cầu Giấy, Hà Nội', N'BM05      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV025     ', N'Bùi Thu Lâm', CAST(N'1975-09-03' AS Date), N'0968699975 ', N'Nam Từ Liêm, Hà Nội', N'BM05      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV026     ', N'Nguyễn Quốc Khánh', CAST(N'1983-09-02' AS Date), N'0962393883 ', N'Tây Hồ, Hà Nội', N'BM05      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV027     ', N'Phạm Văn Việt', CAST(N'1979-05-25' AS Date), N'01279858755', N'Thanh Xuân, Hà Nội', N'BM05      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV028     ', N'Nguyễn Thị Hiền', CAST(N'1978-10-29' AS Date), N'0912092486 ', N'Tập thể 212, HVKTQS', N'BM05      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV029     ', N'Cao Tuấn Anh', CAST(N'1986-01-02' AS Date), N'0963065936 ', N'Tập thể 212, HVKTQS', N'BM05      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV031     ', N'Trần Nguyên Ngọc', CAST(N'1979-05-22' AS Date), N'0948435163 ', N'Hà Đông, Hà Nội', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV032     ', N'Hoàng Tuấn Hảo', CAST(N'1977-03-10' AS Date), N'0903410101 ', N'Đống Đa, Hà Nội', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV033     ', N'Nguyễn Việt Hùng', CAST(N'1981-11-29' AS Date), N'0912071428 ', N'Cầu Giấy, Hà Nội', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV034     ', N'Nguyễn Hữu Nội', CAST(N'1987-07-15' AS Date), N'0962631881 ', N'Sông Lô, Vĩnh Phúc', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV035     ', N'Trần Hồng Quang', CAST(N'1978-12-01' AS Date), N'0913096677 ', N'Hai Bà Trưng, Hà Nội', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV036     ', N'Nguyễn Văn Quân', CAST(N'1987-08-27' AS Date), N'0972822871 ', N'Tập thể 212, HVKTQS', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV037     ', N'Phạm Trường Sơn', CAST(N'1987-10-17' AS Date), N'0988171087 ', N'Từ Liêm, Hà Nội', N'BM06      ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [TENGV], [NGAYSINH], [SDT], [DIACHI], [MABM]) VALUES (N'GV038     ', N'Nguyễn Trung Thành', CAST(N'1988-06-22' AS Date), N'0915234601 ', N'Cầu Giấy, Hà Nội', N'BM05      ')
INSERT [dbo].[HEDAOTAO] ([MAHEDT], [TENHEDT]) VALUES (N'HE01      ', N'Dân sự')
INSERT [dbo].[HEDAOTAO] ([MAHEDT], [TENHEDT]) VALUES (N'HE02      ', N'Quân sự dài hạn')
INSERT [dbo].[HEDAOTAO] ([MAHEDT], [TENHEDT]) VALUES (N'HE03      ', N'Quốc tế')
INSERT [dbo].[HEDAOTAO] ([MAHEDT], [TENHEDT]) VALUES (N'HE04      ', N'VB2 - Cao đẳng')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP01      ', N'Toán chuyên đề', 3, 60, N'MH01      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP02      ', N'Giải tích 2', 4, 75, N'MH02      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP03      ', N'Hình giải tích và đại số tuyến tính', 3, 60, N'MH03      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP04      ', N'Giải tích 1', 4, 75, N'MH02      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP05      ', N'Lý thuyết xác suất thống kê', 3, 60, N'MH05      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP06      ', N'Toán sơ cấp', 2, 30, N'MH06      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP07      ', N'Lý thuyết hệ điều hành', 3, 45, N'MH07      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP08      ', N'Toán rời rạc', 3, 60, N'MH08      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP09      ', N'Đồ họa máy tính', 3, 60, N'MH09      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP10      ', N'Lập trình cơ bản', 3, 60, N'MH10      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP11      ', N'Ngôn ngữ XML+BTL', 3, 60, N'MH11      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP12      ', N'Ngôn ngữ lập trình 1', 2, 45, N'MH12      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP13      ', N'Lập trình trò chơi và mô phỏng', 3, 60, N'MH13      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP14      ', N'Công nghệ đa phương tiện', 3, 60, N'MH14      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP15      ', N'Cơ bản về điện toán đám mây', 3, 60, N'MH15      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP16      ', N'Phân tích và thiết kế giải thuật', 3, 60, N'MH16      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP17      ', N'Cơ sở dữ liệu', 4, 75, N'MH17      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP18      ', N'Công nghệ web', 2, 45, N'MH18      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP19      ', N'Tương tác người máy', 2, 30, N'MH19      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP20      ', N'Lập trình cho các thiết bị di động', 3, 60, N'MH20      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP21      ', N'Quản trị các hệ thống thông tin', 3, 60, N'MH21      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP22      ', N'Kỹ thuật lập trình', 3, 60, N'MH22      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP23      ', N'Nhập môn HTML và thiết kế web', 2, 45, N'MH23      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP24      ', N'Công nghệ mạng máy tính', 3, 60, N'MH24      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP25      ', N'Dịch vụ mạng', 2, 45, N'MH25      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP26      ', N'Quản trị mạng', 3, 60, N'MH26      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP27      ', N'Mạng máy tính', 3, 60, N'MH27      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP28      ', N'Xây dựng, quản trị và bảo trì hệ thống', 2, 60, N'MH28      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP29      ', N'Kỹ thuật liên mạng', 3, 60, N'MH29      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP30      ', N'Lý thuyết thông tin', 3, 60, N'MH30      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP31      ', N'Truyền dữ liệu', 3, 60, N'MH31      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP32      ', N'Thiết kế mạng', 3, 60, N'MH32      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP33      ', N'Thực tập công nghiệp', 3, 60, N'MH33      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP34      ', N'Tiếng Anh chuyên ngành', 1, 30, N'MH34      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP35      ', N'Phát triển phần mềm di động', 3, 60, N'MH35      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP36      ', N'Công nghệ phần mềm', 3, 45, N'MH36      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP37      ', N'Lập trình hướng đối tượng', 3, 60, N'MH37      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP38      ', N'Lập tình nâng cao', 3, 60, N'MH38      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP39      ', N'Ngôn ngữ lập trình 2', 2, 45, N'MH12      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP40      ', N'Công nghệ lập trình tích hợp', 3, 60, N'MH39      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP41      ', N'Thiết kế và xây dựng phần mềm', 3, 60, N'MH40      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP42      ', N'Thiết kế giao diện người sử dụng', 3, 60, N'MH41      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP43      ', N'Phân tích và mô hình hóa phần mềm', 3, 60, N'MH42      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP44      ', N'Lập trình Adroid', 3, 60, N'MH43      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP45      ', N'Lập tình ứng dụng Windows Form với C#', 3, 60, N'MH44      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP46      ', N'Lập trình nhúng', 3, 60, N'MH45      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP47      ', N'Lập trình phần mềm an toàn', 3, 60, N'MH46      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP48      ', N'An ninh mạng', 3, 60, N'MH47      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP49      ', N'Đảm bảo và an toàn thông tin', 3, 45, N'MH48      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP50      ', N'Mã hóa', 3, 60, N'MH49      ')
INSERT [dbo].[HOCPHAN] ([MAHP], [TENHP], [SOTC], [SOTIET], [MAMH]) VALUES (N'HP51      ', N'Lập trình hợp ngữ', 2, 60, N'MH50      ')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV001     ', N'CD03      ', N'CV03      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV001     ', N'CD03      ', N'CV10      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV004     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV005     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV006     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV007     ', N'CD03      ', N'CV03      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV007     ', N'CD03      ', N'CV10      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV008     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV009     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV010     ', N'CD03      ', N'CV06      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV011     ', N'CD03      ', N'CV03      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV011     ', N'CD03      ', N'CV10      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV012     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV013     ', N'CD04      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV014     ', N'CD04      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV015     ', N'CD04      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV016     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV017     ', N'CD03      ', N'CV03      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV017     ', N'CD03      ', N'CV10      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV018     ', N'CD03      ', N'CV02      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV018     ', N'CD03      ', N'CV09      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV019     ', N'CD04      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV020     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV021     ', N'CD03      ', N'CV04      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV021     ', N'CD03      ', N'CV11      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV022     ', N'CD04      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV023     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV024     ', N'CD03      ', N'CV03      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV024     ', N'CD03      ', N'CV10      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV025     ', N'CD02      ', N'CV01      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV025     ', N'CD02      ', N'CV08      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV026     ', N'CD03      ', N'CV04      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV026     ', N'CD03      ', N'CV06      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV026     ', N'CD03      ', N'CV11      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV027     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV028     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV029     ', N'CD05      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV031     ', N'CD03      ', N'CV03      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV031     ', N'CD03      ', N'CV10      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV032     ', N'CD03      ', N'CV06      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV033     ', N'CD03      ', N'CV04      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV033     ', N'CD03      ', N'CV11      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV034     ', N'CD05      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV035     ', N'CD03      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV036     ', N'CD05      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV037     ', N'CD04      ', N'CV12      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[KYHOC] ([MAGV], [MACD], [MACV], [TENKY]) VALUES (N'GV038     ', N'CD04      ', N'CV13      ', N'Học kỳ 1 năm học 2017-2018')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP001    ', N'ĐTVT15', 56, N'Tiếng Việt', N'HP01      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP002    ', N'KTĐK15', 65, N'Tiếng Việt', N'HP01      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP003    ', N'CNTT52,BDDATTT52,ANHTTT52', 40, N'Tiếng Việt', N'HP02      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP004    ', N'VK52,DDA52,GCAL52', 76, N'Tiếng Việt', N'HP02      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP005    ', N'KSDS16', 45, N'Tiếng Việt', N'HP03      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP006    ', N'KSDS16-1', 47, N'Tiếng Việt', N'HP04      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP007    ', N'KSDS16-2', 54, N'Tiếng Việt', N'HP04      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP008    ', N'KHMT15', 61, N'Tiếng Việt', N'HP05      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP009    ', N'VB2CTQP-K7', 43, N'Tiếng Việt', N'HP05      ', N'TD03      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP010    ', N'KTĐK52', 35, N'Tiếng Việt', N'HP05      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP011    ', N'DKLAO53,DKCPC53', 38, N'Tiếng Việt', N'HP06      ', N'TD03      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP012    ', N'LTVK-Đ34', 76, N'Tiếng Việt', N'HP04      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP013    ', N'CNTT51,BDDATTT51,ANHTTT51', 56, N'Tiếng Anh', N'HP07      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP014    ', N'KHMT14', 62, N'Tiếng Anh', N'HP07      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP015    ', N'CNTT51,BDDATTT51,ANHTTT51', 56, N'Tiếng Việt', N'HP08      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP016    ', N'TH(L)51,TH(C)51', 35, N'Tiếng Việt', N'HP08      ', N'TD02      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP017    ', N'ĐPT13', 39, N'Tiếng Anh', N'HP09      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP018    ', N'KSDS16', 48, N'Tiếng Việt', N'HP10      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP019    ', N'OTOQS52,XMCB52', 45, N'Tiếng Việt', N'HP10      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP020    ', N'TT52,TLPK52,TLHQ52', 46, N'Tiếng Việt', N'HP10      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP021    ', N'CĐTH18', 55, N'Tiếng Việt', N'HP11      ', N'TD01      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP022    ', N'ĐTVT14', 75, N'Tiếng Việt', N'HP12      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP023    ', N'ĐTYS14', 36, N'Tiếng Việt', N'HP12      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP024    ', N'TĐH14', 41, N'Tiếng Việt', N'HP12      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP025    ', N'ĐPT13', 39, N'Tiếng Anh', N'HP13      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP026    ', N'ĐPT13', 39, N'Tiếng Anh', N'HP14      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP027    ', N'HTTT12', 84, N'Tiếng Việt', N'HP15      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP028    ', N'ĐPT13', 39, N'Tiếng Anh', N'HP16      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP029    ', N'HTTT13', 45, N'Tiếng Anh', N'HP16      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP030    ', N'KHMT14', 67, N'Tiếng Việt', N'HP17      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP031    ', N'CĐTH17', 54, N'Tiếng Anh', N'HP18      ', N'TD01      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP032    ', N'BDDATTT50,TH50', 36, N'Tiếng Anh', N'HP18      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP033    ', N'BDDATTT50,TH50', 36, N'Tiếng Anh', N'HP19      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP034    ', N'HTTT12', 84, N'Tiếng Việt', N'HP20      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP035    ', N'HTTT13', 45, N'Tiếng Việt', N'HP21      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP036    ', N'TH15', 80, N'Tiếng Việt', N'HP22      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP037    ', N'CĐTH18', 30, N'Tiếng Việt', N'HP23      ', N'TD01      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP038    ', N'TH49', 20, N'Tiếng Việt', N'HP26      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP039    ', N'CNTT51,BDDATTT51,ANHTTT51,DTH51', 56, N'Tiếng Việt', N'HP27      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP040    ', N' TH(L)51, TH(C)51, ĐTH(C)51', 24, N'Tiếng Việt', N'HP27      ', N'TD02      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP041    ', N' BĐATTT50, TH50, TH(L)50', 36, N'Tiếng Việt', N'HP28      ', N'TD02      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP042    ', N' ATTT13', 45, N'Tiếng Anh', N'HP29      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP043    ', N'MMT14', 81, N'Tiếng Anh', N'HP30      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP044    ', N'KSDS16-1', 100, N'Tiếng Việt', N'HP10      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP045    ', N'TH15', 20, N'Tiếng Việt', N'HP12      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP047    ', N'VB2CNTT-K6', 24, N'Tiếng Việt', N'HP29      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP048    ', N'VB2CNTT-K6', 36, N'Tiếng Việt', N'HP31      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP049    ', N'VB2CNTT-K6 ', 45, N'Tiếng Việt', N'HP26      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP050    ', N'VB2CNTT-K6', 81, N'Tiếng Việt', N'HP32      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP051    ', N'VB2CNTT-K6', 81, N'Tiếng Việt', N'HP33      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP052    ', N'OTOQS52, XMCB52, TTG52, MT52', 78, N'Tiếng Việt', N'HP30      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP053    ', N'TH49', 20, N'Tiếng Anh', N'HP34      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP054    ', N'CNPM12', 33, N'Tiếng Anh', N'HP35      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP055    ', N'BĐATTT50, TH50, TH(L)50', 36, N'Tiếng Việt', N'HP36      ', N'TD02      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP056    ', N'CNTT51, BĐATTT51, ANHTTT51, ĐTH51', 56, N'Tiếng Việt', N'HP37      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP057    ', N'TH(L)51, TH(C)51, ĐTH(C)51', 24, N'Tiếng Việt', N'HP37      ', N'TD02      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP058    ', N'KHMT14', 67, N'Tiếng Anh', N'HP38      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP059    ', N'MMT14', 81, N'Tiếng Anh', N'HP38      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP060    ', N'CĐTH18', 30, N'Tiếng Anh', N'HP39      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP062    ', N'CNPM13', 45, N'Tiếng Anh', N'HP33      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP064    ', N'TH(L)51,ĐTH(L)51', 25, N'Tiếng Việt', N'HP45      ', N'TD01      ', N'HE03      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP065    ', N'HTTT13', 45, N'Tiếng Anh', N'HP40      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP066    ', N'TH49', 20, N'Tiếng Anh', N'HP40      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP067    ', N'CNPM13', 45, N'Tiếng Anh', N'HP41      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP068    ', N'CNPM13', 45, N'Tiếng Anh', N'HP42      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP069    ', N'CNPM13', 45, N'Tiếng Anh', N'HP16      ', N'TD03      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP070    ', N'CĐTH17', 54, N'Tiếng Anh', N'HP44      ', N'TD01      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP071    ', N'CĐTH17', 54, N'Tiếng Anh', N'HP45      ', N'TD01      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP072    ', N'ATTT13', 45, N'Tiếng Việt', N'HP47      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP073    ', N'CNTPM12', 33, N'Tiếng Việt', N'HP47      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP074    ', N'ATTT13', 45, N'Tiếng Việt', N'HP48      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP075    ', N'TH49', 20, N'Tiếng Việt', N'HP48      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP076    ', N'HTTT14', 83, N'Tiếng Việt', N'HP49      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP077    ', N'KTPM14', 76, N'Tiếng Việt', N'HP49      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP078    ', N'CNTT14', 96, N'Tiếng Việt', N'HP49      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP079    ', N'KHMT14', 67, N'Tiếng Việt', N'HP49      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP080    ', N'CĐTH17', 54, N'Tiếng Việt', N'HP49      ', N'TD01      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP081    ', N'ATTT13', 45, N'Tiếng Việt', N'HP49      ', N'TD02      ', N'HE01      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP082    ', N'VB2CNTT-K6', 11, N'Tiếng Việt', N'HP50      ', N'TD02      ', N'HE04      ')
INSERT [dbo].[LOPHOCPHAN] ([MALOP], [TENLOP], [QUANSO], [NGONNGUGD], [MAHP], [MATD], [MAHEDT]) VALUES (N'LOP083    ', N'TH51', 56, N'Tiếng Việt', N'HP51      ', N'TD03      ', N'HE02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH01      ', N'Toán chuyên đề', N'BM01      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH02      ', N'Giải tích', N'BM01      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH03      ', N'Hình giải tích và đại số tuyến tính', N'BM01      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH04      ', N'Toán cao cấp', N'BM01      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH05      ', N'Lý thuyết xác suất thống kê', N'BM01      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH06      ', N'Toán sơ cấp', N'BM01      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH07      ', N'Lý thuyết hệ điều hành', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH08      ', N'Toán rời rạc', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH09      ', N'Đồ họa máy tính', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH10      ', N'Lập trình cơ bản', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH11      ', N'Ngôn ngữ XML+BTL', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH12      ', N'Ngôn ngữ lập trình', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH13      ', N'Lập trình trò chơi và mô phỏng', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH14      ', N'Công nghệ đa phương tiện', N'BM03      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH15      ', N'Cơ bản về điện toán đám mây', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH16      ', N'Phân tích và thiết kế hệ thống', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH17      ', N'Cơ sở dữ liệu', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH18      ', N'Công nghệ web', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH19      ', N'Tương tác người máy', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH20      ', N'Lập trình cho các thiết bị di động', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH21      ', N'Quản trị các hệ thống thông tin', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH22      ', N'Kỹ thuật lập trình', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH23      ', N'Nhập môn HTML và thiết kế web', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH24      ', N'Công nghệ mạng máy tính', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH25      ', N'Dịch vụ mạng', N'BM04      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH26      ', N'Quản trị mạng', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH27      ', N'Mạng máy tính', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH28      ', N'Xây dựng, quản trị và bảo trì hệ thống', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH29      ', N'Kỹ thuật liên mạng', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH30      ', N'Lý thuyết thông tin', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH31      ', N'Truyền dữ liệu', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH32      ', N'Thiết kệ mạng', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH33      ', N'Thực tập công nghiệp', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH34      ', N'Tiếng Anh chuyên ngành', N'BM02      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH35      ', N'Phát triển phần mềm di động', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH36      ', N'Công nghệ phần mềm', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH37      ', N'Lập trình hướng đối tượng', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH38      ', N'Lập tình nâng cao', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH39      ', N'Công nghệ lập trình tích hợp', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH40      ', N'Thiết kế và xây dựng phần mềm', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH41      ', N'Thiết kế giao diện người sử dụng', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH42      ', N'Phân tích và mô hình hóa phần mềm', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH43      ', N'Lập trình Adroid', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH44      ', N'Lập tình ứng dụng Windows Form với C#', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH45      ', N'Lập trình nhúng', N'BM05      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH46      ', N'Lập trình phần mềm an toàn', N'BM06      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH47      ', N'An ninh mạng', N'BM06      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH48      ', N'Đảm bảo và an toàn thông tin', N'BM06      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH49      ', N'Mã hóa', N'BM06      ')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [MABM]) VALUES (N'MH50      ', N'Lập trình hợp ngữ', N'BM06      ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP038    ', N'GV009     ', N'GV007     ', N'Sáng', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP039    ', N'GV010     ', N'GV007     ', N'Sáng', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP040    ', N'GV009     ', N'GV007     ', N'Chiều', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP043    ', N'GV007     ', N'GV008     ', N'Chiều', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP049    ', N'GV010     ', N'GV007     ', N'Chiều', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP050    ', N'GV010     ', N'GV009     ', N'Sáng', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP051    ', N'GV007     ', N'GV009     ', N'Sáng', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP052    ', N'GV009     ', N'GV007     ', N'Chiều', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP053    ', N'GV009     ', N'GV008     ', N'Sáng', N'Khu A', 30, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[PHANCONG] ([MALOP], [MAGV1], [MAGV2], [KIPHOC], [DIADIEM], [SOTIET], [KYHOC], [NAMHOC]) VALUES (N'LOP062    ', N'GV008     ', N'GV010     ', N'Chiều', N'Khu A', 60, N'Học kỳ: 1', N'- Năm học: 2017-2018 ')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'BuiLam', N'GV025', N'admin', N'builam')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'TongMD', N'GV018', N'admin', N'ductong')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'NgocTran', N'GV031', N'user', N'ngoctran')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'NgocAnhMath', N'GV001', N'user', N'anhta')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'TMThanh', N'GV007', N'user', N'thanhta')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'HuuPhuc', N'GV011', N'user', N'phucngo')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'TatThangwinner', N'GV017', N'user', N'thanghoa')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'PhanHai', N'GV024', N'user', N'phanhai')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'ManhMTA', N'GV002', N'user', N'manhhy')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'df', N'GV012', N'user', N'1')
INSERT [dbo].[TAIKHOAN] ([username], [MAGV], [Permission], [Pass]) VALUES (N'r', N'GV016', N'user', N'1')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP028    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP037    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP027    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP029    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP054    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-4       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP058    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP071    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP057    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP056    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP055    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP066    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP059    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'7-9       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP064    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP065    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP038    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP049    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP039    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP040    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP050    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-4       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP052    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP051    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP043    ', N'Thứ 5', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP053    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP062    ', N'Thứ 6', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP072    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-10      ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP073    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP074    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP075    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP078    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP079    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP076    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP082    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP083    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 1', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 2', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 3', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 4', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 5', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 6', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 7', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 8', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 9', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 10', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 11', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 12', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 13', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 14', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP077    ', N'Thứ 5', N'Tuần 15', N'Chiều', N'8-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP080    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 6', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP081    ', N'Thứ 6', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP069    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP032    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'10-12     ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP031    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP033    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP036    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 1', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 2', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 3', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 4', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 5', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 6', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 7', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 8', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 9', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 10', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 11', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 12', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 13', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 14', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP030    ', N'Thứ 5', N'Tuần 15', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP034    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP070    ', N'Thứ 5', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'3-6       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP035    ', N'Thứ 6', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP013    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP023    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP022    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP060    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP016    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP024    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'4-6       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP014    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP045    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'4-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP015    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP019    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP044    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP021    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP025    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-4       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP067    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'3-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP068    ', N'Thứ 6', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP001    ', N'Thứ 2', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 1', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 2', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 3', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 4', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 5', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 6', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 7', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 8', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 9', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 10', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 11', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 12', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 13', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 14', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 2', N'Tuần 15', N'Chiều', N'10-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP026    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 7', N'Chiều', N'7-10      ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP018    ', N'Thứ 5', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP017    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP020    ', N'Thứ 6', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-3       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP002    ', N'Thứ 3', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-9       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 1', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 2', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 3', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 4', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 5', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 6', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 7', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 8', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 9', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 10', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 11', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 12', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 13', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 14', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP009    ', N'Thứ 3', N'Tuần 15', N'Chiều', N'7-10      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'1-4       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP005    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 1', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 2', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 3', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 4', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 5', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 6', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 7', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 8', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 9', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 10', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 11', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 12', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 13', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 14', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP007    ', N'Thứ 4', N'Tuần 15', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP012    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 1', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 2', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 3', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 4', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 5', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 6', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 7', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 8', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 9', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 10', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 11', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 12', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 13', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 14', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP008    ', N'Thứ 4', N'Tuần 15', N'Chiều', N'9-12      ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 1', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 2', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 3', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 4', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 5', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 6', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 7', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 8', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 9', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 10', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 11', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 12', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 13', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 14', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP006    ', N'Thứ 5', N'Tuần 15', N'Sáng', N'1-2       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 1', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 2', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 3', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 4', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 5', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 6', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 7', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 8', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 9', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 10', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 11', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 12', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 13', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 14', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP003    ', N'Thứ 5', N'Tuần 15', N'Chiều', N'11-12     ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'1-4       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP010    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'1-4       ')
GO
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 1', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 2', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 3', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 4', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 5', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 6', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 7', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 8', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 9', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 10', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 11', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 12', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 13', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 14', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP011    ', N'Thứ 6', N'Tuần 15', N'Sáng', N'5-6       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 1', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 2', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 3', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 4', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 5', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 6', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 7', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 8', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 9', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 10', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 11', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 12', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 13', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 14', N'Chiều', N'7-8       ')
INSERT [dbo].[THOIKHOABIEU] ([MALOP], [THU], [TUAN], [KIPHOC], [TIET]) VALUES (N'LOP004    ', N'Thứ 6', N'Tuần 15', N'Chiều', N'7-8       ')
INSERT [dbo].[TRINHDODT] ([MATD], [TENTD]) VALUES (N'TD01      ', N'Đại học')
INSERT [dbo].[TRINHDODT] ([MATD], [TENTD]) VALUES (N'TD02      ', N'Cao đẳng')
INSERT [dbo].[TRINHDODT] ([MATD], [TENTD]) VALUES (N'TD03      ', N'Kỹ sư')
INSERT [dbo].[TRINHDODT] ([MATD], [TENTD]) VALUES (N'TD04      ', N'Nghiên cứu sinh')
INSERT [dbo].[TRINHDODT] ([MATD], [TENTD]) VALUES (N'TD05      ', N'Cử nhân')
INSERT [dbo].[TRINHDODT] ([MATD], [TENTD]) VALUES (N'TD06      ', N'Trung cấp')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BOMON__A58D674CAB356CD8]    Script Date: 1/5/2019 3:47:20 PM ******/
ALTER TABLE [dbo].[BOMON] ADD UNIQUE NONCLUSTERED 
(
	[TENBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MONHOC__A58D38A035EF71DA]    Script Date: 1/5/2019 3:47:20 PM ******/
ALTER TABLE [dbo].[MONHOC] ADD UNIQUE NONCLUSTERED 
(
	[TENMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GIAOVIEN] ADD  DEFAULT (getdate()) FOR [NGAYSINH]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD FOREIGN KEY([MABM])
REFERENCES [dbo].[BOMON] ([MABM])
GO
ALTER TABLE [dbo].[HOCPHAN]  WITH CHECK ADD FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
GO
ALTER TABLE [dbo].[KYHOC]  WITH CHECK ADD FOREIGN KEY([MACD])
REFERENCES [dbo].[CHUCDANH] ([MACD])
GO
ALTER TABLE [dbo].[KYHOC]  WITH CHECK ADD FOREIGN KEY([MACV])
REFERENCES [dbo].[CHUCVU] ([MACV])
GO
ALTER TABLE [dbo].[KYHOC]  WITH CHECK ADD FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
GO
ALTER TABLE [dbo].[LOPHOCPHAN]  WITH CHECK ADD FOREIGN KEY([MAHEDT])
REFERENCES [dbo].[HEDAOTAO] ([MAHEDT])
GO
ALTER TABLE [dbo].[LOPHOCPHAN]  WITH CHECK ADD FOREIGN KEY([MAHP])
REFERENCES [dbo].[HOCPHAN] ([MAHP])
GO
ALTER TABLE [dbo].[LOPHOCPHAN]  WITH CHECK ADD FOREIGN KEY([MATD])
REFERENCES [dbo].[TRINHDODT] ([MATD])
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD FOREIGN KEY([MABM])
REFERENCES [dbo].[BOMON] ([MABM])
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD FOREIGN KEY([MAGV1])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOPHOCPHAN] ([MALOP])
GO
ALTER TABLE [dbo].[THOIKHOABIEU]  WITH CHECK ADD FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOPHOCPHAN] ([MALOP])
GO
/****** Object:  StoredProcedure [dbo].[SearchBMma]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchBMma] (@ten char(10))
as
begin
select * from BOMON where MABM like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchBMten]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchBMten] (@ten nvarchar(50))
as
begin
select * from BOMON where TENBM like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchGVma]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchGVma] (@ten char(10))
as
begin
select * from GIAOVIEN where MAGV like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchGVten]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchGVten] (@ten nvarchar(50))
as
begin
select * from GIAOVIEN where TENGV like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchHPma]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchHPma] (@ten char(10))
as
begin
select * from HOCPHAN where MAHP like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchHPten]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchHPten] (@ten nvarchar(50))
as
begin
select * from HOCPHAN where TENHP like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchLOPma]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchLOPma] (@ten char(10))
as
begin
select * from LOPHOCPHAN where MALOP like '%'+@ten+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchLOPten]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchLOPten] (@ten nvarchar(50))
as
begin
select * from LOPHOCPHAN where TENLOP LIKE '%' + @ten + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchTKBmalop]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchTKBmalop](@ten char(10))
as
begin
select * from THOIKHOABIEU where MALOP like '%' + @ten +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SelectGV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectGV]
as
begin
select MAGV, TENGV from GIAOVIEN
end
GO
/****** Object:  StoredProcedure [dbo].[SelectMALOP]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectMALOP]
as
begin
select MALOP, TENLOP from LOPHOCPHAN
where MALOP not in (select MALOP from PHANCONG)
end
GO
/****** Object:  StoredProcedure [dbo].[SuaBM]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaBM] (@ma char(10), @ten nvarchar(50), @sogv int, @macn char(10))
as
begin
update BOMON
set TENBM=@ten,SOGV=@sogv,MAChunhiem=@macn
where MABM=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaCD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaCD] (@ma char(10), @ten nvarchar(50), @dmgd int)
as
begin
update CHUCDANH
set TENCD=@ten,DMGIANGDAY=@dmgd
where MACD=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaCV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaCV] (@ma char(10), @ten nvarchar(50), @hsgt int)
as
begin
update CHUCVU
set TENCV=@ten,HESOGIAMTAI=@hsgt
where MACV=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaGV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaGV] (@ma char(10), @ten nvarchar(50), @ngaysinh date, @sdt char(11), @diachi nvarchar(50), @mabm char(10))
as
begin
update GIAOVIEN
set TENGV=@ten, NGAYSINH=@ngaysinh,SDT=@sdt,DIACHI=@diachi,MABM=@mabm
where MAGV=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaHE]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaHE] (@ma char(10), @ten nvarchar(10))
as
begin
update HEDAOTAO
set TENHEDT=@ten where MAHEDT=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaHP]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaHP] (@ma char(10), @ten nvarchar(50),@sotc int, @sotiet int, @mamh char(10))
as
begin
update HOCPHAN
set TENHP=@ten,SOTC=@sotc,SOTIET=@sotiet,MAMH=@mamh
where MAHP=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaKH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaKH] (@magv char(10), @macd char(10), @macv char(10), @ten nvarchar(50))
as
begin
update KYHOC
set TENKY=@ten
where MAGV=@magv and MACD=@macd and MACV=@macv
end
GO
/****** Object:  StoredProcedure [dbo].[Sualop]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sualop] (@malop CHAR(10),@ten NVARCHAR(50),@qs INT,@ngonngu NVARCHAR(30),@mahp CHAR(10),@matd CHAR(10),@mahe CHAR(10))
as
begin
update LOPHOCPHAN
set TENLOP=@ten,QUANSO=@qs,NGONNGUGD=@ngonngu,MAHP=@mahp,MATD=@matd,MAHEDT=@mahe
where MALOP=@malop
end
GO
/****** Object:  StoredProcedure [dbo].[SuaMH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaMH] (@ma char(10), @ten nvarchar(50), @mabm char(10))
as
begin
update MONHOC
set TENMH=@ten,MABM=@mabm
where MAMH=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[SuaPC]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SuaPC] (@malop char(10),@magv1 char(10),@magv2 char(10),@kip nvarchar(10),@diadiem nvarchar(50),@sotiet int, @ky nvarchar(50), @nam nvarchar(50))
as
begin
	update PHANCONG
	set MAGV2=@magv2,KIPHOC=@kip,DIADIEM=@diadiem,SOTIET=@sotiet, KYHOC=@ky,NAMHOC=@nam
	where MALOP=@malop and MAGV1=@magv1
end
GO
/****** Object:  StoredProcedure [dbo].[SuaTD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaTD] (@ma char(10), @ten nvarchar(10))
as
begin
update TRINHDODT
set TENTD=@ten where MATD=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[suaTK]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaTK](@ma varchar(10),@pass varchar(50))
as
update TAIKHOAN
set Pass=@pass
where MAGV=@ma
GO
/****** Object:  StoredProcedure [dbo].[SuaTKB]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SuaTKB] (@malop char(10), @thu nvarchar(20) ,@tuan nvarchar(20),@kip nvarchar(20), @tiet char(10))
as
begin
update THOIKHOABIEU
set THU = @thu, TUAN = @tuan, KIPHOC = @kip,TIET = @tiet
where MALOP=@malop
end
GO
/****** Object:  StoredProcedure [dbo].[ThemBM]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemBM] (@ma char(10), @ten nvarchar(100), @sogv int, @macn char(10))
as
begin
insert into BOMON values (@ma,@ten,@sogv,@macn)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemCD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemCD] (@ma char(10), @ten nvarchar(50), @dmgd int)
as
begin
insert into CHUCDANH
values (@ma, @ten, @dmgd)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemCV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemCV] (@ma char(10), @ten nvarchar(50), @hsgt int)
as
begin
insert into CHUCVU
values (@ma, @ten, @hsgt)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemGV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemGV] (@ma char(10), @ten nvarchar(50), @ngaysinh date, @sdt char(11), @diachi nvarchar(50), @mabm char(10))
as
begin
insert into GIAOVIEN values (@ma,@ten,@ngaysinh,@sdt,@diachi,@mabm)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemHE]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemHE] (@ma char(10), @ten nvarchar(50))
as
begin
insert into HEDAOTAO values (@ma, @ten)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemHP]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemHP] (@ma char(10), @ten nvarchar(100), @sotc int, @sotiet int, @mamh char(10))
as
begin
insert into HOCPHAN values (@ma,@ten,@sotc,@sotiet,@mamh)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemKH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemKH] (@magv char(10), @macd char(10), @macv char(10), @ten nvarchar(50))
as
begin
insert into KYHOC values (@magv,@macd,@macv,@ten)
end
GO
/****** Object:  StoredProcedure [dbo].[Themlop]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Themlop] (@malop CHAR(10),@ten NVARCHAR(50),@qs INT,@ngonngu NVARCHAR(30),@mahp CHAR(10),@matd CHAR(10),@mahe CHAR(10))
as
begin
insert into LOPHOCPHAN
values (@malop,@ten,@qs,@ngonngu,@mahp,@matd,@mahe)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemMH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemMH] (@ma char(10), @ten nvarchar(50) , @mabm char(10))
as
begin
insert into MONHOC values (@ma,@ten,@mabm)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemPC]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemPC] (@malop char(10),@magv1 char(10),@magv2 char(10),@kip nvarchar(10),@diadiem nvarchar(50),@sotiet int, @ky nvarchar(50), @nam nvarchar(50))
as
begin
	insert into PHANCONG
	values(@malop,@magv1,@magv2,@kip,@diadiem,@sotiet,@ky,@nam)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemTD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemTD] (@ma char(10), @ten nvarchar(50))
as
begin
insert into TRINHDODT values (@ma, @ten)
end
GO
/****** Object:  StoredProcedure [dbo].[themTK]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themTK](@user varchar(50),@ma varchar(10),@pass varchar(50))
as
insert into TAIKHOAN
Values (@user,@ma,'user',@pass)
GO
/****** Object:  StoredProcedure [dbo].[ThemTKB]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemTKB] (@malop char(10), @thu nvarchar(20) ,@tuan nvarchar(20),@kip nvarchar(20), @tiet char(10))
as
begin
insert into THOIKHOABIEU
values(@malop,@thu,@tuan,@kip,@tiet)
end
GO
/****** Object:  StoredProcedure [dbo].[timkiemlop]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemlop] (@ten nvarchar(50))
as
begin
select MALOP, TENLOP from LOPHOCPHAN where TENLOP like '%' + @ten + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[XoaBM]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XoaBM](@ma char(10))
as
begin
delete BOMON where MABM=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaCD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaCD] (@ma char(10))
as
begin
delete CHUCDANH where MACD=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaCV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaCV] (@ma char(10))
as
begin
delete CHUCVU where MACV=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaGV]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XoaGV](@ma char(10))
as
begin
delete GIAOVIEN where MAGV=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaHE]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaHE] (@ma char(10))
as
begin
delete HEDAOTAO where MAHEDT=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaHP]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XoaHP](@ma char(10))
as
begin
delete HOCPHAN where MAHP=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaKH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaKH] (@magv char(10), @macd char(10), @macv char(10))
as
begin
delete KYHOC where MAGV=@magv and MACD = @macd and MACV = @macv
end
GO
/****** Object:  StoredProcedure [dbo].[XoaLop]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XoaLop] (@malop char(10))
as
begin
delete LOPHOCPHAN where MALOP=@malop
end
GO
/****** Object:  StoredProcedure [dbo].[XoaMH]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XoaMH](@ma char(10))
as
begin
delete MONHOC where MAMH=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaPC]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaPC](@malop char(10))
as
begin
delete PHANCONG
where MALOP=@malop
end
GO
/****** Object:  StoredProcedure [dbo].[XoaPC_BM]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaPC_BM](@tenbm nvarchar(50))
as
begin
	delete PHANCONG
	where MALOP in (select MALOP from LOPHOCPHAN lhp, HOCPHAN hp, MONHOC mh, BOMON bm
	where lhp.MAHP = hp.MAHP and hp.MAMH = mh.MAMH and mh.MABM = bm.MABM and TENBM = @tenbm)
end
GO
/****** Object:  StoredProcedure [dbo].[XoaTD]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaTD] (@ma char(10))
as
begin
delete TRINHDODT where MATD=@ma
end
GO
/****** Object:  StoredProcedure [dbo].[XoaTKB]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaTKB] (@malop char(10))
as
begin
delete THOIKHOABIEU where MALOP=@malop
end
GO
/****** Object:  StoredProcedure [dbo].[XoaTKB_BM]    Script Date: 1/5/2019 3:47:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaTKB_BM](@tenbm nvarchar(50))
as
begin
	delete THOIKHOABIEU
	where MALOP in (select MALOP from LOPHOCPHAN lhp, HOCPHAN hp, MONHOC mh, BOMON bm
	where lhp.MAHP = hp.MAHP and hp.MAMH = mh.MAMH and mh.MABM = bm.MABM and TENBM = @tenbm)
end
GO
USE [master]
GO
ALTER DATABASE [QL_PCvaTDgiangday] SET  READ_WRITE 
GO
