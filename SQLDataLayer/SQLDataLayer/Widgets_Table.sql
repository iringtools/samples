USE [master]
GO

IF EXISTS(SELECT name FROM sys.databases WHERE name = 'iringsdk')
	DROP DATABASE [IRINGSDK]
GO

CREATE DATABASE [IRINGSDK] 
GO

IF EXISTS(SELECT * FROM sys.syslogins WHERE name = N'iringsdk')
	DROP LOGIN [iringsdk]
GO

CREATE LOGIN [iringsdk] WITH PASSWORD = 'iringsdk', CHECK_POLICY = OFF
GO

USE [IRINGSDK]
GO

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'iringsdk') 
	DROP USER [airingsdkbc]
GO

CREATE USER [iringsdk] FOR LOGIN [iringsdk] WITH DEFAULT_SCHEMA=[dbo]
GO

EXEC sp_addrolemember 'db_owner', N'iringsdk'
GO

IF EXISTS (SELECT * FROM sys.all_objects WHERE name = N'Widgets')
	DROP TABLE [dbo].[Widgets]
GO

CREATE TABLE [dbo].[Widgets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NULL,
	[description] [varchar](256) NULL,
	[length] [float] NULL,
	[width] [float] NULL,
	[height] [float] NULL,
	[weight] [float] NULL,
	[uomLength] [varchar](32) NULL,
	[uomWeight] [varchar](32) NULL,
	[material] [varchar](128) NULL,
	[color] [varchar](32) NULL,
 CONSTRAINT [PK_Widgets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
