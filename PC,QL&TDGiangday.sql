Create database QL_PCvaTDgiangday
go
Use QL_PCvaTDgiangday
go
Create table BOMON
(
	MABM nvarchar(10) primary key,
	TENBM nvarchar(50) unique,
	SOGV int,
	MAChunhiem nvarchar(10)
)
go
create table GIAOVIEN
(
	MAGV nvarchar(10) primary key,
	TENGV nvarchar(50),
	NGAYSINH Date default (getdate()),
	SDT char(11),
	DIACHI nvarchar(50),
	MABM nvarchar(10) references BOMON(MABM)
)
go
create table CHUCDANH
(
	MACD nvarchar(10) primary key,
	TENCD nvarchar(50),
	DMGIANGDAY int
)
go
create table CHUCVU
(
	MACV nvarchar(10) Primary key,
	TENCV nvarchar(50),
	HESOGIAMTAI int
)
go
create table KYHOC
(
	MAGV nvarchar(10) references GIAOVIEN(MAGV),
	MACD nvarchar(10) references CHUCDANH(MACD),
	MACV nvarchar(10) references CHUCVU(MACV),
	TENKY nvarchar(50),
	primary key (MAGV, MACD, MACV)
)
go
create table MONHOC
(
	MAMH nvarchar(10) Primary key,
	TENMH nvarchar(50) unique,
	MABM nvarchar(10) references BOMON(MABM)
)
go
create table HOCPHAN
(
	MAHP nvarchar(10) primary key,
	TENHP nvarchar(50),
	SOTC int,
	SOTIET int,
	MAMH nvarchar(10) references MONHOC(MAMH)
)
go
create table TRINHDODT
(
	MATD nvarchar(10) primary key,
	TENTD nvarchar(50),
)
go
create table HEDAOTAO
(
	MAHEDT nvarchar(10) primary key,
	TENHEDT nvarchar(50),
)
go
create table LOPHOCPHAN
(
	MALOP nvarchar(10) primary key,
	TENLOP nvarchar(50),
	QUANSO int,
	NGONNGUGD nvarchar(50),
	MAHP nvarchar(10) references HOCPHAN(MAHP),
	MATD nvarchar(10) references TRINHDODT(MATD),
	MAHEDT nvarchar(10) references HEDAOTAO(MAHEDT)
)
go
create table PHANCONG
(
	ID int IDENTITY(1,1) primary key,
	MALOP nvarchar(10) references LOPHOCPHAN(MALOP),
	MAGV1 nvarchar(10) references GIAOVIEN(MAGV),
	MAGV2 nvarchar(10),
	KYHOC nvarchar(50), 
	NAMHOC nvarchar(50),
	KIPHOC nvarchar(20),
	DIADIEM nvarchar(50),
	SOTIET int
)
--Alter table PHANCONG add KYHOC nvarchar(50), NAMHOC nvarchar(50)
go
create table THOIKHOABIEU
(
	MALOP nvarchar(10) references LOPHOCPHAN(MALOP),
	THU nvarchar(20),
	TUAN nvarchar(20),
	KIPHOC nvarchar(20),
	TIET char(10)
)
INSERT INTO BOMON VALUES
			('BM01',N'Toán',0,'GV001'),
			('BM02',N'Công nghệ mạng',0,'GV007'),
			('BM03',N'Khoa học máy tính',0,'GV011'),
			('BM04',N'Hệ thống thông tin',0,'GV017'),
			('BM05',N'Công nghệ phần mềm',0,'GV024'),
			('BM06',N'An toàn thông tin',0,'GV031')
go
--thêm Giáo viên--
INSERT INTO GIAOVIEN VALUES
('GV001',N'Tạ Ngọc Ánh','19810919','0913006814',N'Bắc Từ Liêm, Hà Nội','BM01'),
('GV002',N'Hy Đức Mạnh','19801102','0985167999',N'Tây Hồ, Hà Nội','BM01'),
('GV003',N'Phan Thu Hà','19701105','0985193986',N'Thnah Xuân, Hà Nội','BM01'),
('GV004',N'Phạm Thế Anh','19810415','0983013340',N'Bắc Từ Liêm, Hà Nội','BM01'),
('GV005',N'Nguyễn Văn Hồng','19661021','0912088334',N'Cầu Giấy,Hà Nội','BM01'),
('GV006',N'Đỗ Anh Tuấn','19810815','0976115380',N'Long Biên, Hà Nội','BM01'),
('GV007',N'Tạ Minh Thanh','19800110','0986007979', N'Bắc Từ Liêm, Hà Nội','BM02'),
('GV008',N'Lưu Hồng Dũng','19660827','0906000013',N'Cầu Giấy, Hà Nội','BM02'),
('GV009',N'Nguyễn Quang Uy','19800304','0968490399', N'Bắc Từ Liêm, Hà Nội','BM02'),
('GV010',N'Nguyễn Trung Thành','19830201','0988903198', N'Bắc Từ Liêm, Hà Nội','BM02'),
('GV011',N'Ngô Hữu Phúc','19760625','0913006814',N'Tây Hồ, Hà Nội','BM03'),
('GV012',N'Hà Chí Trung','19790516','0168558202',N'Khu Tập Thế HVKTQS','BM03'),
('GV013',N'Vi BẢo Ngọc','19851121','0983408885',N'Khu tập thể 212','BM03'),
('GV014',N'Phan Thị Hải Hồng','19841003','0984725552',N'Đông Anh, Hà Nội','BM03'),
('GV015',N'Dương Thị Minh Soan','19860613','0983588613', N'Khu Tập Thế HVKTQS','BM03'),
('GV016',N'Nguyễn Trung Tín','19830603','0963983602',N'Đống Đa, Hà Nội','BM03'),
('GV017',N'Hoa Tất Thắng','19790611','01233936886',N'Nam Từ Liêm, Hà Nội','BM04'),
('GV018',N'Tống Minh Đức','19760122','0984485888', N'Nam Từ Liêm, Hà Nội','BM04'),
('GV019',N'Nguyễn Hoài Anh','19770713','045521038',N'Thanh Xuân, Hà Nội','BM04'),
('GV020',N'Nguyễn Mậu Uyên','19780810','0983602237',N'Bắc Từ Liêm, Hà Nội','BM04'),
('GV021',N'Nguyễn Văn Giang','19811018','0968290551', N'Tập thể 361, HVKTQS','BM04'),
('GV022',N'Đỗ Thị Mai Hường','19791010','0983366922',N'Nam Từ Liêm, Hà Nội','BM04'),
('GV023',N'Trần Văn An','19851130','0965853399',N'Hà Nội','BM04'),
('GV024',N'Phan Nguyên Hải','19790613','0984709262',N'Cầu Giấy, Hà Nội','BM05'),
('GV025',N'Bùi Thu Lâm','19750903','0968699975', N'Nam Từ Liêm, Hà Nội','BM05'),
('GV026',N'Nguyễn Quốc Khánh','19830902','0962393883',N'Tây Hồ, Hà Nội','BM05'),
('GV027',N'Phạm Văn Việt','19790525','01279858755',N'Thanh Xuân, Hà Nội','BM05'),
('GV028',N'Nguyễn Thị Hiền','19781029','0912092486', N'Tập thể 212, HVKTQS','BM05'),
('GV029',N'Cao Tuấn Anh','19860102','0963065936',N'Tập thể 212, HVKTQS','BM05'),
('GV030',N'Dương Thị Liên','19760707','0914821912',N'Hoàng Mai, Hà Nội','BM05'),
('GV031',N'Trần Nguyên Ngọc','19790522','0948435163',N'Hà Đông, Hà Nội','BM06'),
('GV032',N'Hoàng Tuấn Hảo','19770310','0903410101', N'Đống Đa, Hà Nội','BM06'),
('GV033',N'Nguyễn Việt Hùng','19811129','0912071428',N'Cầu Giấy, Hà Nội','BM06'),
('GV034',N'Nguyễn Hữu Nội','19870715','0962631881',N'Sông Lô, Vĩnh Phúc','BM06'),
('GV035',N'Trần Hồng Quang','19781201','0913096677', N'Hai Bà Trưng, Hà Nội','BM06'),
('GV036',N'Nguyễn Văn Quân','19870827','0972822871',N'Tập thể 212, HVKTQS','BM06'),
('GV037',N'Phạm Trường Sơn','19871017','0988171087',N'Từ Liêm, Hà Nội','BM06')

