USE [4141]
GO
/****** Object:  Table [dbo].[CountryPrimary]    Script Date: 8/25/2022 6:10:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryPrimary](
	[CountryID] [int] NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryCurrency] [varchar](100) NOT NULL,
	[CountryCurrencySymbol] [varchar](100) NOT NULL,
	[ExchangeRate(Reference PKR)] [float] NOT NULL,
	[TAXOnEachPenaltyDay(%)] [float] NOT NULL,
 CONSTRAINT [PK_CountryPrimary] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialDays]    Script Date: 8/25/2022 6:10:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialDays](
	[HolidayID] [int] NOT NULL,
	[HolidayName] [varchar](200) NOT NULL,
	[HolidayDate] [date] NOT NULL,
	[HolidayCountryID] [int] NOT NULL,
 CONSTRAINT [PK_SpecialDays] PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeekendCountryDays]    Script Date: 8/25/2022 6:10:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeekendCountryDays](
	[WeekendID] [int] NOT NULL,
	[WeekendDay] [varchar](100) NOT NULL,
	[WekendCountryID] [int] NOT NULL,
 CONSTRAINT [PK_WeekendCountryDays] PRIMARY KEY CLUSTERED 
(
	[WeekendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CountryPrimary] ([CountryID], [CountryName], [CountryCurrency], [CountryCurrencySymbol], [ExchangeRate(Reference PKR)], [TAXOnEachPenaltyDay(%)]) VALUES (1, N'Pakistan', N'Rupee', N'PKR', 1, 0)
INSERT [dbo].[CountryPrimary] ([CountryID], [CountryName], [CountryCurrency], [CountryCurrencySymbol], [ExchangeRate(Reference PKR)], [TAXOnEachPenaltyDay(%)]) VALUES (2, N'UAE', N'Dirham', N'AED', 0.017, 8)
GO
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (1, N' Kashmir Day ', CAST(N'2022-02-05' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (2, N'Pakistan Day', CAST(N'2022-03-23' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (3, N'Labour Day', CAST(N'2022-05-01' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (4, N'Eid-ul-Fitar', CAST(N'2022-05-03' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (5, N'Eid-ul-Fitar', CAST(N'2022-05-04' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (6, N'Eid-ul-Fitar', CAST(N'2022-05-05' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (7, N'Eid-ul-Azha', CAST(N'2022-07-10' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (8, N'Eid-ul-Azha', CAST(N'2022-07-11' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (9, N'Eid-ul-Azha', CAST(N'2022-07-12' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (10, N'Ashura', CAST(N'2022-08-07' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (11, N'Ashura', CAST(N'2022-08-08' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (12, N'Independence Day ', CAST(N'2022-08-14' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (13, N'Eid Milad-un-Nabi', CAST(N'2022-10-09' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (14, N'Quaid-e-Azam Day', CAST(N'2022-12-25' AS Date), 1)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (15, N'Eid-ul-Fitar', CAST(N'2022-05-02' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (16, N'Eid-ul-Fitar', CAST(N'2022-05-03' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (17, N'Eid-ul-Fitar', CAST(N'2022-05-04' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (18, N'Eid-ul-Azha', CAST(N'2022-07-09' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (19, N'Eid-ul-Azha', CAST(N'2022-07-10' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (20, N'Eid-ul-Azha', CAST(N'2022-07-11' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (21, N'
Day of Arafat', CAST(N'2022-07-08' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (22, N'Islamic New Year', CAST(N'2022-07-30' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (23, N'Prophet''s Birthday', CAST(N'2022-10-08' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (24, N'Commemoration Day', CAST(N'2022-11-30' AS Date), 2)
INSERT [dbo].[SpecialDays] ([HolidayID], [HolidayName], [HolidayDate], [HolidayCountryID]) VALUES (25, N'
National Day', CAST(N'2022-12-02' AS Date), 2)
GO
INSERT [dbo].[WeekendCountryDays] ([WeekendID], [WeekendDay], [WekendCountryID]) VALUES (1, N'Saturday', 1)
INSERT [dbo].[WeekendCountryDays] ([WeekendID], [WeekendDay], [WekendCountryID]) VALUES (2, N'Sunday', 1)
INSERT [dbo].[WeekendCountryDays] ([WeekendID], [WeekendDay], [WekendCountryID]) VALUES (3, N'Friday', 2)
INSERT [dbo].[WeekendCountryDays] ([WeekendID], [WeekendDay], [WekendCountryID]) VALUES (4, N'Saturday', 2)
GO
ALTER TABLE [dbo].[CountryPrimary] ADD  DEFAULT ('0') FOR [TAXOnEachPenaltyDay(%)]
GO
ALTER TABLE [dbo].[SpecialDays]  WITH CHECK ADD  CONSTRAINT [FK_SpecialDays_CountryPrimary] FOREIGN KEY([HolidayCountryID])
REFERENCES [dbo].[CountryPrimary] ([CountryID])
GO
ALTER TABLE [dbo].[SpecialDays] CHECK CONSTRAINT [FK_SpecialDays_CountryPrimary]
GO
ALTER TABLE [dbo].[WeekendCountryDays]  WITH CHECK ADD  CONSTRAINT [FK_WeekendCountryDays_CountryPrimary] FOREIGN KEY([WekendCountryID])
REFERENCES [dbo].[CountryPrimary] ([CountryID])
GO
ALTER TABLE [dbo].[WeekendCountryDays] CHECK CONSTRAINT [FK_WeekendCountryDays_CountryPrimary]
GO
/****** Object:  StoredProcedure [dbo].[spGetCountryListwithSpecialDays]    Script Date: 8/25/2022 6:10:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCountryListwithSpecialDays] 
AS
BEGIN
Select CountryID,CountryName,CountryCurrency,CountryCurrencySymbol,[ExchangeRate(Reference PKR)],[TAXOnEachPenaltyDay(%)],HolidayName,HolidayDate from dbo.CountryPrimary
FULL OUTER JOIN dbo.SpecialDays
ON CountryPrimary.CountryID=SpecialDays.HolidayCountryID
END
GO
