USE [ConferenceDb2]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityLogs]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Activity] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[RoomId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleActions]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[ActionId] [int] NULL,
 CONSTRAINT [PK_RoleActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Link] [nvarchar](max) NULL,
	[MaxUserCount] [int] NOT NULL,
	[CreatedUserId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[IsPrivate] [bit] NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomUsers]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_RoomUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.05.2021 23:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[Gender] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actions] ON 

INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (6, N'Add User')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (7, N'Delete User')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (8, N'Update User')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (9, N'Delete Room')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (10, N'Add Room')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (11, N'Update Room')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (12, N'Lock Room')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (13, N'Removal Of The User From The Room')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (14, N'Add Favorite Room')
INSERT [dbo].[Actions] ([Id], [ActionName]) VALUES (15, N'Remove Favorite Room')
SET IDENTITY_INSERT [dbo].[Actions] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityLogs] ON 

INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1, 1, N'Login application', CAST(N'2021-04-13T23:11:17.623' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2, 1, N'Created Room ', CAST(N'2021-04-13T23:12:06.433' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (3, 1, N'Login application', CAST(N'2021-04-13T23:26:45.817' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (4, 1, N'Viewed rooms', CAST(N'2021-04-13T23:26:45.983' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (5, 1, N' Viewed the profile ', CAST(N'2021-04-13T23:26:52.967' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (6, 1, N'Viewed rooms', CAST(N'2021-04-13T23:27:10.367' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (7, 2, N'Login application', CAST(N'2021-04-13T23:28:22.693' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (8, 2, N'Viewed rooms', CAST(N'2021-04-13T23:28:22.860' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (9, 2, N'Login application', CAST(N'2021-04-13T23:29:44.877' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (10, 2, N'Viewed rooms', CAST(N'2021-04-13T23:29:45.047' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (11, 2, N'Leave the Room :', CAST(N'2021-04-13T23:29:48.570' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (12, 2, N'Viewed rooms', CAST(N'2021-04-13T23:29:48.577' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (13, 2, N'Created Room ', CAST(N'2021-04-13T23:29:57.770' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (14, 2, N'Viewed rooms', CAST(N'2021-04-13T23:29:57.783' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (15, 2, N'Login application', CAST(N'2021-04-13T23:31:44.517' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (16, 2, N'Viewed rooms', CAST(N'2021-04-13T23:31:44.683' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (17, 2, N'Leave the Room :Football', CAST(N'2021-04-13T23:31:50.493' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (18, 2, N'Viewed rooms', CAST(N'2021-04-13T23:31:50.503' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (19, 2, N' Viewed the profile ', CAST(N'2021-04-13T23:32:14.133' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (20, 2, N'Viewed rooms', CAST(N'2021-04-13T23:32:16.550' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (21, 2, N'Login application', CAST(N'2021-04-13T23:33:11.837' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (22, 2, N'Leave the Room :Football', CAST(N'2021-04-13T23:33:29.767' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (23, 2, N'Viewed notifications', CAST(N'2021-04-13T23:35:51.650' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (24, 2, N'Viewed notifications', CAST(N'2021-04-13T23:35:57.637' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (25, 2, N'Logout application', CAST(N'2021-04-13T23:39:49.947' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (26, 1, N'Login application', CAST(N'2021-04-14T20:53:38.993' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (27, 1, N'Login application', CAST(N'2021-04-14T21:06:23.183' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (28, 1, N'Logout application', CAST(N'2021-04-14T21:06:36.090' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (29, 4, N'Login application', CAST(N'2021-04-14T21:07:01.413' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (30, 1, N'Login application', CAST(N'2021-04-14T21:10:05.607' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (31, 1, N'Logout application', CAST(N'2021-04-14T21:11:42.477' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (32, 4, N'Login application', CAST(N'2021-04-14T21:11:58.960' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (33, 4, N' Viewed the profile ', CAST(N'2021-04-14T21:12:06.497' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (34, 4, N'dsadas', CAST(N'2021-04-14T21:12:21.660' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (35, 4, N'Logout application', CAST(N'2021-04-14T21:12:31.447' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (36, 1, N'Login application', CAST(N'2021-04-14T21:12:33.167' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (37, 1, N'asdasdasd', CAST(N'2021-04-14T21:13:54.287' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (38, 1, N'Login application', CAST(N'2021-04-14T21:17:05.660' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (39, 1, N'Sended Message: asasfasfasfasfasfasfasf', CAST(N'2021-04-14T21:20:13.777' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (40, 1, N'Sended Message: asasfasfasfasfasfasfasf', CAST(N'2021-04-14T21:20:35.037' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (41, 1, N'Login application', CAST(N'2021-04-14T21:23:29.047' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (42, 1, N'Updated notification : dursun noktaya basmasdaasdas', CAST(N'2021-04-14T21:23:41.107' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (43, 1, N'Logout application', CAST(N'2021-04-14T21:26:05.783' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (44, 2, N'Login application', CAST(N'2021-04-14T21:26:32.217' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (45, 2, N'Join the Room: Football', CAST(N'2021-04-14T21:26:41.897' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (46, 2, N'Logout application', CAST(N'2021-04-14T21:26:48.080' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (47, 1, N'Login application', CAST(N'2021-04-14T21:26:54.743' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (48, 1, N'Deleted notification : dursun noktaya basmasdaasdas', CAST(N'2021-04-14T21:27:10.173' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (49, 1, N'Deleted notification : ghjhgjghj', CAST(N'2021-04-14T21:27:10.850' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (50, 1, N'Deleted notification : Nefret Olsun', CAST(N'2021-04-14T21:27:11.447' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (51, 1, N'Deleted notification : sdaasdasd', CAST(N'2021-04-14T21:27:12.060' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (52, 1, N'Deleted notification : seseses', CAST(N'2021-04-14T21:27:12.680' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (53, 1, N'Created notification : Software Presentation', CAST(N'2021-04-14T21:28:23.283' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (54, 1, N'Updated notification : Software Presentation', CAST(N'2021-04-14T21:28:52.060' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (55, 1, N'Actived', CAST(N'2021-04-14T21:29:20.017' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (56, 1, N'Deleted the Room :Nefret', CAST(N'2021-04-14T21:29:29.923' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (57, 1, N'Deleted the Room :asdasd', CAST(N'2021-04-14T21:29:31.447' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (58, 1, N'Created notification : The Software Room has been opened', CAST(N'2021-04-14T21:31:06.170' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (59, 1, N'Created notification : The Programming I Room has been closed 	', CAST(N'2021-04-14T21:32:13.613' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (60, 1, N'Viewed notifications', CAST(N'2021-04-14T21:32:18.550' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (61, 1, N'Viewed notifications', CAST(N'2021-04-14T21:32:22.367' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (62, 1, N'Viewed notifications', CAST(N'2021-04-14T21:34:06.230' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (63, 1, N'Login application', CAST(N'2021-04-17T21:36:53.993' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (64, 1, N'Login application', CAST(N'2021-04-17T21:50:22.950' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (65, 1, N'Deactive room situationSoftware', CAST(N'2021-04-17T21:54:21.687' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (66, 1, N'Login application', CAST(N'2021-04-17T22:08:53.847' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (67, 1, N'Login application', CAST(N'2021-04-17T22:22:55.947' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (68, 1, N'Login application', CAST(N'2021-04-17T22:30:37.817' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (69, 1, N'Login application', CAST(N'2021-04-17T22:37:17.103' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (70, 1, N'Login application', CAST(N'2021-04-17T22:53:04.467' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (71, 1, N'Login application', CAST(N'2021-04-18T22:45:33.320' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (72, 1, N'Logout application', CAST(N'2021-04-18T22:58:50.303' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (73, 2, N'Login application', CAST(N'2021-04-18T22:58:55.053' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (74, 2, N'Login application', CAST(N'2021-04-18T23:00:22.130' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (75, 2, N'Login application', CAST(N'2021-04-18T23:08:37.230' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (76, 2, N'Removed favorite room: Basketball', CAST(N'2021-04-18T23:08:41.613' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (77, 2, N'Removed favorite room: Computer Network', CAST(N'2021-04-18T23:08:42.347' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (78, 2, N'Login application', CAST(N'2021-04-18T23:10:02.677' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (79, 2, N'Logout application', CAST(N'2021-04-18T23:11:10.017' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (80, 1, N'Login application', CAST(N'2021-04-18T23:11:13.967' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (81, 2, N'Login application', CAST(N'2021-04-19T13:38:43.537' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (82, 2, N'Join the Room: Football', CAST(N'2021-04-19T13:38:59.970' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (83, 2, N'Added favorite room: Football', CAST(N'2021-04-19T13:40:03.450' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (84, 2, N'Added favorite room: Basketball', CAST(N'2021-04-19T13:40:04.683' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (85, 2, N'Removed favorite room: Basketball', CAST(N'2021-04-19T13:40:07.310' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (86, 2, N'Removed favorite room: Football', CAST(N'2021-04-19T13:40:10.417' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (87, 2, N'Logout application', CAST(N'2021-04-19T13:40:22.323' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (88, 1, N'Login application', CAST(N'2021-04-19T13:40:24.483' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (89, 1, N'Actived', CAST(N'2021-04-19T13:45:44.083' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (90, 1, N'Deactive room situationSoftware', CAST(N'2021-04-19T13:45:44.797' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (91, 1, N'Login application', CAST(N'2021-04-19T13:49:00.427' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (92, 1, N'Logout application', CAST(N'2021-04-19T13:49:26.693' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (93, 2, N'Login application', CAST(N'2021-04-19T13:49:28.783' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (94, 2, N'Added favorite room: Football', CAST(N'2021-04-19T13:50:22.037' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (95, 2, N'Removed favorite room: Football', CAST(N'2021-04-19T13:50:24.743' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (96, 2, N'Added favorite room: Computer Network', CAST(N'2021-04-19T13:50:27.370' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (97, 2, N'Removed favorite room: Computer Network', CAST(N'2021-04-19T13:50:30.300' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (98, 2, N'Logout application', CAST(N'2021-04-19T13:50:39.510' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (99, 1, N'Login application', CAST(N'2021-04-19T13:50:41.977' AS DateTime))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (100, 1, N' Viewed the profile ', CAST(N'2021-04-19T13:55:40.867' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (101, 2, N'Login application', CAST(N'2021-04-20T14:36:09.727' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (102, 2, N'Join the Room: Football', CAST(N'2021-04-20T14:36:16.070' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (103, 2, N'Logout application', CAST(N'2021-04-20T14:36:22.303' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (104, 1, N'Login application', CAST(N'2021-04-20T14:36:24.280' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (105, 2, N'Login application', CAST(N'2021-04-24T19:22:20.000' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (106, 2, N' Viewed the profile ', CAST(N'2021-04-24T19:22:30.627' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (107, 2, N' Viewed the profile ', CAST(N'2021-04-24T19:23:46.813' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (108, 2, N' Viewed the profile ', CAST(N'2021-04-24T19:25:12.047' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (109, 2, N' Viewed the profile ', CAST(N'2021-04-24T19:27:22.483' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (110, 2, N'Added favorite room: Basketball', CAST(N'2021-04-24T19:27:24.907' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (111, 2, N'Removed favorite room: Basketball', CAST(N'2021-04-24T19:27:28.047' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (112, 2, N'Logout application', CAST(N'2021-04-24T19:28:32.503' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (113, 1, N'Login application', CAST(N'2021-04-24T19:28:35.300' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (114, 1, N'Logout application', CAST(N'2021-04-24T19:29:50.947' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (115, 2, N'Login application', CAST(N'2021-04-24T19:29:54.020' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (116, 2, N'Login application', CAST(N'2021-04-24T22:02:12.563' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (117, 2, N'Added favorite room: Football', CAST(N'2021-04-24T22:02:38.687' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (118, 2, N'Logout application', CAST(N'2021-04-24T22:02:56.310' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (119, 1, N'Login application', CAST(N'2021-04-24T22:02:58.487' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (120, 1, N'Created Room: asd', CAST(N'2021-04-24T22:03:12.530' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (121, 1, N'Login application', CAST(N'2021-04-24T22:19:18.607' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (122, 1, N'Login application', CAST(N'2021-04-24T22:30:32.670' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (123, 1, N'Login application', CAST(N'2021-04-24T23:01:00.047' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (124, 1, N'Login application', CAST(N'2021-04-24T23:13:00.190' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (125, 1, N'Login application', CAST(N'2021-04-24T23:20:26.000' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (126, 1, N'Logout application', CAST(N'2021-04-24T23:28:10.597' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (127, 2, N'Login application', CAST(N'2021-04-24T23:28:14.347' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (128, 2, N'Logout application', CAST(N'2021-04-24T23:28:33.347' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (129, 4, N'Login application', CAST(N'2021-04-24T23:28:54.360' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (130, 4, N'Viewed notifications', CAST(N'2021-04-24T23:30:51.213' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (131, 4, N'Viewed notifications', CAST(N'2021-04-24T23:30:54.647' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (132, 2, N'Login application', CAST(N'2021-04-27T14:46:09.900' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (133, 2, N' Viewed the profile ', CAST(N'2021-04-27T14:49:50.347' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (134, 2, N'Logout application', CAST(N'2021-04-27T14:50:16.677' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (135, 1, N'Login application', CAST(N'2021-04-27T14:50:20.017' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (136, 1, N'Update the Room : Calculus', CAST(N'2021-04-27T14:51:09.097' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (137, 1, N'Deleted the Room : asd', CAST(N'2021-04-27T14:51:14.557' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (138, 1, N'Created Room: Web', CAST(N'2021-04-27T14:52:08.030' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (139, 1, N'Created Room: Physics ', CAST(N'2021-04-27T14:53:04.690' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (140, 1, N'Created Room: Turkish', CAST(N'2021-04-27T14:53:43.880' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (141, 1, N'Created Room: Chemistry', CAST(N'2021-04-27T14:54:05.607' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (142, 1, N'Created Room: Volleyball', CAST(N'2021-04-27T14:56:45.447' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (143, 1, N'Deleted user : sdadasdasasdsdadsadas asddasdassdasddas', CAST(N'2021-04-27T15:01:05.167' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (144, 1, N'Created user : Çağdaş Özer', CAST(N'2021-04-27T15:01:33.237' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (145, 1, N'Deleted user : ahmet mahmut', CAST(N'2021-04-27T15:03:06.137' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (146, 1, N'Login application', CAST(N'2021-04-29T18:43:51.960' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (147, 1, N'Sended Message: SDADASDASDAS', CAST(N'2021-04-29T18:44:48.543' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (148, 1, N'Sended Message: A file has been sent', CAST(N'2021-04-29T18:44:57.167' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (149, 1, N'Viewed notifications', CAST(N'2021-04-29T18:45:48.567' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (150, 1, N'Viewed notifications', CAST(N'2021-04-29T18:45:52.433' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (151, 1, N'Viewed notifications', CAST(N'2021-04-29T18:45:58.313' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (152, 1, N'Viewed notifications', CAST(N'2021-04-29T18:46:01.977' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (153, 1, N'Viewed notifications', CAST(N'2021-04-29T18:46:08.410' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (154, 1, N' Viewed the profile ', CAST(N'2021-04-29T18:46:25.810' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (155, 1, N'Room Activated', CAST(N'2021-04-29T18:47:14.193' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (156, 1, N'Deactivated room situationBasketball', CAST(N'2021-04-29T18:47:19.180' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (157, 1, N'Update the Room : Football2', CAST(N'2021-04-29T18:49:14.977' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (158, 1, N'Update the Room : Football', CAST(N'2021-04-29T18:49:21.863' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (159, 1, N'Login application', CAST(N'2021-04-30T19:08:05.037' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (160, 1, N'Logout application', CAST(N'2021-04-30T19:11:13.820' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (161, 2, N'Login application', CAST(N'2021-04-30T19:11:18.440' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (162, 2, N'Join the Room: Football', CAST(N'2021-04-30T19:12:11.507' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (163, 2, N'Join the Room: Software', CAST(N'2021-04-30T19:13:44.490' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (164, 2, N'Leave the Room : Calculus', CAST(N'2021-04-30T19:14:46.837' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (165, 2, N'Join the Room: Computer Network', CAST(N'2021-04-30T19:15:24.630' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (166, 1, N'Login application', CAST(N'2021-04-30T19:27:30.987' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (167, 1, N'Logout application', CAST(N'2021-04-30T19:28:19.507' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (168, 2, N'Login application', CAST(N'2021-04-30T19:28:21.867' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (169, 2, N'Logout application', CAST(N'2021-04-30T19:28:45.217' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (170, 1, N'Login application', CAST(N'2021-04-30T19:28:49.537' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (171, 1, N'Update the Room : Basketball', CAST(N'2021-04-30T19:29:02.577' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (172, 1, N'Logout application', CAST(N'2021-04-30T19:29:10.383' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (173, 2, N'Login application', CAST(N'2021-04-30T19:29:15.510' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (174, 2, N'Join the Room: Software', CAST(N'2021-04-30T19:30:04.883' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (175, 2, N'Leave the Room : Software', CAST(N'2021-04-30T19:30:08.213' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (176, 2, N'Join the Room: Software', CAST(N'2021-04-30T19:30:18.750' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (177, 2, N'Leave the Room : Software', CAST(N'2021-04-30T19:30:23.130' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (178, 2, N'Leave the Room : Software', CAST(N'2021-04-30T19:30:30.857' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (179, 2, N'Join the Room: Basketball', CAST(N'2021-04-30T19:30:55.910' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (180, 2, N'Leave the Room : Basketball', CAST(N'2021-04-30T19:30:59.057' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (181, 2, N'Join the Room: Basketball', CAST(N'2021-04-30T19:31:40.927' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (182, 2, N'Join the Room: Basketball', CAST(N'2021-04-30T19:31:53.613' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (183, 2, N'Logout application', CAST(N'2021-04-30T19:33:51.550' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (184, 3, N'Login application', CAST(N'2021-04-30T19:34:11.333' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (185, 3, N'Leave the Room : Basketball', CAST(N'2021-04-30T19:34:38.707' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (186, 2, N'Login application', CAST(N'2021-05-03T21:26:20.213' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (187, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:28:50.633' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (188, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:29:06.950' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (189, 2, N'Leave the Room : Basketball', CAST(N'2021-05-03T21:29:14.197' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (190, 2, N'Leave the Room : Basketball', CAST(N'2021-05-03T21:29:16.833' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (191, 2, N'Leave the Room : Football', CAST(N'2021-05-03T21:29:26.770' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (192, 2, N'Login application', CAST(N'2021-05-03T21:32:27.827' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (193, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:32:44.210' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (194, 2, N'Leave the Room : Basketball', CAST(N'2021-05-03T21:32:54.023' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (195, 2, N'Login application', CAST(N'2021-05-03T21:38:28.323' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (196, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:40:43.143' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (197, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:44:13.013' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (198, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:44:27.430' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (199, 2, N'Login application', CAST(N'2021-05-03T21:44:53.243' AS DateTime))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (200, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:45:04.413' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (201, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:46:00.237' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (202, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:46:44.180' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (203, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:47:16.867' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (204, 2, N'Login application', CAST(N'2021-05-03T21:48:42.423' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (205, 2, N'Join the Room: Basketball', CAST(N'2021-05-03T21:48:49.427' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (206, 2, N'Leave the Room : Software', CAST(N'2021-05-03T21:48:59.793' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (207, 2, N'Login application', CAST(N'2021-05-03T22:02:09.513' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (208, 2, N'Login application', CAST(N'2021-05-03T22:06:03.220' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (209, 2, N'Join the Room: Software', CAST(N'2021-05-03T22:06:49.580' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (210, 2, N'Leave the Room : Basketball', CAST(N'2021-05-03T22:06:59.057' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (211, 2, N'Logout application', CAST(N'2021-05-03T22:09:41.080' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (212, 1, N'Login application', CAST(N'2021-05-03T22:09:57.573' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (213, 1, N'Login application', CAST(N'2021-05-03T22:12:05.547' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (214, 1, N'Room Activated', CAST(N'2021-05-03T22:12:16.663' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (215, 1, N'Room Activated', CAST(N'2021-05-03T22:12:22.033' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (216, 1, N'Logout application', CAST(N'2021-05-03T22:12:29.200' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (217, 2, N'Login application', CAST(N'2021-05-03T22:12:34.827' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (218, 2, N'Added favorite room: Programming I', CAST(N'2021-05-03T22:12:44.893' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (219, 2, N' Viewed the profile ', CAST(N'2021-05-03T22:13:30.477' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (220, 2, N'Login application', CAST(N'2021-05-05T22:00:24.817' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (221, 2, N'Logout application', CAST(N'2021-05-05T22:00:37.003' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (222, 3, N'Login application', CAST(N'2021-05-05T22:01:39.083' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (223, 3, N'Join the Room: Computer Network', CAST(N'2021-05-05T22:06:24.480' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (224, 3, N'Leave the Room : Data Structures', CAST(N'2021-05-05T22:06:40.577' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (225, 2, N'Login application', CAST(N'2021-05-05T22:06:54.057' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (226, 2, N'Join the Room: Basketball', CAST(N'2021-05-05T22:06:56.717' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (227, 2, N'Leave the Room : Computer Network', CAST(N'2021-05-05T22:06:59.707' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (228, 2, N'Leave the Room : Computer Network', CAST(N'2021-05-05T22:07:01.437' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (229, 2, N'Leave the Room : Data Structures', CAST(N'2021-05-05T22:07:08.253' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (230, 2, N'Join the Room: Programming I', CAST(N'2021-05-05T22:07:12.247' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (231, 2, N'Leave the Room : Data Structures', CAST(N'2021-05-05T22:07:14.153' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (232, 2, N'Join the Room: Data Structures', CAST(N'2021-05-05T22:07:23.597' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (233, 2, N'Leave the Room : Programming I', CAST(N'2021-05-05T22:07:27.693' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (234, 2, N'Join the Room: Programming I', CAST(N'2021-05-05T22:07:45.787' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (235, 2, N'Leave the Room : Data Structures', CAST(N'2021-05-05T22:07:47.777' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (236, 2, N'Created Room: sadsa', CAST(N'2021-05-05T22:08:22.317' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (237, 2, N'Logout application', CAST(N'2021-05-05T22:09:05.123' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (238, 1, N'Login application', CAST(N'2021-05-05T22:09:08.077' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (239, 1, N'Logout application', CAST(N'2021-05-05T22:12:01.707' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (240, 2, N'Login application', CAST(N'2021-05-05T22:12:08.430' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (241, 2, N'Login application', CAST(N'2021-05-18T22:48:29.953' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (242, 2, N'Logout application', CAST(N'2021-05-18T22:49:03.737' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (243, 1, N'Login application', CAST(N'2021-05-18T22:49:09.797' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (244, 1, N'Login application', CAST(N'2021-05-18T22:51:55.377' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (245, 1, N'Deactivated room situationData Structures', CAST(N'2021-05-18T22:52:03.473' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (246, 1, N'Room Activated', CAST(N'2021-05-18T22:52:07.237' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (247, 1, N'Login application', CAST(N'2021-05-18T23:17:00.783' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (248, 1, N'Login application', CAST(N'2021-05-18T23:22:25.210' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (249, 1, N'Login application', CAST(N'2021-05-18T23:22:59.657' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (250, 1, N'Login application', CAST(N'2021-05-18T23:23:30.123' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (251, 1, N'Created Room: test', CAST(N'2021-05-18T23:32:25.153' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (252, 1, N'Login application', CAST(N'2021-05-18T23:38:30.410' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (253, 1, N'Update the Room : test', CAST(N'2021-05-18T23:46:04.173' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (254, 1, N'Login application', CAST(N'2021-05-19T21:44:39.573' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (255, 1, N'Logout application', CAST(N'2021-05-19T22:04:58.497' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (256, 2, N'Login application', CAST(N'2021-05-19T22:05:07.017' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (257, 2, N'Logout application', CAST(N'2021-05-19T22:05:50.073' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (258, 1, N'Login application', CAST(N'2021-05-19T22:05:58.280' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (259, 1, N'Room Activated', CAST(N'2021-05-19T22:06:05.360' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (260, 1, N'Logout application', CAST(N'2021-05-19T22:06:16.753' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (261, 2, N'Login application', CAST(N'2021-05-19T22:06:22.763' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (262, 2, N'Login application', CAST(N'2021-05-19T22:09:34.030' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (263, 2, N'Login application', CAST(N'2021-05-19T22:41:30.107' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (264, 2, N'Login application', CAST(N'2021-05-19T22:44:02.810' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (265, 2, N'Join the Room: test', CAST(N'2021-05-19T22:45:36.193' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (266, 2, N'Leave the Room : Programming I', CAST(N'2021-05-19T22:45:37.787' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (267, 2, N'Login application', CAST(N'2021-05-19T22:57:34.463' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (268, 2, N'Leave the Room : Programming I', CAST(N'2021-05-19T23:06:21.453' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (269, 2, N'Join the Room: Data Structures', CAST(N'2021-05-19T23:06:59.020' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (270, 2, N'Leave the Room : test', CAST(N'2021-05-19T23:07:02.767' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (271, 2, N'Login application', CAST(N'2021-05-19T23:15:04.020' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (272, 2, N'Login application', CAST(N'2021-05-19T23:18:11.383' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (273, 2, N'Join the Room: test', CAST(N'2021-05-19T23:18:28.447' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (274, 2, N'Leave the Room : Programming I', CAST(N'2021-05-19T23:18:30.077' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (275, 2, N'Join the Room: Programming I', CAST(N'2021-05-19T23:18:43.660' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (276, 2, N'Leave the Room : Data Structures', CAST(N'2021-05-19T23:18:45.197' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (277, 2, N'Login application', CAST(N'2021-05-19T23:27:01.797' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (278, 2, N'Join the Room: Data Structures', CAST(N'2021-05-19T23:28:35.777' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (279, 2, N'Leave the Room : test', CAST(N'2021-05-19T23:28:38.860' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (280, 2, N'Login application', CAST(N'2021-05-19T23:30:33.857' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (281, 2, N'Leave the Room : test', CAST(N'2021-05-19T23:31:39.590' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (282, 2, N'Join the Room: Data Structures', CAST(N'2021-05-19T23:32:07.780' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (283, 2, N'Leave the Room : test', CAST(N'2021-05-19T23:32:10.820' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (284, 2, N'Logout application', CAST(N'2021-05-19T23:32:29.267' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (285, 1, N'Login application', CAST(N'2021-05-19T23:32:32.357' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (286, 1, N'Deactivated room situationtest', CAST(N'2021-05-19T23:32:48.327' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (287, 1, N'Room Activated', CAST(N'2021-05-19T23:32:55.593' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (288, 1, N'Logout application', CAST(N'2021-05-19T23:33:10.230' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (289, 2, N'Login application', CAST(N'2021-05-19T23:33:12.983' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (290, 2, N' Viewed the profile ', CAST(N'2021-05-19T23:34:37.033' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (291, 3, N'Login application', CAST(N'2021-05-20T12:12:42.393' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (292, 3, N'Login application', CAST(N'2021-05-20T12:56:16.300' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (293, 3, N'Logout application', CAST(N'2021-05-20T12:56:46.993' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (294, 1, N'Login application', CAST(N'2021-05-20T12:56:51.237' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (295, 1, N'Deactivated room situationData Structures', CAST(N'2021-05-20T12:56:57.177' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (296, 1, N'Room Activated', CAST(N'2021-05-20T12:57:06.527' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (297, 1, N'Logout application', CAST(N'2021-05-20T12:57:10.310' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (298, 3, N'Login application', CAST(N'2021-05-20T12:57:14.503' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (299, 3, N'Leave the Room : test', CAST(N'2021-05-20T12:57:39.270' AS DateTime))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (300, 3, N'Join the Room: Calculus', CAST(N'2021-05-20T12:57:58.827' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (301, 3, N'Leave the Room : test', CAST(N'2021-05-20T12:58:01.387' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (302, 3, N'Leave the Room : test', CAST(N'2021-05-20T12:58:28.583' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (303, 3, N'Created Room: Deneme', CAST(N'2021-05-20T13:00:07.297' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (304, 3, N'Logout application', CAST(N'2021-05-20T13:00:18.010' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (305, 1, N'Login application', CAST(N'2021-05-20T13:00:23.947' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (306, 1, N'Room Activated', CAST(N'2021-05-20T13:00:27.590' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (307, 1, N'Logout application', CAST(N'2021-05-20T13:00:32.443' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (308, 2, N'Login application', CAST(N'2021-05-20T13:00:38.370' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (309, 2, N'Added favorite room: Deneme', CAST(N'2021-05-20T13:01:45.897' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (310, 2, N'Join the Room: Deneme', CAST(N'2021-05-20T13:03:15.453' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (311, 2, N'Logout application', CAST(N'2021-05-20T13:03:29.000' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (312, 1, N'Login application', CAST(N'2021-05-20T13:03:34.303' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (313, 1, N'Deleted the Room : Deneme', CAST(N'2021-05-20T13:03:44.927' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (314, 1, N'Logout application', CAST(N'2021-05-20T13:03:50.903' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (315, 3, N'Login application', CAST(N'2021-05-20T13:03:55.827' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (316, 3, N'Leave the Room : test', CAST(N'2021-05-20T13:03:59.637' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (317, 3, N'Logout application', CAST(N'2021-05-20T13:05:31.453' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (318, 1, N'Login application', CAST(N'2021-05-20T13:05:35.313' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (319, 1, N'Deleted the Room : test', CAST(N'2021-05-20T13:06:20.870' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (320, 1, N'Logout application', CAST(N'2021-05-20T13:06:25.423' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (321, 3, N'Login application', CAST(N'2021-05-20T13:06:28.943' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (322, 3, N'Created Room: Test', CAST(N'2021-05-20T13:06:43.797' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (323, 3, N'Logout application', CAST(N'2021-05-20T13:06:59.277' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (324, 1, N'Login application', CAST(N'2021-05-20T13:07:04.403' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (325, 1, N'Room Activated', CAST(N'2021-05-20T13:07:08.427' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (326, 1, N'Logout application', CAST(N'2021-05-20T13:07:17.203' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (327, 3, N'Login application', CAST(N'2021-05-20T13:07:26.767' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (328, 3, N'Login application', CAST(N'2021-05-20T13:26:10.933' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (329, 3, N'Created Room: Deneme', CAST(N'2021-05-20T13:26:32.223' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (330, 3, N'Logout application', CAST(N'2021-05-20T13:26:36.040' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (331, 1, N'Login application', CAST(N'2021-05-20T13:26:39.923' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (332, 1, N'Room Activated', CAST(N'2021-05-20T13:26:44.303' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (333, 1, N'Logout application', CAST(N'2021-05-20T13:26:47.190' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (334, 3, N'Login application', CAST(N'2021-05-20T13:26:50.617' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (335, 3, N'Leave the Room : Test', CAST(N'2021-05-20T13:26:55.537' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (336, 3, N'Join the Room: Deneme', CAST(N'2021-05-20T13:27:07.413' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (337, 3, N'Leave the Room : Test', CAST(N'2021-05-20T13:27:09.577' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (338, 3, N'Created Room: Deneme 2', CAST(N'2021-05-20T13:27:39.137' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (339, 1, N'Login application', CAST(N'2021-05-20T15:49:49.860' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (340, 1, N'Deleted the Room : Deneme', CAST(N'2021-05-20T15:50:48.910' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (341, 1, N'Logout application', CAST(N'2021-05-20T15:50:58.407' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (342, 3, N'Login application', CAST(N'2021-05-20T15:51:03.877' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (343, 3, N'Leave the Room : Test', CAST(N'2021-05-20T15:51:10.080' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (344, 3, N'Logout application', CAST(N'2021-05-20T15:51:16.820' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (345, 2, N'Login application', CAST(N'2021-05-20T15:51:26.533' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (346, 2, N'Logout application', CAST(N'2021-05-20T15:51:37.313' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (347, 3, N'Login application', CAST(N'2021-05-20T15:51:46.567' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (348, 3, N'Added favorite room: Software', CAST(N'2021-05-20T15:52:13.700' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (349, 3, N'Leave the Room : Basketball', CAST(N'2021-05-20T15:55:05.667' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (350, 3, N'Logout application', CAST(N'2021-05-20T15:55:10.367' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (351, 1, N'Login application', CAST(N'2021-05-20T15:55:17.113' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (352, 1, N'Deactivated room situationComputer Network', CAST(N'2021-05-20T15:55:21.060' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (353, 1, N'Room Activated', CAST(N'2021-05-20T15:55:23.717' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (354, 1, N'Logout application', CAST(N'2021-05-20T15:55:27.093' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (355, 3, N'Login application', CAST(N'2021-05-20T15:55:39.157' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (356, 3, N'Login application', CAST(N'2021-05-20T16:05:57.240' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (357, 3, N'Logout application', CAST(N'2021-05-20T16:07:14.930' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (358, 1, N'Login application', CAST(N'2021-05-20T16:07:20.987' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (359, 1, N'Deactivated room situationBasketball', CAST(N'2021-05-20T16:07:27.277' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (360, 1, N'Sended Message: hello', CAST(N'2021-05-20T16:08:16.000' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (361, 1, N'Logout application', CAST(N'2021-05-20T16:08:26.617' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (362, 3, N'Login application', CAST(N'2021-05-20T16:08:31.107' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (363, 3, N'Leave the Room : Test', CAST(N'2021-05-20T16:08:51.530' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (364, 3, N'Created Room: Deneme', CAST(N'2021-05-20T16:10:17.077' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (365, 3, N'Logout application', CAST(N'2021-05-20T16:10:27.573' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (366, 1, N'Login application', CAST(N'2021-05-20T16:10:37.427' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (367, 1, N'Room Activated', CAST(N'2021-05-20T16:10:42.137' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (368, 1, N'Logout application', CAST(N'2021-05-20T16:10:46.327' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (369, 2, N'Login application', CAST(N'2021-05-20T16:10:53.650' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (370, 2, N'Join the Room: Football', CAST(N'2021-05-20T16:11:05.070' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (371, 2, N'Leave the Room : Deneme', CAST(N'2021-05-20T16:11:08.047' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1001, 3, N'Login application', CAST(N'2021-05-23T14:48:15.470' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1002, 3, N' Viewed the profile ', CAST(N'2021-05-23T14:48:21.603' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1003, 3, N'Sended Message: A file has been sent', CAST(N'2021-05-23T14:49:01.290' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1004, 3, N'Leave the Room : Test', CAST(N'2021-05-23T14:49:11.817' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1005, 3, N'Leave the Room : Test', CAST(N'2021-05-23T14:49:25.497' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (1006, 3, N'Removed favorite room: Software', CAST(N'2021-05-23T14:49:56.970' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2001, 3, N'Login application', CAST(N'2021-05-24T22:21:39.887' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2002, 3, N'Logout application', CAST(N'2021-05-24T22:26:39.057' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2003, 3, N'Login application', CAST(N'2021-05-24T22:27:19.303' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2004, 3, N'Logout application', CAST(N'2021-05-24T22:28:19.620' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2005, 1, N'Login application', CAST(N'2021-05-24T22:28:27.760' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2006, 1, N'Logout application', CAST(N'2021-05-24T22:30:07.410' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2007, 3, N'Login application', CAST(N'2021-05-24T22:32:54.423' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2008, 3, N'Leave the Room : Computer Network', CAST(N'2021-05-24T22:34:27.317' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2009, 3, N'Added favorite room: Calculus', CAST(N'2021-05-24T22:34:49.830' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2010, 3, N'Leave the Room : Test', CAST(N'2021-05-24T22:35:57.190' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2011, 3, N'Join the Room: Calculus', CAST(N'2021-05-24T22:36:44.807' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2012, 3, N'Leave the Room : Computer Network', CAST(N'2021-05-24T22:36:48.090' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2013, 3, N'Logout application', CAST(N'2021-05-24T22:38:08.697' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2014, 1, N'Login application', CAST(N'2021-05-24T22:38:13.270' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2015, 1, N'Room Activated', CAST(N'2021-05-24T22:38:54.620' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2016, 1, N'Deactivated room situationComputer Network', CAST(N'2021-05-24T22:39:33.533' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2017, 1, N'Room Activated', CAST(N'2021-05-24T22:39:37.540' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2018, 1, N'Logout application', CAST(N'2021-05-24T22:41:47.677' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2019, 3, N'Login application', CAST(N'2021-05-24T22:45:05.430' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2020, 3, N'Leave the Room : Computer Network', CAST(N'2021-05-24T22:45:49.363' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2021, 3, N'Join the Room: Computer Network', CAST(N'2021-05-24T22:46:07.517' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2022, 3, N'Leave the Room : Software', CAST(N'2021-05-24T22:46:14.317' AS DateTime))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2023, 3, N'Sended Message: hi', CAST(N'2021-05-24T22:46:32.187' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2024, 3, N'Sended Message: A file has been sent', CAST(N'2021-05-24T22:46:53.100' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2025, 3, N'Sended Message: dosya ektedir', CAST(N'2021-05-24T22:47:11.643' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2026, 3, N'Added favorite room: Data Structures', CAST(N'2021-05-24T22:47:51.490' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2027, 3, N'Removed favorite room: Calculus', CAST(N'2021-05-24T22:48:10.530' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2028, 3, N'Created Room: Deneme 3', CAST(N'2021-05-24T22:49:49.763' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2029, 3, N'Logout application', CAST(N'2021-05-24T22:50:02.527' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2030, 1, N'Login application', CAST(N'2021-05-24T22:50:09.613' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2031, 1, N'Room Activated', CAST(N'2021-05-24T22:50:26.997' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2032, 1, N'Deactivated room situationDeneme 3', CAST(N'2021-05-24T22:50:32.730' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2033, 1, N'Room Activated', CAST(N'2021-05-24T22:50:56.290' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2034, 1, N'Update the Room : Deneme 3', CAST(N'2021-05-24T22:51:30.283' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2035, 1, N'Deactivated room situationDeneme 3', CAST(N'2021-05-24T22:51:36.653' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2036, 1, N'Logout application', CAST(N'2021-05-24T22:51:47.443' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2037, 3, N'Login application', CAST(N'2021-05-24T22:51:53.707' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2038, 3, N' Viewed the profile ', CAST(N'2021-05-24T22:52:18.990' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2039, 3, N'Viewed notifications', CAST(N'2021-05-24T22:53:55.647' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2040, 3, N'Viewed notifications', CAST(N'2021-05-24T22:54:02.410' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2041, 3, N'Viewed notifications', CAST(N'2021-05-24T22:54:15.430' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2042, 3, N'Logout application', CAST(N'2021-05-24T22:54:41.727' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2043, 1, N'Login application', CAST(N'2021-05-24T22:54:46.890' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2044, 1, N'Deleted the Room : Deneme 3', CAST(N'2021-05-24T22:55:31.657' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2045, 1, N'Deleted the Room : Deneme', CAST(N'2021-05-24T22:55:54.920' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2046, 1, N'Deactivated room situationFootball', CAST(N'2021-05-24T22:56:08.480' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2047, 1, N'Room Activated', CAST(N'2021-05-24T22:56:14.847' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2048, 1, N'Deleted notification : The Software Room has been opened', CAST(N'2021-05-24T22:56:47.620' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2049, 1, N'Updated notification : Software Presentation', CAST(N'2021-05-24T22:57:00.303' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2050, 1, N'Viewed notifications', CAST(N'2021-05-24T22:57:09.930' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2051, 1, N'Created notification : Deneme Duyurusu', CAST(N'2021-05-24T22:57:26.923' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2052, 1, N'Created user : Mehmet Yılmaz', CAST(N'2021-05-24T22:58:09.427' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2053, 1, N'Updated user : Ahmet Yılmaz', CAST(N'2021-05-24T22:58:21.957' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2054, 1, N'Deleted user : Ahmet Yılmaz', CAST(N'2021-05-24T22:58:28.557' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2055, 1, N'Login application', CAST(N'2021-05-24T23:01:14.803' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2056, 1, N'Login application', CAST(N'2021-05-24T23:01:14.807' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2057, 1, N'Logout application', CAST(N'2021-05-24T23:07:46.590' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2058, 3, N'Login application', CAST(N'2021-05-24T23:07:52.310' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2059, 3, N'Removed favorite room: Data Structures', CAST(N'2021-05-24T23:08:39.117' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2060, 1, N'Login application', CAST(N'2021-05-24T23:41:59.653' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2061, 1, N'Logout application', CAST(N'2021-05-24T23:44:34.997' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2062, 3, N'Login application', CAST(N'2021-05-24T23:44:42.237' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2063, 3, N'Added favorite room: Computer Network', CAST(N'2021-05-24T23:44:49.713' AS DateTime))
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Activity], [CreatedDate]) VALUES (2064, 3, N'Removed favorite room: Computer Network', CAST(N'2021-05-24T23:44:57.930' AS DateTime))
SET IDENTITY_INSERT [dbo].[ActivityLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [RoomId], [UserId]) VALUES (10, 7, 1)
INSERT [dbo].[Favorites] ([Id], [RoomId], [UserId]) VALUES (12, 1, 1)
INSERT [dbo].[Favorites] ([Id], [RoomId], [UserId]) VALUES (22, 1, 2)
INSERT [dbo].[Favorites] ([Id], [RoomId], [UserId]) VALUES (23, 12, 2)
INSERT [dbo].[Favorites] ([Id], [RoomId], [UserId]) VALUES (24, 24, 2)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (82, NULL, 2, 1, N'asdasdasd', CAST(N'2021-03-27T20:32:34.563' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (83, NULL, 2, 1, N'asdasd', CAST(N'2021-03-27T20:32:59.190' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (84, NULL, 2, 1, N'saas', CAST(N'2021-03-27T20:34:10.953' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (85, NULL, 2, 1, N'asd', CAST(N'2021-03-27T20:34:53.847' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (86, NULL, 1, 1, NULL, CAST(N'2021-03-27T20:51:23.193' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (87, N'Ekran Alıntısı.PNG', 1, 1, NULL, CAST(N'2021-03-27T20:58:17.043' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (88, N'Ekran Alıntısı.PNG', 1, 1, NULL, CAST(N'2021-03-27T20:59:59.977' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (89, N'Ekran Alıntısı.PNG', 1, 1, NULL, CAST(N'2021-03-27T21:01:24.973' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (90, N'Ekran Alıntısı.PNG', 1, 1, N'A file has been sent', CAST(N'2021-03-27T21:02:41.323' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (91, NULL, 1, 1, N'asdfghjjklş
', CAST(N'2021-03-27T21:03:09.087' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (92, N'Ekran Alıntısı.PNG', 1, 1, N'A file has been sent', CAST(N'2021-03-27T21:03:26.280' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (93, N'Ekran Alıntısı.PNG', 1, 1, N'sdadasdasdasdasasd', CAST(N'2021-03-27T21:04:32.543' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (94, NULL, 1, 1, N'dsaasddasdasadsdas', CAST(N'2021-03-27T21:04:36.677' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (95, N'Ekran Alıntısı.PNG', 1, 1, NULL, CAST(N'2021-03-27T21:04:41.800' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (96, NULL, 1, 1, N'sdadasadsdas', CAST(N'2021-03-27T21:06:14.290' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (97, N'Ekran Alıntısı.PNG', 1, 1, N'A file has been sent', CAST(N'2021-03-27T21:06:19.670' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (98, N'Ekran Alıntısı.PNG', 1, 1, N'saddasdasdasA file has been sent', CAST(N'2021-03-27T21:06:26.303' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (99, NULL, 1, 1, N'adsadsasddasasd', CAST(N'2021-03-27T21:09:59.537' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (100, N'Ekran Alıntısı.PNG', 1, 1, NULL, CAST(N'2021-03-27T21:10:05.737' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (101, N'Ekran Alıntısı.PNG', 1, 1, N'adsasdasddas', CAST(N'2021-03-27T21:10:11.953' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (102, N'Ekran Alıntısı.PNG', 1, 1, NULL, CAST(N'2021-03-27T21:12:25.520' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (103, N'Ekran Alıntısı.PNG', 1, 1, N'A file has been sent', CAST(N'2021-03-27T21:13:02.533' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (107, NULL, 2, 1, N'saasdasd', CAST(N'2021-03-30T19:59:22.307' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (108, NULL, 2, 1, N'asfasfasfasfasfasfasfasf', CAST(N'2021-03-30T19:59:28.990' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (109, NULL, 2, 1, N'asdasdasd', CAST(N'2021-03-30T20:03:42.050' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (110, NULL, 2, 1, N'asdasdasd', CAST(N'2021-03-30T20:09:41.897' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (111, NULL, 2, 1, N'asdasdasd', CAST(N'2021-03-30T20:09:54.893' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (112, NULL, 2, 1, N'asdasdasdasdasdassdsadasdasdasdsaadsadsdasasd', CAST(N'2021-03-30T20:17:00.397' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (113, NULL, 2, 1, N'wwqeqweqweqweqweqweqw', CAST(N'2021-03-30T20:17:47.487' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (114, NULL, 2, 1, N'jhhjhjjhjhkjhkkjjk', CAST(N'2021-03-30T20:17:58.350' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (115, NULL, 2, 1, N'asdasdasdasdarfwftyhjklık', CAST(N'2021-03-30T20:19:04.630' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (116, NULL, 2, 1, N'errereerer', CAST(N'2021-03-30T20:19:27.697' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (117, NULL, 2, 1, N'sadasdasdasdasdsa', CAST(N'2021-03-30T20:20:11.187' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (118, NULL, 2, 1, N'weewrtyyyyttytr', CAST(N'2021-03-30T20:20:49.097' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (119, NULL, 2, 1, N'jhkhkjjkjkjh', CAST(N'2021-03-30T20:20:54.303' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (120, NULL, 2, 1, N'lllll', CAST(N'2021-03-30T20:20:56.117' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (122, NULL, 2, 1, N'asdasddasdsa', CAST(N'2021-03-30T20:21:28.717' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (123, NULL, 2, 1, N'a', CAST(N'2021-03-31T02:01:30.697' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (124, N'Week_5 - Software.pdf', 2, 1, N'A file has been sent', CAST(N'2021-03-31T02:01:38.523' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (125, N'Week_5 - Software.pdf', 2, 1, N'A file has been sent', CAST(N'2021-03-31T02:01:47.493' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (126, N'Week_5 - Software.pdf', 2, 1, N'asddasdas', CAST(N'2021-03-31T02:01:54.480' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (127, NULL, 2, 1, N'a', CAST(N'2021-03-31T14:56:07.987' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (128, N'Ekran Alıntısı.PNG', 2, 1, N'A file has been sent', CAST(N'2021-04-12T21:26:15.987' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (129, N'Ekran Alıntısı.PNG', 2, 1, N'sadasd', CAST(N'2021-04-12T21:26:38.280' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (130, NULL, 2, 1, N'asdasd', CAST(N'2021-04-12T21:26:53.207' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (131, N'Ekran Alıntısı.PNG', 1, 1, N'A file has been sent', CAST(N'2021-04-12T21:49:44.700' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (132, NULL, 4, 1, N'dsadas', CAST(N'2021-04-14T21:12:21.640' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (133, NULL, 1, 1, N'asdasdasd', CAST(N'2021-04-14T21:13:48.247' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (134, NULL, 1, 1, N'asdasd', CAST(N'2021-04-14T21:15:29.263' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (135, NULL, 1, 1, N'asasfasfasfasfasfasfasf', CAST(N'2021-04-14T21:17:21.970' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (136, NULL, 1, 1, N'asasfasfasfasfasfasfasf', CAST(N'2021-04-14T21:20:35.030' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (137, NULL, 1, 1, N'SDADASDASDAS', CAST(N'2021-04-29T18:44:48.520' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (138, N'Ekran Alıntısı.PNG', 1, 1, N'A file has been sent', CAST(N'2021-04-29T18:44:57.157' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (139, NULL, 1, 7, N'hello', CAST(N'2021-05-20T16:08:15.983' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (1139, N'trenbileti.pdf', 3, 25, N'A file has been sent', CAST(N'2021-05-23T14:49:01.267' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (2139, NULL, 3, 10, N'hi', CAST(N'2021-05-24T22:46:32.167' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (2140, N'WhatsApp Image 2021-05-22 at 20.48.26.jpeg', 3, 10, N'A file has been sent', CAST(N'2021-05-24T22:46:53.090' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Link], [UserId], [RoomId], [Text], [CreatedDate]) VALUES (2141, N'focus-periyodik-bakim-kapsami-2018-ocak.pdf', 3, 10, N'dosya ektedir', CAST(N'2021-05-24T22:47:11.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([Id], [Title], [Explanation]) VALUES (8, N'Software Presentation', N'Software Presentation at 10:00')
INSERT [dbo].[Notifications] ([Id], [Title], [Explanation]) VALUES (10, N'The Programming I Room has been closed 	', N'The Programming I Room has been closed 	')
INSERT [dbo].[Notifications] ([Id], [Title], [Explanation]) VALUES (1008, N'Deneme Duyurusu', N'Deneme amaçlıdır.')
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleActions] ON 

INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (10, 1, 6)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (11, 1, 7)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (12, 1, 8)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (13, 1, 9)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (14, 1, 10)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (15, 1, 11)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (16, 1, 12)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (17, 1, 13)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (19, 2, 10)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (20, 5, 12)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (21, 5, 13)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (22, 5, 10)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (23, 2, 14)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (24, 2, 15)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (25, 5, 15)
INSERT [dbo].[RoleActions] ([Id], [RoleId], [ActionId]) VALUES (26, 5, 14)
SET IDENTITY_INSERT [dbo].[RoleActions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [Description]) VALUES (1, N'Admin', N'Admin')
INSERT [dbo].[Roles] ([Id], [RoleName], [Description]) VALUES (2, N'User', N'User')
INSERT [dbo].[Roles] ([Id], [RoleName], [Description]) VALUES (4, N'Editor', N'Editor')
INSERT [dbo].[Roles] ([Id], [RoleName], [Description]) VALUES (5, N'Referee', N'referee')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (1, N'Football', N'Discussion', N'conferencesystem/roomid28', 10, 1, 1, 0, CAST(N'2021-03-09T00:00:00.000' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (7, N'Basketball', N'Basketball Room', NULL, 1, 1, 1, NULL, CAST(N'2021-03-28T16:38:08.883' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (8, N'Computer Network', N'Network', NULL, 20, 1, 1, NULL, CAST(N'2021-03-28T16:38:33.057' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (9, N'Calculus', N'Math', NULL, 50, 1, 1, NULL, CAST(N'2021-03-28T16:38:48.370' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (10, N'Software', N'Software', NULL, 30, 1, 1, NULL, CAST(N'2021-03-28T16:39:09.613' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (11, N'Data Structures', N'Data', NULL, 12, 1, 1, NULL, CAST(N'2021-03-28T16:39:39.553' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (12, N'Programming I', N'programming 1', NULL, 21, 1, 1, NULL, CAST(N'2021-03-28T16:40:05.257' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (13, N'Programming II', N'programming 2', NULL, 22, 1, 0, NULL, CAST(N'2021-03-28T16:40:38.567' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (17, N'Web', N'web', NULL, 19, 1, 0, NULL, CAST(N'2021-04-27T14:52:08.023' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (18, N'Physics ', N'physics', NULL, 50, 1, 0, NULL, CAST(N'2021-04-27T14:53:04.687' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (19, N'Turkish', N'Turkish', NULL, 80, 1, 0, NULL, CAST(N'2021-04-27T14:53:43.877' AS DateTime), 1, N'123')
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (20, N'Chemistry', N'chemistry', NULL, 50, 1, 0, NULL, CAST(N'2021-04-27T14:54:05.603' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (21, N'Volleyball', N'volleyball', NULL, 25, 1, 0, NULL, CAST(N'2021-04-27T14:56:45.443' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (22, N'sadsa', N'dsadsadas', NULL, 2, 2, 0, NULL, CAST(N'2021-05-05T22:08:22.303' AS DateTime), 0, NULL)
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (25, N'Test', N'Test', NULL, 12, 3, 1, NULL, CAST(N'2021-05-20T13:06:43.783' AS DateTime), 1, N'123')
INSERT [dbo].[Rooms] ([Id], [RoomName], [Description], [Link], [MaxUserCount], [CreatedUserId], [IsActive], [IsDeleted], [CreatedDate], [IsPrivate], [Password]) VALUES (27, N'Deneme 2', N'Deneme 2', NULL, 20, 3, 0, NULL, CAST(N'2021-05-20T13:27:39.127' AS DateTime), 1, N'1234')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomUsers] ON 

INSERT [dbo].[RoomUsers] ([Id], [UserId], [RoomId]) VALUES (2066, 3, 10)
SET IDENTITY_INSERT [dbo].[RoomUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [RoleId], [Gender]) VALUES (1, N'Dursuncan', N'Aydemir', N'dursuncan@gmail.com', N'123456', 1, 1)
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [RoleId], [Gender]) VALUES (2, N'Emre', N'Cinoğlu', N'emre@gmail.com', N'28282', 5, 1)
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [RoleId], [Gender]) VALUES (3, N'Barış', N'Temiz', N'baris@gmail.com', N'12345', 2, 1)
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [RoleId], [Gender]) VALUES (4, N'Yasemin', N'Nukan', N'yasemin@gmail.com', N'12345', 2, 0)
INSERT [dbo].[Users] ([Id], [Name], [Surname], [Email], [Password], [RoleId], [Gender]) VALUES (16, N'Çağdaş', N'Özer', N'cagdas@gmail.com', N'12345', 4, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Rooms]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_RoleActions_Actions] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([Id])
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_RoleActions_Actions]
GO
ALTER TABLE [dbo].[RoleActions]  WITH CHECK ADD  CONSTRAINT [FK_RoleActions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RoleActions] CHECK CONSTRAINT [FK_RoleActions_Roles]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users]
GO
ALTER TABLE [dbo].[RoomUsers]  WITH CHECK ADD  CONSTRAINT [FK_RoomUsers_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[RoomUsers] CHECK CONSTRAINT [FK_RoomUsers_Rooms]
GO
ALTER TABLE [dbo].[RoomUsers]  WITH CHECK ADD  CONSTRAINT [FK_RoomUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[RoomUsers] CHECK CONSTRAINT [FK_RoomUsers_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