INSERT INTO CHUCVU VALUES('CV01',N'Chủ nhiệm khoa',80),
						('CV02',N'Phó chủ nhiệm khoa',60),
						('CV03',N'Chủ nhiệm bộ môn',50),
						('CV04',N'Phó chủ nhiệm bộ môn',60),
						('CV05',N'Giáo vụ khoa',60),
						('CV06',N'Trưởng phòng thí nghiệm',60),
						('CV07',N'Thư ký bộ môn',60),
						('CV08',N'Bí thư đảng ủy',60),
						('CV09',N'Phó bí thư đảng ủy',60),
						('CV10',N'Bí thư Chi bộ',60),
						('CV11',N'Phó bí thư chi bộ',60),
						('CV12','Không chức vụ',0)
go
INSERT INTO CHUCDANH VALUES('CD01',N'Giáo sư',60),
						('CD02',N'Phó giáo sư',50),
						('CD03',N'Giảng viên chính/TS-GV',50),
						('CD04',N'Giảng viên/TS-TG',50),
						('CD05',N'Trợ giảng',11)
go
INSERT INTO KYHOC VALUES 
('GV025','CD02','CV01',N'Học kỳ 1 năm học 2017-2018'),
('GV018','CD03','CV02',N'Học kỳ 1 năm học 2017-2018'),
('GV031','CD03','CV03',N'Học kỳ 1 năm học 2017-2018'),
('GV001','CD03','CV03',N'Học kỳ 1 năm học 2017-2018'),
('GV007','CD03','CV03',N'Học kỳ 1 năm học 2017-2018'),
('GV011','CD03','CV03',N'Học kỳ 1 năm học 2017-2018'),
('GV017','CD03','CV03',N'Học kỳ 1 năm học 2017-2018'),
('GV024','CD03','CV03',N'Học kỳ 1 năm học 2017-2018'),
('GV002','CD03','CV04',N'Học kỳ 1 năm học 2017-2018'),
('GV021','CD03','CV04',N'Học kỳ 1 năm học 2017-2018'),
('GV026','CD03','CV04',N'Học kỳ 1 năm học 2017-2018'),
('GV033','CD03','CV04',N'Học kỳ 1 năm học 2017-2018'),
('GV010','CD03','CV06',N'Học kỳ 1 năm học 2017-2018'),
('GV026','CD03','CV06',N'Học kỳ 1 năm học 2017-2018'),
('GV032','CD03','CV06',N'Học kỳ 1 năm học 2017-2018'),
('GV025','CD02','CV08',N'Học kỳ 1 năm học 2017-2018'),
('GV018','CD03','CV09',N'Học kỳ 1 năm học 2017-2018'),
('GV031','CD03','CV10',N'Học kỳ 1 năm học 2017-2018'),
('GV001','CD03','CV10',N'Học kỳ 1 năm học 2017-2018'),
('GV007','CD03','CV10',N'Học kỳ 1 năm học 2017-2018'),
('GV011','CD03','CV10',N'Học kỳ 1 năm học 2017-2018'),
('GV017','CD03','CV10',N'Học kỳ 1 năm học 2017-2018'),
('GV024','CD03','CV10',N'Học kỳ 1 năm học 2017-2018'),
('GV002','CD03','CV11',N'Học kỳ 1 năm học 2017-2018'),
('GV021','CD03','CV11',N'Học kỳ 1 năm học 2017-2018'),
('GV026','CD03','CV11',N'Học kỳ 1 năm học 2017-2018'),
('GV033','CD03','CV11',N'Học kỳ 1 năm học 2017-2018'),
('GV003','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV004','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV005','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV006','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV008','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV009','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV012','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV013','CD04','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV014','CD04','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV015','CD04','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV016','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV019','CD04','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV020','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV022','CD04','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV023','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV027','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV028','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV029','CD05','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV034','CD05','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV035','CD03','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV036','CD05','CV12',N'Học kỳ 1 năm học 2017-2018'),
('GV037','CD04','CV12',N'Học kỳ 1 năm học 2017-2018')

--thêm Môn học--
INSERT INTO MONHOC VALUES
('MH01',N'Toán chuyên đề','BM01'),
('MH02',N'Giải tích','BM01'),
('MH03',N'Hình giải tích và đại số tuyến tính','BM01'),
('MH04',N'Toán cao cấp','BM01'),
('MH05',N'Lý thuyết xác suất thống kê','BM01'),
('MH06',N'Toán sơ cấp','BM01'),
('MH07',N'Lý thuyết hệ điều hành','BM03'),
('MH08',N'Toán rời rạc','BM03'),
('MH09',N'Đồ họa máy tính','BM03'),
('MH10',N'Lập trình cơ bản','BM03'),
('MH11',N'Ngôn ngữ XML+BTL','BM03'),
('MH12',N'Ngôn ngữ lập trình','BM03'),
('MH13',N'Lập trình trò chơi và mô phỏng','BM03'),
('MH14',N'Công nghệ đa phương tiện','BM03'),
('MH15',N'Cơ bản về điện toán đám mây','BM04'),
('MH16',N'Phân tích và thiết kế hệ thống','BM04'),
('MH17',N'Cơ sở dữ liệu','BM04'),
('MH18',N'Công nghệ web','BM04'),
('MH19',N'Tương tác người máy','BM04'),
('MH20',N'Lập trình cho các thiết bị di động','BM04'),
('MH21',N'Quản trị các hệ thống thông tin','BM04'),
('MH22',N'Kỹ thuật lập trình','BM04'),
('MH23',N'Nhập môn HTML và thiết kế web','BM04'),
('MH24',N'Công nghệ mạng máy tính','BM04'),
('MH25',N'Dịch vụ mạng','BM04'),
('MH26',N'Quản trị mạng','BM02'),
('MH27',N'Mạng máy tính','BM02'),
('MH28',N'Xây dựng, quản trị và bảo trì hệ thống','BM02'),
('MH29',N'Kỹ thuật liên mạng','BM02'),
('MH30',N'Lý thuyết thông tin','BM02'),
('MH31',N'Truyền dữ liệu','BM02'),
('MH32',N'Thiết kệ mạng','BM02'),
('MH33',N'Thực tập công nghiệp','BM02'),
('MH34',N'Tiếng Anh chuyên ngành','BM02'),
('MH35',N'Phát triển phần mềm di động','BM05'),
('MH36',N'Công nghệ phần mềm','BM05'),
('MH37',N'Lập trình hướng đối tượng','BM05'),
('MH38',N'Lập tình nâng cao','BM05'),
('MH39',N'Công nghệ lập trình tích hợp','BM05'),
('MH40',N'Thiết kế và xây dựng phần mềm','BM05'),
('MH41',N'Thiết kế giao diện người sử dụng','BM05'),
('MH42',N'Phân tích và mô hình hóa phần mềm','BM05'),
('MH43',N'Lập trình Adroid','BM05'),
('MH44',N'Lập tình ứng dụng Windows Form với C#','BM05'),
('MH45',N'Lập trình nhúng','BM05'),
('MH46',N'Lập trình phần mềm an toàn','BM06'),
('MH47',N'An ninh mạng','BM06'),
('MH48',N'Đảm bảo và an toàn thông tin','BM06'),
('MH49',N'Mã hóa','BM06'),
('MH50',N'Lập trình hợp ngữ','BM06')
go

