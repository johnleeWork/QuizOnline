USE [master]
GO
/****** Object:  Database [LAB2]    Script Date: 2/25/2021 11:09:37 PM ******/
CREATE DATABASE [LAB2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LAB2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LAB2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAB2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB2] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LAB2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB2] SET RECOVERY FULL 
GO
ALTER DATABASE [LAB2] SET  MULTI_USER 
GO
ALTER DATABASE [LAB2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LAB2', N'ON'
GO
ALTER DATABASE [LAB2] SET QUERY_STORE = OFF
GO
USE [LAB2]
GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnswer](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[answer_content] [varchar](500) NOT NULL,
	[questionID] [int] NULL,
	[isRight] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblExam]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExam](
	[examID] [int] NOT NULL,
	[email] [varchar](70) NOT NULL,
	[dateTimeFinish] [datetime] NULL,
	[subjectID] [varchar](10) NOT NULL,
	[numberCorrect] [int] NOT NULL,
	[point] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[examID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblExamDetail]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExamDetail](
	[examDetailID] [int] IDENTITY(1,1) NOT NULL,
	[examID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[answerChooseID] [int] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__tblExamD__7ACEFF5E008391EA] PRIMARY KEY CLUSTERED 
(
	[examDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestions]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestions](
	[questionID] [int] NOT NULL,
	[question_content] [varchar](500) NOT NULL,
	[createDate] [date] NULL,
	[subjectID] [varchar](10) NOT NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [PK__tblQuest__6238D4923F68E0F9] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubjects]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubjects](
	[subjectID] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[numberQuestion] [int] NOT NULL,
	[timeDo] [int] NOT NULL,
 CONSTRAINT [PK__tblSubje__ACF9A740E2C689DC] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 2/25/2021 11:09:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [varchar](70) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [PK__tblUsers__AB6E6165B29DA46E] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAnswer] ON 

INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (1, N'RecordSet', 1, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (2, N'ResultSet', 1, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (3, N'DataSet', 1, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (4, N'RowSet', 1, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (5, N'Single -tier and two tier', 2, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (6, N'None of the others', 2, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (7, N'Three-tier and four tier', 2, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (8, N'two-tier and three-tier', 2, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (9, N'thread inherit their priority from their parent thread', 3, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (10, N'Thread are guanteed to run with the priority that you set using the set Priority() method', 3, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (11, N'Every thread starts executing with a priority of 5', 3, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (12, N'Thread priority is an integer ranging from 1 to 100', 3, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (13, N'java.awt.BorderLayout', 4, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (14, N'java.awt.GridLayout', 4, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (15, N'java.awt.CardLayout', 4, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (16, N'None of the others', 4, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (17, N'ODBCDriver', 5, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (18, N'Driver', 5, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (19, N'none of the others', 5, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (20, N'DriverManager', 5, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (21, N'JScrollPane', 6, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (22, N'JFrame', 6, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (23, N'JLabel', 6, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (24, N'JPanel', 6, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (25, N'The programer can specify which thread should be notified in a notify() method call', 7, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (26, N'the wait() and notify() methods can be called outside synchronized code', 7, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (27, N'The thread that call wait() goes into the monitor pool of wiating threads', 7, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (28, N'The thread that calls notify() gives up the lock', 7, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (29, N'java.awt. Two Dimensional Graphics 2D', 8, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (30, N'java.awt.Transform', 8, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (31, N'java.awt. Two Dimensional Graphics', 8, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (32, N'javax.swing.Component', 8, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (33, N'java.awt.FontMetric', 9, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (34, N'java.util.FontMetric', 9, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (35, N'javax.swing.FontMetric', 9, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (36, N'java.awt.FontMetrics', 9, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (37, N'The RMI registry is a program that associates names with RMI services. A server specifies.....', 10, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (38, N'An RMI server is an application that creates one or more remote objects and make them available ....', 10, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (39, N'An RMI server performs two tasks', 10, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (40, N'A client accesses a remote object by specifying only the server name', 10, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (41, N'Vary the priorities of your threads', 11, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (42, N'Synchronize access to all shared variables', 11, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (43, N'there is no single technique that can guarantee non-deadlocking code', 11, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (44, N'Make sure all threads yield from time to time', 11, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (45, N'GirdLayout', 12, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (46, N'FlowLayout', 12, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (47, N'GirdBagLayout', 12, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (48, N'BorderLayout', 12, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (49, N'Access the variables only via synchronized methods', 13, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (50, N'Mark all variables as volatile', 13, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (51, N'Use only static variables', 13, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (52, N'Mark all variables as synchronized', 13, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (53, N'None', 14, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (54, N'The class TWO Dimensional Graphics is a sub-classs of the Graphic2D class', 14, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (55, N'TO get a two Dimensional Graphics2D object, cast a TWO Dimensional Graphics object to Graphic2D', 14, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (56, N'Draw method of the Two Dimensional Graphics can accepts geometry object as their parameters', 14, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (57, N'You cannot specify which thread will get notified', 15, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (58, N'Execute mon.notify(th1) from synchronized code of any object', 15, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (59, N'Execute notify(th1) from within synchroniized code of mon', 15, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (60, N'Execute th1.notify() from synchronized code of any object', 15, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (61, N'BorderLayout', 16, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (62, N'FlowLayput', 16, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (63, N'CardLayout', 16, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (64, N'GirdLayout', 16, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (65, N'JListBox', 17, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (66, N'JTextField', 17, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (67, N'JLabel', 17, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (68, N'JButton', 17, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (69, N'10', 18, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (70, N'0', 18, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (71, N'1', 18, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (72, N'5', 18, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (73, N'Classes', 19, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (74, N'Blocks within static method', 19, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (75, N'Blocks within methods', 19, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (76, N'Static methods', 19, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (77, N'Must run in the same virtual machine', 20, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (78, N'Must run in two separate computers', 20, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (79, N'Can run in two separate virtual machines', 20, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (80, N'Properties file contains pairs <key,value> using the format key', 20, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (81, N'type 3', 21, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (82, N'type 2', 21, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (83, N'type 4', 21, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (84, N'type 1', 21, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (85, N'A thread is in the waiting state agter it has been created and started', 22, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (86, N'A thread is in the ready state agter it has been created and started', 22, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (87, N'A thread is in the new state agter it has been created and started', 22, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (88, N'A thread is in the ready state agter it has been created', 22, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (89, N'A status of 200 to 299 signifies that the request was successful', 23, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (90, N'A status of 300 to 399 is informational messages', 23, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (91, N'A status of 400 to 499 indicates an error in the server', 23, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (92, N'A status of 500 to 599 indicates an error in the client', 23, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (93, N'Servlet', 24, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (94, N'Http', 24, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (95, N'HttpServletRequest', 24, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (96, N'HttpServletResponse', 24, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (97, N'ReportServlet will throw exception at runtime', 25, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (98, N'ReportServlet.java wont compile', 25, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (99, N'ReportServlet.java will compile and run without any problems', 25, 0)
GO
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (100, N'response.setType("image/gif")', 25, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (101, N'Information resources(sources) on the Internet', 26, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (102, N'E-mail addresses for use in the Internet', 26, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (103, N'IP addresses of servers connected to the Internet', 26, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (104, N'Owners of PCs connected to the Internet', 26, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (105, N'It is an XML document.', 27, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (106, N'It cannot be unpackaged by the container.', 27, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (107, N'It is used by web application developer to deliver the web application in a single unit.', 27, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (108, N'It contains web components such as servlets as well as EJBs.', 27, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (109, N'Web Container', 28, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (110, N'EJB Container', 28, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (111, N'Servlets', 28, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (112, N'Applets', 28, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (113, N'blank', 29, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (114, N'empty', 29, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (115, N'null', 29, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (116, N'false', 29, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (117, N'the user has closed all his/her browser windows.', 30, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (118, N'the request is the first request from the user.', 30, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (119, N'the session attribute of page directive is set to false.', 30, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (120, N'the user browser does not support URL rewriting.', 30, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (121, N'authentication', 31, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (122, N'fet ', 31, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (123, N'data integrity', 31, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (124, N'authorization', 31, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (125, N'DoGet, DoPost', 32, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (126, N'doGet, doPost', 32, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (127, N'doGET, doPOST', 32, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (128, N'Get, Post', 32, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (129, N'taguri', 33, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (130, N'info', 33, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (131, N'taglib-location', 33, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (132, N'display-name', 33, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (133, N'JNDI', 34, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (134, N'UDDI', 34, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (135, N'JMS', 34, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (136, N'JSP', 34, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (137, N'HTML FORM is used to capture username and password', 35, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (138, N'Password is transmitted in an encrypted form.', 35, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (139, N'Password is transmitted as text', 35, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (140, N'Password is transmitted either in encrypted text or in plain text depending on the browser', 35, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (141, N'They are used to represent data stored in a RDBMS', 36, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (142, N'They are used to implement business logic', 36, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (143, N'They are an Enterprises Beans', 36, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (144, N'They are CANNOT hold client state', 36, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (145, N'Session beans and web components', 37, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (146, N'Only stateless session beans', 37, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (147, N'Only stateful session beans', 37, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (148, N'Any EJB component', 37, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (149, N'Variable length of information block', 38, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (150, N'Supporting multiple applications', 38, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (151, N'Store-and-forward', 38, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (152, N'All of the above', 38, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (153, N'How two or more communicating entities in a layer are to interact', 39, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (154, N'Messages that can be sent and received', 39, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (155, N'Actions that are to be taken when a certain event occurs', 39, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (156, N'All of the above', 39, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (157, N'TCP', 40, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (158, N'UDP', 40, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (159, N'HTTP', 40, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (160, N'None of the above', 40, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (161, N'PAN', 41, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (162, N'LAN', 41, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (163, N'SAN', 41, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (164, N'VPN', 41, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (165, N'It does flow control', 42, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (166, N'It does not do flow and error control', 42, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (167, N'It does error control', 42, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (168, N'Retransmission', 42, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (169, N'IP', 43, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (170, N'TCP', 43, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (171, N'UDP', 43, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (172, N'SMTP', 43, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (173, N'Transfer arbitrary message size', 44, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (174, N'Low delay for interactive applications', 44, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (175, N'Packets have maximum length', 44, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (176, N'All of the above', 44, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (177, N'HTTP', 45, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (178, N'UDP', 45, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (179, N'DNS', 45, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (180, N'TCP', 45, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (181, N'Connectionless packet transmission', 46, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (182, N'Routing tables at the packet switches', 46, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (183, N'Destinations identified by unique addresses', 46, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (184, N'All of the above', 46, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (185, N'Removed', 47, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (186, N'Modified', 47, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (187, N'Added', 47, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (188, N'Rearranged', 47, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (189, N'Protocol', 48, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (190, N'Route', 48, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (191, N'Medium', 48, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (192, N'Path', 48, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (193, N'Connection oriented', 49, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (194, N'Process to Process', 49, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (195, N'Transport layer protocol', 49, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (196, N'Connectionless', 49, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (197, N'Transport layer', 50, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (198, N'Network layer', 50, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (199, N'Session layer', 50, 0)
GO
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (200, N'Data link layer', 50, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (202, N'Transport layer', 51, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (203, N'Application layer', 51, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (204, N'Data link layer', 51, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (205, N'TCP', 52, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (206, N'UDP', 52, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (207, N'IP', 52, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (208, N'None of the above', 52, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (209, N'2dd', 53, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (210, N'2dd', 53, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (211, N'2', 53, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (212, N'2dd', 53, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (213, N'ddsdsd', 54, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (214, N'sdsds', 54, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (215, N'dsdsd', 54, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (216, N'dsdsd', 54, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (217, N'qqqq', 55, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (218, N'qq', 55, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (219, N'qq', 55, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (220, N'qq', 55, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (223, N'hhh', 8, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (225, N'hhh', 8, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (233, N'a', 56, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (234, N'a', 56, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (235, N'a', 56, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (236, N'a', 56, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (237, N'ID', 57, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (238, N'IP', 57, 0)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (239, N'IIS', 57, 1)
INSERT [dbo].[tblAnswer] ([answerID], [answer_content], [questionID], [isRight]) VALUES (240, N'IW', 57, 0)
SET IDENTITY_INSERT [dbo].[tblAnswer] OFF
GO
INSERT [dbo].[tblExam] ([examID], [email], [dateTimeFinish], [subjectID], [numberCorrect], [point]) VALUES (320, N'luan@gmail.com', CAST(N'2021-02-25T22:46:51.520' AS DateTime), N'PRJ321', 2, 10)
INSERT [dbo].[tblExam] ([examID], [email], [dateTimeFinish], [subjectID], [numberCorrect], [point]) VALUES (481, N'luan@gmail.com', CAST(N'2021-02-25T13:13:50.250' AS DateTime), N'PRJ321', 1, 5)
INSERT [dbo].[tblExam] ([examID], [email], [dateTimeFinish], [subjectID], [numberCorrect], [point]) VALUES (896, N'luan@gmail.com', CAST(N'2021-02-25T13:25:20.050' AS DateTime), N'NWC203c', 5, 5)
GO
SET IDENTITY_INSERT [dbo].[tblExamDetail] ON 

INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (82, 481, 26, 101, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (83, 481, 33, 130, 0)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (84, 896, 43, 169, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (85, 896, 44, 175, 0)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (86, 896, 42, 166, 0)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (87, 896, 31, 121, 0)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (88, 896, 38, 149, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (89, 896, 39, 154, 0)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (90, 896, 46, 181, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (91, 896, 52, 207, 0)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (92, 896, 49, 193, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (93, 896, 47, 185, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (94, 320, 24, 93, 1)
INSERT [dbo].[tblExamDetail] ([examDetailID], [examID], [questionID], [answerChooseID], [status]) VALUES (95, 320, 32, 125, 1)
SET IDENTITY_INSERT [dbo].[tblExamDetail] OFF
GO
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (1, N'Statement object return SQL query result as ____ objects', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (2, N'JDBC supports ____ and____ models', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (3, N'which of the following statements about threads is true?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (4, N'which of the following layout manager will present components with the same size', CAST(N'2021-01-30' AS Date), N'PRJ311', N'deActive')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (5, N'the ____ class is the primary class that has the driver information', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (6, N'Which of the following components is not a container type?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (7, N'Which of the following statements about the wait() and notify() methods is true?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (8, N'The class ___ contains methods for drawing coordinated with grahical transformations such as rotating, shearing...', CAST(N'2021-01-30' AS Date), N'PRJ311', N'deActive')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (9, N'to get metric data of a font, the class ___ should be used', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (10, N'select INCORRECT statement about RMI server', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (11, N'How can you ensure that multithreaded code does not deadlock', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (12, N'The default layout manager of every JPanel', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (13, N'How do you prevent shared data from being computed in a multithreaded evironment?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (14, N'Choose correct', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (15, N'A monitor called mon has 10 threads in its waiting pool, all these waiting threads have the same priority. One of the threads its th1. How can you notify th1 so that it alone moves from the Waiting state to the...', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (16, N'what is the Layout Manager of the GUI ', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (17, N'which component can display an image, but cannot get focus?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (18, N'Consider the following code developed in Netbeans. How many buttons are shown on the GUI?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (19, N'which of the following may not be synchronized?', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (20, N'RMI applications often comprise two separate programs a server and a client and they ...', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (21, N'_________ drivers that are pure Java and implement the netword protocol for a specific data source. The client connects directly to the data source.', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (22, N'Select the most correct statement', CAST(N'2021-01-30' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (23, N'Which of the following statements are correct about the status of the Http response? Select the one correct answer', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (24, N'Classes HttpServlet and GenericServlet implement the ___ interface', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (25, N'Consider the code of ReportServlet servlet of a web application. Assuming generateReport() is valid method and have no problems, which of the following statement about these servlet is true?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (26, N'Which of the following is indicated by URL, which is used on the Internet?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (27, N'Identify correct statement about a WAR file.(Choose one)', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (28, N'A .................... manages the threading for the servlets and JSPs and provides the necessary interface with the Web server.', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (29, N'What should be the value of <body-content> subelement of element <tag> in a TLD file if the tag should not have any contents as its body?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (30, N'A JSP page will not have access to session implicit variable if.', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (31, N'You need to make sure that the response stream of your web application is secure. Which factor will you look at? (Choose one)', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (32, N'Class HttpServlet defines the methods _____ and _______ to response to get and post request from a client.', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (33, N'Which of the elements defined within the taglib element of taglib descriptor file are required? Select one correct answer.', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (34, N'Which Java technology provides a standard API for publish-subscribe messaging model?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (35, N'Which of the following statements are correct about HTTP Basic authentication mechanism?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (36, N'Which is NOT true about stateless session beans?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (37, N'Which component can use a container-managed entity manager with an extended persistent context?', CAST(N'2021-01-30' AS Date), N'PRJ321', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (38, N'There are similarities between message switching and packet switching. Which of following that applies to packet switching but not to message switching?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (39, N'A protocol is a set of precise and unambiguous rules that governs', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (40, N'DNS is a domain-name-service that responds to queries of domain name to IP address or IP address to domain name. DNS uses services provided by', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (41, N'A network used to join the individual networks at different sites into one extended network is called', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (42, N'Upon receipt of a bad segment, UDP?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (43, N'Which of following protocol is HTTP built upon?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (44, N'Which of following requirements are necessary for packet networks to support multiple and diverse applications?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (45, N'Which of the following is an application layer protocol?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'deActive')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (46, N'Which of the following are features of ARPANET design?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (47, N'In the layer hierarchy as the data packet moves from the upper to the lower layers, headers are', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (48, N'The ________ is the physical path over which a message travels', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (49, N'Which of the following is true for Transport Control Protocol', CAST(N'2021-01-30' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (50, N'Which OSI layer is responsible for providing end-to-end communication with reliable service?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'deActive')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (51, N'Which OSI layer is responsible for dividing the transmitted bit stream into frames?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'deActive')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (52, N'Which protocol glues the network of networks together as the Internet?', CAST(N'2021-01-30' AS Date), N'NWC203c', N'deActive')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (53, N'2', CAST(N'2021-02-09' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (54, N'123', CAST(N'2021-02-19' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (55, N'qqqqqq', CAST(N'2021-02-19' AS Date), N'NWC203c', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (56, N'a', CAST(N'2021-02-25' AS Date), N'PRJ311', N'active')
INSERT [dbo].[tblQuestions] ([questionID], [question_content], [createDate], [subjectID], [status]) VALUES (57, N'internet', CAST(N'2021-02-25' AS Date), N'NWC203c', N'active')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblSubjects] ([subjectID], [name], [numberQuestion], [timeDo]) VALUES (N'NWC203c', N'Computer Networking', 10, 900)
INSERT [dbo].[tblSubjects] ([subjectID], [name], [numberQuestion], [timeDo]) VALUES (N'PRJ311', N'Desktop Java Applications', 11, 900)
INSERT [dbo].[tblSubjects] ([subjectID], [name], [numberQuestion], [timeDo]) VALUES (N'PRJ321', N'Web-Based Java Applications', 2, 30)
GO
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'dddd@gmail.com', N'test', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'US', N'active')
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'luan@gmail.com', N'Luan', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'US', N'active')
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'luan@gmail.comm', N'ew', N'ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', N'US', N'active')
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'son@gmail.com', N'son', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'US', N'active')
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'test@gmail.com', N'test', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'US', N'active')
INSERT [dbo].[tblUsers] ([email], [name], [password], [roleID], [status]) VALUES (N'truongletan204@gmail.com', N'Truong', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'AD', N'active')
GO
ALTER TABLE [dbo].[tblExam] ADD  DEFAULT (getdate()) FOR [dateTimeFinish]
GO
ALTER TABLE [dbo].[tblQuestions] ADD  CONSTRAINT [DF__tblQuesti__creat__2B3F6F97]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[tblQuestions] ADD  CONSTRAINT [DF__tblQuesti__statu__2C3393D0]  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF__tblUsers__status__267ABA7A]  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[tblAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblAnswer_tblQuestions] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestions] ([questionID])
GO
ALTER TABLE [dbo].[tblAnswer] CHECK CONSTRAINT [FK_tblAnswer_tblQuestions]
GO
ALTER TABLE [dbo].[tblExam]  WITH CHECK ADD  CONSTRAINT [FK_tblExam_tblSubjects] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblExam] CHECK CONSTRAINT [FK_tblExam_tblSubjects]
GO
ALTER TABLE [dbo].[tblExam]  WITH CHECK ADD  CONSTRAINT [FK_tblExam_tblUsers] FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblExam] CHECK CONSTRAINT [FK_tblExam_tblUsers]
GO
ALTER TABLE [dbo].[tblExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblExamDetail_tblExam] FOREIGN KEY([examID])
REFERENCES [dbo].[tblExam] ([examID])
GO
ALTER TABLE [dbo].[tblExamDetail] CHECK CONSTRAINT [FK_tblExamDetail_tblExam]
GO
ALTER TABLE [dbo].[tblExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblExamDetail_tblQuestions] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestions] ([questionID])
GO
ALTER TABLE [dbo].[tblExamDetail] CHECK CONSTRAINT [FK_tblExamDetail_tblQuestions]
GO
ALTER TABLE [dbo].[tblQuestions]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestions_tblSubjects] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestions] CHECK CONSTRAINT [FK_tblQuestions_tblSubjects]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [LAB2] SET  READ_WRITE 
GO
