USE [master]
GO
/****** Object:  Database [danhsachhanghoa]    Script Date: 4/7/2023 12:05:13 AM ******/
CREATE DATABASE [danhsachhanghoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'danhsachhanghoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\danhsachhanghoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'danhsachhanghoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\danhsachhanghoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [danhsachhanghoa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [danhsachhanghoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [danhsachhanghoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [danhsachhanghoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [danhsachhanghoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [danhsachhanghoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [danhsachhanghoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [danhsachhanghoa] SET  MULTI_USER 
GO
ALTER DATABASE [danhsachhanghoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [danhsachhanghoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [danhsachhanghoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [danhsachhanghoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [danhsachhanghoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [danhsachhanghoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [danhsachhanghoa] SET QUERY_STORE = ON
GO
ALTER DATABASE [danhsachhanghoa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [danhsachhanghoa]
GO
/****** Object:  Table [dbo].[hanghoa]    Script Date: 4/7/2023 12:05:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hanghoa](
	[MaSP] [nvarchar](50) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MaDM] [nvarchar](50) NULL,
	[NgaySX] [nvarchar](50) NULL,
	[Mota] [nvarchar](max) NULL,
	[Donvi] [nvarchar](50) NULL,
	[Hinhanh] [nvarchar](max) NULL,
	[Soluong] [int] NULL,
	[Dongia] [float] NULL,
	[Theloai] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roless]    Script Date: 4/7/2023 12:05:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roless](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roless] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/7/2023 12:05:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[Matkhau] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[hanghoa] ([MaSP], [TenSP], [MaDM], [NgaySX], [Mota], [Donvi], [Hinhanh], [Soluong], [Dongia], [Theloai]) VALUES (N'01', N'Note20Utral', N'001', N'22/02/2023', N'Trong nhà em nuổi rất nhiều loài vật nhưng thông minh và gắn bó với em nhất là chú chó Lu Lu. Lu Lu được mua về nhà em từ hồi còn bé xíu, tính đên nay cũng 2 tuổi. Lúc mới về nhà, chắc vừa phải xa mẹ nên chú cún nhút nhát vô cùng, ai cho gì ăn nấy chỉ quanh quẩn nơi góc bếp chứ chẳng dám chạy nhảy hay đi đâu. Sau một thời gian quen dần với mọi người trong gia đình thì Lu Lu bắt đầu dạn dĩ hơn. Lu Lu có một bộ lông vàng óng, em cũng không biết nó thuộc giống chó gì. Lu Lu nặng tầm khoảng 15 kg, đối với người trong nhà rất hiền lành nhưng đối với khách lạ thì rất dữ tợn. Hàm răng chú trắng bóng, sắc lẻm, cái lưỡi hồng hồng suốt ngày thè ra thở. Đôi tai thính cứ có tiếng động lạ là lại vểnh lên. Chiếc đuôi cong cong ngoáy tít lên mỗi khi em xoa đầu hoặc chơi đùa với nó. Lu Lu rất thông minh, chuyện gì cũng dạy một lát là hiểu. Lu Lu biết đi vệ sinh đúng chỗ, không bao giờ bước chân vào nhà, bao giờ cũng đợi người cho ăn mới ăn chứ không khi nào ăn vụng. Không những thế Lu Lu còn biết đi bằng hai chân như một chú chó trong rạp xiếc. Trong nhà em không khi nào có chuột bởi Lu Lu bắt chuột rất tài, lũ chuột phá phách vậy mà không bao giờ dám bén mảng đến gần. Đêm đến, khi cả gia đình ngủ say thì Lu Lu lại âm thầm thức canh cho giấc ngủ của mọi người. Cả nhà em ai cũng yêu quý Lu Lu, coi nó như là một thành viên không thể thiếu của gia đình.', N'Chiếc', N'hehe.jpg', 1, 26000000, N'PC')
INSERT [dbo].[hanghoa] ([MaSP], [TenSP], [MaDM], [NgaySX], [Mota], [Donvi], [Hinhanh], [Soluong], [Dongia], [Theloai]) VALUES (N'02', N'Note10plus', N'001', N'11/02/2012', N'đã qua sử dụng', N'Chiếc', N'reading_by_wlop_ddjjp86-pre.jpg', 1, 9000000, N'LAPTOP')
INSERT [dbo].[hanghoa] ([MaSP], [TenSP], [MaDM], [NgaySX], [Mota], [Donvi], [Hinhanh], [Soluong], [Dongia], [Theloai]) VALUES (N'03', N'Note10plus', N'001', N'22/02/2008', N'he', N'Chiếc', N'hehe.jpg', 2, 9900000, N'TABLET')
INSERT [dbo].[hanghoa] ([MaSP], [TenSP], [MaDM], [NgaySX], [Mota], [Donvi], [Hinhanh], [Soluong], [Dongia], [Theloai]) VALUES (N'04', N'Note20Utral', N'001', N'01/01/0001', N'ut', N'Chiếc', N'rồn lùa.png', 4, 200000, N'OTHER')
INSERT [dbo].[hanghoa] ([MaSP], [TenSP], [MaDM], [NgaySX], [Mota], [Donvi], [Hinhanh], [Soluong], [Dongia], [Theloai]) VALUES (N'05', N'Note10plus', N'001', N'01/01/0001', N'sdf', N'Chiếc', N'hehe.jpg', 4, 8000, N'PC')
GO
INSERT [dbo].[Roless] ([RoleId], [RoleName]) VALUES (1, N'Amin')
INSERT [dbo].[Roless] ([RoleId], [RoleName]) VALUES (2, N'User')
GO
INSERT [dbo].[Users] ([UserID], [Hoten], [TaiKhoan], [Matkhau], [RoleId]) VALUES (1, N'huong', N'huong', N'123', 1)
INSERT [dbo].[Users] ([UserID], [Hoten], [TaiKhoan], [Matkhau], [RoleId]) VALUES (2, N'huy', N'huy', N'123', 2)
INSERT [dbo].[Users] ([UserID], [Hoten], [TaiKhoan], [Matkhau], [RoleId]) VALUES (3, N'Admin', N'Admin', N'1', 1)
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roless] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roless] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roless]
GO
USE [master]
GO
ALTER DATABASE [danhsachhanghoa] SET  READ_WRITE 
GO