--thêm học phần--
INSERT INTO HOCPHAN VALUES
('HP01',N'Toán chuyên đề',3,45,'MH01'),
('HP02',N'Giải tích 2',4,75,'MH02'),
('HP03',N'Hình giải tích và đại số tuyến tính',3,60,'MH03'),
('HP04',N'Giải tích 1',4,75,'MH02'),
('HP05',N'Lý thuyết xác suất thống kê',3,60,'MH05'),
('HP06',N'Toán sơ cấp',5,90,'MH06'),
('HP07',N'Lý thuyết hệ điều hành',3,45,'MH07'),
('HP08',N'Toán rời rạc',3,60,'MH08'),
('HP09',N'Đồ họa máy tính',3,60,'MH09'),
('HP10',N'Lập trình cơ bản',3,60,'MH10'),
('HP11',N'Ngôn ngữ XML+BTL',3,60,'MH11'),
('HP12',N'Ngôn ngữ lập trình 1',2,45,'MH12'),
('HP13',N'Lập trình trò chơi và mô phỏng',3,60,'MH13'),
('HP14',N'Công nghệ đa phương tiện',3,60,'MH14'),
('HP15',N'Cơ bản về điện toán đám mây',3,60,'MH15'),
('HP16',N'Phân tích và thiết kế giải thuật',3,60,'MH16'),
('HP17',N'Cơ sở dữ liệu',4,75,'MH17'),
('HP18',N'Công nghệ web',2,45,'MH18'),
('HP19',N'Tương tác người máy',2,30,'MH19'),
('HP20',N'Lập trình cho các thiết bị di động',3,60,'MH20'),
('HP21',N'Quản trị các hệ thống thông tin',3,60,'MH21'),
('HP22',N'Kỹ thuật lập trình',3,60,'MH22'),
('HP23',N'Nhập môn HTML và thiết kế web',2,45,'MH23'),
('HP24',N'Công nghệ mạng máy tính',3,60,'MH24'),
('HP25',N'Dịch vụ mạng',2,45,'MH25'),
('HP26',N'Quản trị mạng',3,60,'MH26'),
('HP27',N'Mạng máy tính',3,60,'MH27'),
('HP28',N'Xây dựng, quản trị và bảo trì hệ thống',2,60,'MH28'),
('HP29',N'Kỹ thuật liên mạng',3,60,'MH29'),
('HP32',N'Thiết kệ mạng',3,60,'MH32'),
('HP30',N'Lý thuyết thông tin',3,60,'MH30'),
('HP31',N'Truyền dữ liệu',3,60,'MH31'),
('HP33',N'Thực tập công nghiệp',2,90,'MH33'),
('HP34',N'Tiếng Anh chuyên ngành',1,30,'MH34'),
('HP35',N'Phát triển phần mềm di động',3,60,'MH35'),
('HP36',N'Công nghệ phần mềm',3,45,'MH36'),
('HP37',N'Lập trình hướng đối tượng',3,60,'MH37'),
('HP38',N'Lập tình nâng cao',3,60,'MH38'),
('HP39',N'Ngôn ngữ lập trình 2',2,45,'MH12'),
('HP40',N'Công nghệ lập trình tích hợp',3,60,'MH39'),
('HP41',N'Thiết kế và xây dựng phần mềm',3,60,'MH40'),
('HP42',N'Thiết kế giao diện người sử dụng',3,60,'MH41'),
('HP43',N'Phân tích và mô hình hóa phần mềm',3,60,'MH42'),
('HP44',N'Lập trình Adroid',3,60,'MH43'),
('HP45',N'Lập tình ứng dụng Windows Form với C#',3,60,'MH44'),
('HP46',N'Lập trình nhúng',3,60,'MH45'),
('HP47',N'Lập trình phần mềm an toàn',3,60,'MH46'),
('HP48',N'An ninh mạng',3,60,'MH47'),
('HP49',N'Đảm bảo và an toàn thông tin',3,45,'MH48'),
('HP50',N'Mã hóa',3,60,'MH49'),
('HP51',N'Lập trình hợp ngữ',2,60,'MH50')


