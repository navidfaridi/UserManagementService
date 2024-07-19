GO
CREATE TABLE [dbo].[ApplicationInfo](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](50) NOT NULL,
	[MaxConsurrentSessions] [int] NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ApplicationInfo_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationPermissions]    Script Date: 7/19/2024 8:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationId] [smallint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ApplicationPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoleInfo]    Script Date: 7/19/2024 8:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoleInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationId] [smallint] NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](1500) NULL,
	[Created] [datetimeoffset](7) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRolePermissions]    Script Date: 7/19/2024 8:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRolePermissions](
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
	[CreateDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_AppRolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserInfo]    Script Date: 7/19/2024 8:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](15) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](2000) NULL,
	[Salt] [nvarchar](1000) NULL,
	[Created] [datetimeoffset](7) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[LoginFailedCount] [int] NOT NULL,
	[LastLoginFailedDate] [datetimeoffset](7) NULL,
	[LastUpdateDate] [datetimeoffset](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_AppUsers_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserRoles]    Script Date: 7/19/2024 8:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[PermissionId] [int] NULL,
	[UserId] [int] NOT NULL,
	[Created] [datetimeoffset](7) NOT NULL,
	[CreateUserId] [int] NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSessions]    Script Date: 7/19/2024 8:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSessions](
	[UserId] [int] NOT NULL,
	[SessionToken] [nvarchar](100) NOT NULL,
	[ApplicationId] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastActivityTime] [datetimeoffset](7) NOT NULL,
	[CreateDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK__UserSess__53E3115EB15A7FF6] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[SessionToken] ASC,
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApplicationInfo] ON 
GO
INSERT [dbo].[ApplicationInfo] ([Id], [ApplicationName], [MaxConsurrentSessions], [UniqueId]) VALUES (1, N'Auth', 1, N'9c140c81-ae53-4366-b836-33d0ea91a258')
GO
SET IDENTITY_INSERT [dbo].[ApplicationInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[AppRoleInfo] ON 
GO
INSERT [dbo].[AppRoleInfo] ([Id], [ApplicationId], [Title], [Description], [Created], [UniqueId]) VALUES (2, 1, N'Admin', N'System Administrator', CAST(N'2024-05-25T09:06:37.6566667+00:00' AS DateTimeOffset), N'd83982d1-072a-4fbd-a6fc-1b2fee4b32d8')
GO
SET IDENTITY_INSERT [dbo].[AppRoleInfo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApplicationInfo_name]    Script Date: 7/19/2024 8:50:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApplicationInfo_name] ON [dbo].[ApplicationInfo]
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationInfo_uid]    Script Date: 7/19/2024 8:50:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ApplicationInfo_uid] ON [dbo].[ApplicationInfo]
(
	[UniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AppRole]    Script Date: 7/19/2024 8:50:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AppRole] ON [dbo].[AppRoleInfo]
(
	[ApplicationId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AppUserInfo_username]    Script Date: 7/19/2024 8:50:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AppUserInfo_username] ON [dbo].[AppUserInfo]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUsers_uniqueId]    Script Date: 7/19/2024 8:50:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AppUsers_uniqueId] ON [dbo].[AppUserInfo]
(
	[UniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AppUserRoles]    Script Date: 7/19/2024 8:50:04 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AppUserRoles] ON [dbo].[AppUserRoles]
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationInfo] ADD  CONSTRAINT [DF_ApplicationInfo_UniqueId]  DEFAULT (newid()) FOR [UniqueId]
GO
ALTER TABLE [dbo].[ApplicationPermissions] ADD  CONSTRAINT [DF_ApplicationPermissions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[AppRoleInfo] ADD  CONSTRAINT [DF_AppRoleInfo_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[AppRoleInfo] ADD  CONSTRAINT [DF_AppRoleInfo_UniqueId]  DEFAULT (newid()) FOR [UniqueId]
GO
ALTER TABLE [dbo].[AppRolePermissions] ADD  CONSTRAINT [DF_AppRolePermissions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[AppUserInfo] ADD  CONSTRAINT [DF_AspNetUsers_Id]  DEFAULT (newid()) FOR [UniqueId]
GO
ALTER TABLE [dbo].[AppUserInfo] ADD  CONSTRAINT [DF_AppUsers_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[AppUserInfo] ADD  CONSTRAINT [DF_AppUsers_IsActive]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[AppUserInfo] ADD  CONSTRAINT [DF_AppUserInfo_LoginFailCount]  DEFAULT ((0)) FOR [LoginFailedCount]
GO
ALTER TABLE [dbo].[AppUserRoles] ADD  CONSTRAINT [DF_AppUserRoles_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[UserSessions] ADD  CONSTRAINT [DF_UserSessions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ApplicationPermissions]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationPermissions_ApplicationInfo] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[ApplicationInfo] ([Id])
GO
ALTER TABLE [dbo].[ApplicationPermissions] CHECK CONSTRAINT [FK_ApplicationPermissions_ApplicationInfo]
GO
ALTER TABLE [dbo].[AppRoleInfo]  WITH CHECK ADD  CONSTRAINT [FK_AppRoleInfo_ApplicationInfo] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[ApplicationInfo] ([Id])
GO
ALTER TABLE [dbo].[AppRoleInfo] CHECK CONSTRAINT [FK_AppRoleInfo_ApplicationInfo]
GO
ALTER TABLE [dbo].[AppRolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_AppRolePermissions_ApplicationPermissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[ApplicationPermissions] ([Id])
GO
ALTER TABLE [dbo].[AppRolePermissions] CHECK CONSTRAINT [FK_AppRolePermissions_ApplicationPermissions]
GO
ALTER TABLE [dbo].[AppRolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_AppRolePermissions_AppRoleInfo] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoleInfo] ([Id])
GO
ALTER TABLE [dbo].[AppRolePermissions] CHECK CONSTRAINT [FK_AppRolePermissions_AppRoleInfo]
GO
ALTER TABLE [dbo].[AppUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AppUserRoles_ApplicationPermissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[ApplicationPermissions] ([Id])
GO
ALTER TABLE [dbo].[AppUserRoles] CHECK CONSTRAINT [FK_AppUserRoles_ApplicationPermissions]
GO
ALTER TABLE [dbo].[AppUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AppUserRoles_AppRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoleInfo] ([Id])
GO
ALTER TABLE [dbo].[AppUserRoles] CHECK CONSTRAINT [FK_AppUserRoles_AppRole]
GO
ALTER TABLE [dbo].[AppUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AppUserRoles_AppUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUserInfo] ([Id])
GO
ALTER TABLE [dbo].[AppUserRoles] CHECK CONSTRAINT [FK_AppUserRoles_AppUsers]
GO
ALTER TABLE [dbo].[UserSessions]  WITH CHECK ADD  CONSTRAINT [FK_UserSessions_AppUserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUserInfo] ([Id])
GO
ALTER TABLE [dbo].[UserSessions] CHECK CONSTRAINT [FK_UserSessions_AppUserInfo]
GO