--thêm lớp học phần--
INSERT INTO LOPHOCPHAN VALUES
('LOP001',N'ĐTVT15',56,N'Tiếng Việt','HP01','TD03','HE02'),
('LOP002',N'KTĐK15',65,N'Tiếng Việt','HP01','TD02','HE01'),
('LOP003',N'CNTT52,BDDATTT52,ANHTTT52',40,N'Tiếng Việt','HP02','TD03','HE02'),
('LOP004',N'VK52,DDA52,GCAL52',76,N'Tiếng Việt','HP02','TD03','HE02'),
('LOP005',N'KSDS16',45,N'Tiếng Việt','HP03','TD02','HE01'),
('LOP006',N'KSDS16-1',47,N'Tiếng Việt','HP04','TD02','HE01'),
('LOP007',N'KSDS16-2',54,N'Tiếng Việt','HP04','TD03','HE01'),
('LOP008',N'KHMT15',61,N'Tiếng Việt','HP05','TD02','HE01'),
('LOP009',N'VB2CTQP-K7',43,N'Tiếng Việt','HP05','TD03','HE04'),
('LOP010',N'KTĐK52',35,N'Tiếng Việt','HP05','TD03','HE02'),
('LOP011',N'DKLAO53,DKCPC53',38,N'Tiếng Việt','HP06','TD03','HE03'),
('LOP012',N'LTVK-Đ34',76,N'Tiếng Việt','HP04','TD02','HE04'),	
('LOP013',N'CNTT51,BDDATTT51,ANHTTT51',56,N'Tiếng Anh','HP07','TD03','HE02'),
('LOP014',N'KHMT14',62,N'Tiếng Anh','HP07','TD02','HE01'),
('LOP015', N'CNTT51,BDDATTT51,ANHTTT51',56,N'Tiếng Việt','HP08','TD03','HE02'),
('LOP016',N'TH(L)51,TH(C)51',35,N'Tiếng Việt','HP08','TD02','HE03'),
('LOP017',N'ĐPT13',39,N'Tiếng Anh','HP09','TD02','HE01'),
('LOP018',N'KSDS16',48,N'Tiếng Việt','HP10','TD03','HE01'),
('LOP019',N'OTOQS52,XMCB52',45,N'Tiếng Việt','HP10','TD03','HE02'),
('LOP020',N'TT52,TLPK52,TLHQ52',46,N'Tiếng Việt','HP10','TD03','HE02'),
('LOP021',N'CĐTH18',55,N'Tiếng Việt','HP11','TD01','HE02'),
('LOP022',N'ĐTVT14',75,N'Tiếng Việt','HP12','TD03','HE01'),
('LOP023',N'ĐTYS14',36,N'Tiếng Việt','HP12','TD03','HE01'),
('LOP024',N'TĐH14',41,N'Tiếng Việt','HP12','TD03','HE01'),
('LOP025',N'ĐPT13',39,N'Tiếng Anh','HP13','TD02','HE01'),
('LOP026',N'ĐPT13',39,N'Tiếng Anh','HP14','TD02','HE01'),
('LOP027',N'HTTT12',84,N'Tiếng Việt','HP15','TD03','HE01'),
('LOP028',N'ĐPT13',39,N'Tiếng Anh','HP16','TD02','HE01'),
('LOP029',N'HTTT13',45,N'Tiếng Anh','HP16','TD03','HE01'),	
('LOP030',N'KHMT14',67,N'Tiếng Việt','HP17','TD03','HE01'),
('LOP031',N'CĐTH17',54,N'Tiếng Anh','HP18','TD01','HE02'),
('LOP032',N'BDDATTT50,TH50',36,N'Tiếng Anh','HP18','TD03','HE02'),
('LOP033', N'BDDATTT50,TH50',36,N'Tiếng Anh','HP19','TD03','HE02'),
('LOP034',N'HTTT12',84,N'Tiếng Việt','HP20','TD03','HE01'),
('LOP035',N'HTTT13',45,N'Tiếng Việt','HP21','TD03','HE01'),
('LOP036',N'TH15',80,N'Tiếng Việt','HP22','TD03','HE01'),
('LOP037',N'CĐTH18',30,N'Tiếng Việt','HP23','TD01','HE01'),
('LOP038',N'TH49',20,N'Tiếng Việt','HP26','TD03','HE02'),
('LOP039', N'CNTT51,BDDATTT51,ANHTTT51,DTH51',56,N'Tiếng Việt','HP27','TD03','HE02'),
('LOP040',N' TH(L)51, TH(C)51, ĐTH(C)51',24,N'Tiếng Việt','HP27','TD02','HE03'),
('LOP041',N' BĐATTT50, TH50, TH(L)50',36,N'Tiếng Việt','HP28','TD02','HE03'),
('LOP042',N' ATTT13',45,N'Tiếng Anh','HP29','TD02','HE01'),
('LOP043',N'MMT14',81,N'Tiếng Anh','HP30','TD02','HE01'),
('LOP044',N'KSDS16-1',100,N'Tiếng Việt','HP10','TD03','HE01'),
('LOP045',N'TH15',20,N'Tiếng Việt','HP12','TD02','HE01'),
('LOP046', N'HTTT15',56,N'Tiếng Việt','HP12','TD02','HE01'),
('LOP047',N'VB2CNTT-K6',24,N'Tiếng Việt','HP29','TD02','HE04'),
('LOP048',N'VB2CNTT-K6',36,N'Tiếng Việt','HP31','TD02','HE04'),
('LOP049',N'VB2CNTT-K6 ',45, N'Tiếng Việt','HP26','TD02','HE04'),
('LOP050',N'VB2CNTT-K6',81, N'Tiếng Việt','HP32','TD02','HE04'),
('LOP051',N'VB2CNTT-K6',81, N'Tiếng Việt','HP33','TD02','HE04'),
('LOP052',N'OTOQS52, XMCB52, TTG52, MT52',78, N'Tiếng Việt','HP30','TD03','HE02'),
('LOP053',N'TH49',20,N'Tiếng Anh','HP34','TD03','HE02'),
('LOP054',N'CNPM12',33,N'Tiếng Anh','HP35','TD02','HE04'),
('LOP055',N'BĐATTT50, TH50, TH(L)50',36,N'Tiếng Việt','HP36','TD02','HE03'),
('LOP056',N'CNTT51, BĐATTT51, ANHTTT51, ĐTH51',56,N'Tiếng Việt','HP37','TD03','HE02'),
('LOP057',N'TH(L)51, TH(C)51, ĐTH(C)51',24,N'Tiếng Việt','HP37','TD02','HE03'),
('LOP058',N'KHMT14',67,N'Tiếng Anh','HP38','TD02','HE01'),
('LOP059',N'MMT14',81,N'Tiếng Anh','HP38','TD02','HE01'),	
('LOP060',N'CĐTH18',30,N'Tiếng Anh','HP39','TD02','HE01'),
('LOP061',N'BĐATTT50, TH50, TH(L)50',36,N'Tiếng Anh','HP45','TD03','HE02'),
('LOP062',N'CNPM13',45,N'Tiếng Anh','HP33','TD02','HE01'),
('LOP063',N'ĐPT13',45,N'Tiếng Anh','HP40','TD02','HE01'),
('LOP064',N'ATTT13',45,N'Tiếng Anh','HP40','TD02','HE01'),
('LOP065',N'HTTT13',45,N'Tiếng Anh','HP40','TD02','HE01'),
('LOP066',N'TH49',20,N'Tiếng Anh','HP40','TD03','HE02'),
('LOP067',N'CNPM13',45,N'Tiếng Anh','HP41','TD03','HE01'),
('LOP068',N'CNPM13',45,N'Tiếng Anh','HP42','TD03','HE01'),
('LOP069',N'CNPM13',45,N'Tiếng Anh','HP16','TD03','HE01'),
('LOP070',N'CĐTH17',54,N'Tiếng Anh','HP44','TD01','HE04'),
('LOP071',N'CĐTH17',54,N'Tiếng Anh','HP45','TD01','HE04'),
('LOP072',N'ATTT13',45,N'Tiếng Việt','HP47','TD02','HE01'),
('LOP073',N'CNTPM12',33,N'Tiếng Việt','HP47','TD02','HE01'),
('LOP074',N'ATTT13',45,N'Tiếng Việt','HP48','TD02','HE01'), 
('LOP075',N'TH49',20,N'Tiếng Việt','HP48','TD03','HE02'),
('LOP076',N'HTTT14',83,N'Tiếng Việt','HP49','TD02','HE01'),
('LOP077',N'KTPM14',76,N'Tiếng Việt','HP49','TD02','HE01'),
('LOP078',N'CNTT14',96,N'Tiếng Việt','HP49','TD02','HE01'),
('LOP079',N'KHMT14',67,N'Tiếng Việt','HP49','TD02','HE01'), 
('LOP080',N'CĐTH17',54,N'Tiếng Việt','HP49','TD01','HE04'),
('LOP081',N'ATTT13',45,N'Tiếng Việt','HP49','TD02','HE01'),
('LOP082',N'VB2CNTT-K6',11,N'Tiếng Việt','HP50','TD02','HE04'),
('LOP083',N'TH51',56,N'Tiếng Việt','HP51','TD03','HE02')

insert into TRINHDODT
values ('TD01',N'Đại học'),
		('TD02',N'Cao đẳng'),
		('TD03',N'Cao học'),
		('TD04',N'Nghiên cứu sinh'),
		('TD05',N'Cử nhân'),
		('TD06',N'Trung cấp')
insert into HEDAOTAO values
	('HE02',N'Quân sự dài hạn'),
	('HE01',N'Dân sự'),
	('HE03',N'Quốc tế'),
	('HE04',N'VB2 - Cao đẳng')
--thêm thời khóa biểu--

INSERT INTO THOIKHOABIEU VALUES
('GV004','LOP01',3,'20180401 7:00','H3-508'),
('GV002','LOP02',4,'20180401 14:10','H3-508'),
('GV005','LOP03',3,'20180402 12:30','H3-408'),
('GV004','LOP04',3,'20180402 15:00','H3-508'),
('GV006','LOP05',3,'20180403 8:40','H5-403'),
('GV007','LOP06',3,'20180403 14:10','H9-508'),
('GV001','LOP07',3,'20180404 7:50','H3-508'),
('GV002','LOP08',4,'20180401 12:30','H3-508'),
('GV006','LOP09',4,'20180401 7:00',N'Phòng thực hành')
--liệt kê các địa điểm học
select distinct DIADIEM from THOIKHOABIEU
--cho biết tên các lớp học phần học ở H3-508
select TENLOP
from LOPHOCPHAN lop, THOIKHOABIEU
where lop.MALOP=THOIKHOABIEU.MALOP and DIADIEM=N'H3-508'
-- Cho biết mã giáo viên và tên giáo viên dạy lớp có mã LOP03
select gv.MAGV, TENGV
from GIAOVIEN gv, THOIKHOABIEU tkb
where gv.MAGV=tkb.MAGV and tkb.MALOP='LOP03'

------------------------///////////BỘ MÔN////---
--Tìm kiếm Bộ môn theo mã bộ môn--
go
create proc SearchBMma (@ten nvarchar(10))
as
begin
select * from BOMON where MABM like '%'+@ten+'%'
end
--Tìm kiếm Bộ môn theo tên--
go
create proc SearchBMten (@ten nvarchar(50))
as
begin
select * from BOMON where TENBM like '%'+@ten+'%'
end
--Ham them bo mon--
go
create proc ThemBM (@ma nvarchar(10), @ten nvarchar(100), @sogv int, @macn nvarchar(10))
as
begin
insert into BOMON values (@ma,@ten,@sogv,@macn)
end
--Hàm sửa bộ môn--
go
create proc SuaBM (@ma nvarchar(10), @ten nvarchar(50), @sogv int, @macn nvarchar(10))
as
begin
update BOMON
set TENBM=@ten,SOGV=@sogv,MAChunhiem=@macn
where MABM=@ma
end
--Hàm xóa Bộ môn
go
Create proc XoaBM(@ma nvarchar(10))
as
begin
delete BOMON where MABM=@ma
end
---------------------/////////GIÁO VIÊN//////
go
create proc SearchGVma (@ten nvarchar(10))
as
begin
select * from GIAOVIEN where MAGV like '%'+@ten+'%'
end
--Tìm kiếm giáo viên theo tên--
go
create proc SearchGVten (@ten nvarchar(50))
as
begin
select * from GIAOVIEN where TENGV like '%'+@ten+'%'
end
--Hàm thêm giáo viên--
go
create proc ThemGV (@ma nvarchar(10), @ten nvarchar(50), @ngaysinh date, @sdt char(11), @diachi nvarchar(50), @mabm nvarchar(10))
as
begin
insert into GIAOVIEN values (@ma,@ten,@ngaysinh,@sdt,@diachi,@mabm)
end
--Hàm sửa giáo viên--
go
create proc SuaGV (@ma nvarchar(10), @ten nvarchar(50), @ngaysinh date, @sdt char(11), @diachi nvarchar(50), @mabm nvarchar(10))
as
begin
update GIAOVIEN
set TENGV=@ten, NGAYSINH=@ngaysinh,SDT=@sdt,DIACHI=@diachi,MABM=@mabm
where MAGV=@ma
end
--Hàm xóa giáo viên
go
Create proc XoaGV(@ma nvarchar(10))
as
begin
delete GIAOVIEN where MAGV=@ma
end
---------------///////MÔN HỌC///////---
--Hàm thêm môn học--
go
create proc ThemMH (@ma nvarchar(10), @ten nvarchar(50) , @mabm nvarchar(10))
as
begin
insert into MONHOC values (@ma,@ten,@mabm)
end
--Hàm sửa môn học--
go
create proc SuaMH (@ma nvarchar(10), @ten nvarchar(50), @mabm nvarchar(10))
as
begin
update MONHOC
set TENMH=@ten,MABM=@mabm
where MAMH=@ma
end
--Hàm xóa môn học
go
Create proc XoaMH(@ma nvarchar(10))
as
begin
delete MONHOC where MAMH=@ma
end
----------///////HỌC PHẦN/////----
go
create proc SearchHPma (@ten nvarchar(10))
as
begin
select * from HOCPHAN where MAHP like '%'+@ten+'%'
end
--Tìm kiếm Học phần theo tên--
go
create proc SearchHPten (@ten nvarchar(50))
as
begin
select * from HOCPHAN where TENHP like '%'+@ten+'%'
end
--Ham them học phần--
go
create proc ThemHP (@ma nvarchar(10), @ten nvarchar(100), @sotc int, @sotiet int, @mamh nvarchar(10))
as
begin
insert into HOCPHAN values (@ma,@ten,@sotc,@sotiet,@mamh)
end
--Hàm sửa học phần--
go
create proc SuaHP (@ma nvarchar(10), @ten nvarchar(50),@sotc int, @sotiet int, @mamh nvarchar(10))
as
begin
update HOCPHAN
set TENHP=@ten,SOTC=@sotc,SOTIET=@sotiet,MAMH=@mamh
where MAHP=@ma
end
--Hàm xóa học phần
go
Create proc XoaHP(@ma nvarchar(10))
as
begin
delete HOCPHAN where MAHP=@ma
end
-----/////HỌC HÀM, CHỨC VỤ, KỲ HỌC//////----
--Thêm học hàm
go
create proc ThemCD (@ma nvarchar(10), @ten nvarchar(50), @dmgd int)
as
begin
insert into CHUCDANH
values (@ma, @ten, @dmgd)
end
--Sửa học hàm
go
create proc SuaCD (@ma nvarchar(10), @ten nvarchar(50), @dmgd int)
as
begin
update CHUCDANH
set TENCD=@ten,DMGIANGDAY=@dmgd
where MACD=@ma
end
--Xóa học hàm
go
create proc XoaCD (@ma nvarchar(10))
as
begin
delete CHUCDANH where MACD=@ma
end
--Thêm chức vụ
go
create proc ThemCV (@ma nvarchar(10), @ten nvarchar(50), @hsgt int)
as
begin
insert into CHUCVU
values (@ma, @ten, @hsgt)
end
--Sửa chức vụ--
go
create proc SuaCV (@ma nvarchar(10), @ten nvarchar(50), @hsgt int)
as
begin
update CHUCVU
set TENCV=@ten,HESOGIAMTAI=@hsgt
where MACV=@ma
end
--Xóa chức vụ---
go
create proc XoaCV (@ma nvarchar(10))
as
begin
delete CHUCVU where MACV=@ma
end
--Thêm kỳ học
go
create proc ThemKH (@magv nvarchar(10), @macd nvarchar(10), @macv nvarchar(10), @ten nvarchar(50))
as
begin
insert into KYHOC values (@magv,@macd,@macv,@ten)
end
--Sửa kỳ học---
go
create proc SuaKH (@magv nvarchar(10), @macd nvarchar(10), @macv nvarchar(10), @ten nvarchar(50))
as
begin
update KYHOC
set TENKY=@ten
where MAGV=@magv and MACD=@macd and MACV=@macv
end
--Xóa kỳ học--
go
create proc XoaKH (@magv nvarchar(10), @macd nvarchar(10), @macv nvarchar(10))
as
begin
delete KYHOC where MAGV=@magv and MACD = @macd and MACV = @macv
end
---/////LÓP HỌC PHẦN/////---
--thêm lớp học phần--
go
CREATE PROC Themlop (@malop nvarchar(10),@ten NVARCHAR(50),@qs INT,@ngonngu NVARCHAR(30),@mahp nvarchar(10),@matd nvarchar(10),@mahe nvarchar(10))
as
begin
insert into LOPHOCPHAN
values (@malop,@ten,@qs,@ngonngu,@mahp,@matd,@mahe)
end
--Sua lớp học phần
go
CREATE PROC Sualop (@malop nvarchar(10),@ten NVARCHAR(50),@qs INT,@ngonngu NVARCHAR(30),@mahp nvarchar(10),@matd nvarchar(10),@mahe nvarchar(10))
as
begin
update LOPHOCPHAN
set TENLOP=@ten,QUANSO=@qs,NGONNGUGD=@ngonngu,MAHP=@mahp,MATD=@matd,MAHEDT=@mahe
where MALOP=@malop
end
--Xóa lớp học phần
go
Create proc XoaLop (@malop nvarchar(10))
as
begin
delete LOPHOCPHAN where MALOP=@malop
end
--Tìm kiếm lớp theo ma
go
create proc SearchLOPma (@ten nvarchar(10))
as
begin
select * from LOPHOCPHAN where MALOP like '%'+@ten+'%'
end
--Tìm kiếm lớp theo tên
go
create proc SearchLOPten (@ten nvarchar(50))
as
begin
select * from LOPHOCPHAN where TENLOP LIKE '%' + @ten + '%'
end
----////TRÌNH ĐỘ VÀ HỆ ĐÀO TẠO///---
--Thêm trình độ
go
create proc ThemTD (@ma nvarchar(10), @ten nvarchar(50))
as
begin
insert into TRINHDODT values (@ma, @ten)
end
--Sửa trình độ
go
create proc SuaTD (@ma nvarchar(10), @ten nvarchar(10))
as
begin
update TRINHDODT
set TENTD=@ten where MATD=@ma
end
--Xóa trình độ
go
create proc XoaTD (@ma nvarchar(10))
as
begin
delete TRINHDODT where MATD=@ma
end
--Thêm hệ
go
create proc ThemHE (@ma nvarchar(10), @ten nvarchar(50))
as
begin
insert into HEDAOTAO values (@ma, @ten)
end
--Sửa hệ
go
create proc SuaHE (@ma nvarchar(10), @ten nvarchar(10))
as
begin
update HEDAOTAO
set TENHEDT=@ten where MAHEDT=@ma
end
--Xóa hệ
go
create proc XoaHE (@ma nvarchar(10))
as
begin
delete HEDAOTAO where MAHEDT=@ma
end
---////THỜI KHÓA BIỂU///----
go
create proc ThemTKB (@malop nvarchar(10), @thu nvarchar(20) ,@tuan nvarchar(20),@kip nvarchar(20), @tiet char(10))
as
begin
insert into THOIKHOABIEU
values(@malop,@thu,@tuan,@kip,@tiet)
end
--Sua TKB
go
create proc SuaTKB (@malop nvarchar(10), @thu nvarchar(20) ,@tuan nvarchar(20),@kip nvarchar(20), @tiet char(10))
as
begin
update THOIKHOABIEU
set THU = @thu, TUAN = @tuan, KIPHOC = @kip,TIET = @tiet
where MALOP=@malop
end
--Xóa TKB
go
create proc XoaTKB (@malop nvarchar(10))
as
begin
delete THOIKHOABIEU where MALOP=@malop
end
---Xóa TKB của cả bộ môn
go
create proc XoaTKB_BM(@tenbm nvarchar(50))
as
begin
	delete THOIKHOABIEU
	where MALOP in (select MALOP from LOPHOCPHAN lhp, HOCPHAN hp, MONHOC mh, BOMON bm
	where lhp.MAHP = hp.MAHP and hp.MAMH = mh.MAMH and mh.MABM = bm.MABM and TENBM = @tenbm)
end
--Tìm kiếm TKB theo mã lớp
go
create proc SearchTKBmalop(@ten nvarchar(10))
as
begin
select * from THOIKHOABIEU where MALOP like '%' + @ten +'%'
end
--Tìm kiếm lớp
go
create proc timkiemlop (@ten nvarchar(50))
as
begin
select MALOP, TENLOP from LOPHOCPHAN where TENLOP like '%' + @ten + '%'
end
---/////TRUY VẤN///-----
--lấy tổng các hệ số giảm tải của giáo viên
go
create function Tong_HSGT (@magv nvarchar(10)) RETURNS INT
as
begin
declare @tong int
select @tong = sum(HESOGIAMTAI) from CHUCVU cv, KYHOC kh where MAGV = @magv and cv.MACV = kh.MACV
return @tong
end
--lấy Mã lớp học phần chưa được phân công
go
create proc SelectMALOP
as
begin
select MALOP, TENLOP from LOPHOCPHAN
where MALOP not in (select MALOP from PHANCONG)
end
--lấy Giáo viên
go
create proc SelectGV
as
begin
select MAGV, TENGV from GIAOVIEN
end
----Lấy học phần của từng Bộ môn
select MAHP, TENHP, SOTC, SOTIET, TENBM
from HOCPHAN hp, MONHOC mh, BOMON bm
where hp.MAMH=mh.MAMH and mh.MABM=bm.MABM and TENBM=N'Trung tâm máy tính'

select MALOP, TENLOP, QUANSO
from LOPHOCPHAN
where MAHP = 'HP06'

select MAGV,TENGV
from GIAOVIEN gv, BOMON bm
where gv.MABM = bm.MABM and TENBM=N'Trung tâm máy tính'
---
--Xóa tất cả các dòng thuộc bộ môn @tenbm
go
create proc XoaPC_BM(@tenbm nvarchar(50))
as
begin
	delete PHANCONG
	where MALOP in (select MALOP from LOPHOCPHAN lhp, HOCPHAN hp, MONHOC mh, BOMON bm
	where lhp.MAHP = hp.MAHP and hp.MAMH = mh.MAMH and mh.MABM = bm.MABM and TENBM = @tenbm)
end
---Thêm phân công
go
Create proc ThemPC (@malop nvarchar(10),@magv1 nvarchar(10),@magv2 nvarchar(10),@kip nvarchar(10),@diadiem nvarchar(50),@sotiet int, @ky nvarchar(50), @nam nvarchar(50))
as
begin
	insert into PHANCONG
	values(@malop,@magv1,@magv2,@ky,@nam,@kip,@diadiem,@sotiet)
end
---Sửa phân công
go
Create proc SuaPC (@malop nvarchar(10),@magv1 nvarchar(10),@magv2 nvarchar(10),@kip nvarchar(10),@diadiem nvarchar(50),@sotiet int, @ky nvarchar(50), @nam nvarchar(50))
as
begin
	update PHANCONG
	set MAGV2=@magv2,KIPHOC=@kip,DIADIEM=@diadiem,SOTIET=@sotiet, KYHOC=@ky,NAMHOC=@nam
	where MALOP=@malop and MAGV1=@magv1
end
---Xóa 1 dòng trong phân công
go
Create proc XoaPC(@malop nvarchar(10))
as
begin
delete PHANCONG
where MALOP=@malop
end
---

---cập nhật số giáo viên cho bộ môn
--update BOMON
--set SOGV = (Select count(MAGV) from GIAOVIEN where MABM = BOMON.MABM group by MABM)
-----------------------------------------------------TRIGGER-----------------------------------------------------
---Trigger xóa giáo viên
go
Create trigger Delete_UpdatePC on GIAOVIEN instead of delete
as
declare @magv nvarchar(10)
begin
	select @magv = MAGV from deleted
	update PHANCONG set MAGV1 = MAGV2 where MAGV1 = @magv
	update PHANCONG set MAGV2 = NULL where MAGV2 = @magv
	delete KYHOC where MAGV = @magv
	delete GIAOVIEN where MAGV = @magv
end
--Trigger cập nhật số giáo viên của bộ môn
go
Create trigger Insert_UpdateBM on GIAOVIEN for INSERT
as
begin
	update BOMON
	set SOGV = SOGV + (Select count(MAGV) from inserted where MABM = BOMON.MABM group by MABM)
end
go
Create trigger Delete_UpdateBM on GIAOVIEN for DELETE
as
begin
	update BOMON
	set SOGV = SOGV - (Select count(MAGV) from deleted where MABM = BOMON.MABM group by MABM)
end
go
--Trigger xóa lớp học phần
Create trigger TGXoaLHP on LOPHOCPHAN instead of DELETE
as
declare @malop nvarchar(10)
begin
	select @malop = MALOP from deleted
	delete THOIKHOABIEU where MALOP = @malop
	delete PHANCONG where MALOP = @malop
	delete LOPHOCPHAN where MALOP = @malop
end
--trigger xóa học phần
go
create trigger TGXoaHP on HOCPHAN instead of DELETE
as
declare @mahp nvarchar(10)
begin
	select @mahp = MAHP from deleted
	delete LOPHOCPHAN where MAHP = @mahp
	delete HOCPHAN where MAHP = @mahp
end
--trigger xóa môn học
go
create trigger TGXoaMH on MONHOC instead of DELETE
as
declare @mamh nvarchar(10)
begin
	select @mamh = MAMH from deleted
	delete HOCPHAN where MAMH = @mamh
	delete MONHOC where MAMH = @mamh
end
--//////Bảng theo dõi số tiết dạy của giáo viên
--tính tải của giáo viên
go
create function SOTIETDAY(@magv nvarchar(10)) returns int
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
--
go
Create function THEODOIGD(@mabm nvarchar(10), @ky nvarchar(20), @nam nvarchar(50)) 
returns @table table (MAGV char(10), DMGD int, TONGTIET int, SODU int)
as
begin
	declare @tam table (STT int, MAGV nvarchar(10))
	insert into @tam
	select ROW_NUMBER() over(order by MAGV), MAGV from GIAOVIEN where MABM = @mabm
	declare @magv nvarchar(10), @dinhmuc int, @tongtiet int, @sodu int, @dem int, @count int
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
--create bảng login
create table QUYEN
(
	ID int IDENTITY(1,1) primary key,
	TenQuyen nvarchar(10)
)
create table TAIKHOAN
(
	username varchar(50),
	MAGV varchar(10) ,
	Permission int references QUYEN(ID),
	Pass varchar(50)
)
--drop table TAIKHOAN
INSERT INTO QUYEN VALUES
('admin'),( 'user')
INSERT INTO TAIKHOAN VALUES
	('BuiLam','GV025',1,'builam'),
	('TongMD','GV018',1,'ductong'),
	('NgocTran','GV031',2,'ngoctran'),
	('NgocAnhMath','GV001',2,'anhta'),
	('TMThanh','GV007',2,'thanhta'),
	('HuuPhuc','GV011',2,'phucngo'),
	('TatThangwinner','GV017',2,'thanghoa'),
	('PhanHai','GV024',2,'phanhai'),
	('ManhMTA','GV002',2,'manhhy')
--Thủ tục thêm tài khoản
create proc themTK(@user varchar(50),@ma varchar(10),@pass varchar(50))
as
insert into TAIKHOAN
Values (@user,@ma,2,@pass)
--- thủ tục sửa tài khoản
create proc suaTK(@ma varchar(10),@pass varchar(50))
as
update TAIKHOAN
set Pass=@pass
where MAGV=@ma
----///////////////////////////truy vấn dữ liệu///////////////////////////////////
--1. Đưa ra giáo viên chính dạy lớp học phần có mã LOP001
select MAGV1, TENGV from GIAOVIEN, PHANCONG
where MAGV = MAGV1 and MALOP = 'LOP001'
--2. Đưa ra các lớp học phần do giáo viên chính có mã GV010 dạy
select lhp.MALOP, TENLOP 
from LOPHOCPHAN lhp, PHANCONG pc
where lhp.MALOP = pc.MALOP and MAGV1 = 'GV010'
--3. Đưa ra lớp học kíp sáng
select lhp.MALOP, TENLOP
from LOPHOCPHAN lhp, PHANCONG pc
where lhp.MALOP = pc.MALOP and KIPHOC = N'Sáng'
--4. Đưa ra những giáo viên dạy buổi chiều
select MAGV1, TENGV
from PHANCONG, GIAOVIEN
where MAGV = MAGV1 and KIPHOC = N'Chiều'
--5. Đưa ra những giáo viên dạy 75 tiết theo 1 học phần
select MAGV1, TENGV
from PHANCONG, GIAOVIEN
where MAGV1 = MAGV and SOTIET = 75
--6. Đưa ra những lớp học ở khu A
select lhp.MALOP, TENLOP
from PHANCONG pc, LOPHOCPHAN lhp
where pc.MALOP = lhp.MALOP and DIADIEM = N'Khu A'
--7. Đưa ra những lớp học từ tiết 1-3 các ngày trong tuần
select distinct lhp.MALOP, TENLOP
from THOIKHOABIEU tkb, LOPHOCPHAN lhp
where tkb.MALOP = lhp.MALOP and TIET = '1-3'
--8. Đưa ra những lớp học vào thứ 2 tuần 13
select distinct lhp.MALOP, TENLOP
from THOIKHOABIEU tkb, LOPHOCPHAN lhp
where tkb.MALOP = lhp.MALOP and THU = N'Thứ 2' and TUAN = N'Tuần 13'
--9. Đưa ra những lớp học vào sáng thứ 3 tuần 10
select distinct lhp.MALOP, TENLOP
from THOIKHOABIEU tkb, LOPHOCPHAN lhp
where tkb.MALOP = lhp.MALOP and KIPHOC = N'Sáng' and THU = N'Thứ 3' and TUAN = N'Tuần 10'
--10. Đưa ra những lớp học 4 tiết vào sáng thứ 2
select distinct lhp.MALOP, TENLOP
from THOIKHOABIEU tkb, LOPHOCPHAN lhp
where tkb.MALOP = lhp.MALOP and KIPHOC = N'Sáng' and THU = N'Thứ 2' and (TIET = '1-4' or TIET = '3-6')
--/////////////////////////truy vấn nâng cao/////////////////////////////////////
--1. đưa ra tổng số tiết dạy của từng giáo viên
select MAGV, TENGV, sum(SOTIET) Tongsotiet 
from PHANCONG, GIAOVIEN
where MAGV1 = MAGV
group by  MAGV, TENGV
--2. đưa ra số lớp mà giáo viên GV003 dạy
select count(MALOP) solop
from PHANCONG
where MAGV1 = 'GV003'
--3. Đưa ra giáo viên dạy nhiều tiết nhất
select MAGV, TENGV, sum(SOTIET)
from PHANCONG, GIAOVIEN
where MAGV1 = MAGV 
group by MAGV, TENGV
having sum(SOTIET) = (select max(sotietday) from 
(select sum(SOTIET) sotietday from PHANCONG group by MAGV1) a)
--4. Đưa ra số lượng giáo viên dạy vào thứ 2 theo kíp
select pc.KIPHOC, count(distinct MAGV1) sogv
from PHANCONG pc, THOIKHOABIEU tkb
where pc.MALOP = tkb.MALOP and THU = N'Thứ 2'
group by pc.KIPHOC
--5. Đưa ra những lớp học chỉ học 2 buổi trên tuần 1
select distinct a.MALOP, THU 
from  (select MALOP from THOIKHOABIEU
	where TUAN = N'Tuần 1'
	group by MALOP
	having count(THU) = 2) as a, THOIKHOABIEU
where a.MALOP = THOIKHOABIEU.MALOP
--6. Đưa ra những giáo viên chỉ dạy buổi chiều
select distinct MAGV1, TENGV
from PHANCONG, GIAOVIEN
where MAGV = MAGV1 and MAGV1 not in (select MAGV1 from PHANCONG where KIPHOC = N'Sáng')
--7. đưa ra những giáo viên và những lớp giáo viên dạy chính nếu có
select MAGV, TENGV, TENLOP
from GIAOVIEN left join PHANCONG
on MAGV = MAGV1 join LOPHOCPHAN
on PHANCONG.MALOP = LOPHOCPHAN.MALOP
--8. Đưa ra những giáo viên chỉ dạy chính một lớp
select MAGV1, TENGV
from PHANCONG, GIAOVIEN
where MAGV1 = MAGV
group by MAGV1, TENGV
having count(MALOP) = 1
--9. Đưa ra giáo viên là chủ nhiệm bộ môn hoặc dạy chính lớp LOP001
select MAGV, TENGV
from GIAOVIEN
where exists (Select MAChunhiem from BOMON where GIAOVIEN.MAGV = BOMON.MAChunhiem)
union
select MAGV1, TENGV
from GIAOVIEN, PHANCONG
where MAGV1 = MAGV and MALOP = 'LOP001'
--10. Đưa ra tất cả các dòng trong bảng phân công được sắp xếp theo mã giáo viên 1
select * from PHANCONG order by MAGV1
---/////////////////////////////Lập trình T-SQL///////////////////////////////////////
--Tạo hàm thêm Phân công
create proc ThemPC (@malop nvarchar(10),@magv1 nvarchar(10),@magv2 nvarchar(10),@kyhoc nvarchar(50),@namhoc nvarchar(50),@kip nvarchar(10),@diadiem nvarchar(50),@sotiet int)
as
begin
	insert into PHANCONG
	values(@malop,@magv1,@magv2,@kyhoc,@namhoc,@kip,@diadiem,@sotiet)
end
--Tạo function tính tổng số tiết dạy của giáo viên
create function SOTIETDAY(@magv nvarchar(10)) returns int
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
--Tạo Trigger thêm một dòng vào bảng phân công
create trigger TGThemPC on PHANCONG for INSERT
as
declare @malop nvarchar(10), @magv1 nvarchar(10), @magv2 nvarchar(10)
begin
	select @malop = MALOP, @magv1 = MAGV1, @magv2 = MAGV2
	from inserted
	PRINT N'Mã lớp vừa thêm là ' + @malop
	PRINT N'Mã giáo viên 1 là ' + @magv1
	PRINT N'Mã giáo viên 2 là ' + @magv2
end
-- duyệt từng dòng trong bảng phân công sử dụng con trỏ
declare cur_sor cursor scroll for
select *  from PHANCONG order by MALOP
open cur_sor
fetch first from cur_sor
while @@FETCH_STATUS = 0
begin
	fetch next from cur_sor
end
close cur_sor
deallocate cur_sor
--
delete PHANCONG
Create function GetPhancong(@tenbm nvarchar(50)) returns @table table (MALOP nvarchar(10),
MAGV1 nvarchar(10), MAGV2 nvarchar(10), KIPHOC nvarchar(20), DIADIEM nvarchar(50), SOTIET int,
KYHOC nvarchar(50), NAMHOC nvarchar(50))
as
begin
	insert into @table
	select MALOP,MAGV1,MAGV2,KIPHOC,DIADIEM,SOTIET,KYHOC,NAMHOC
	from PHANCONG pc,GIAOVIEN gv,BOMON bm
	where pc.MAGV1 = gv.MAGV and gv.MABM = bm.MABM and bm.TENBM = @tenbm
return
end