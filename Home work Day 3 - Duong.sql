
----------- HOMEWORK DAY 3 - DUONG

--- SECTION I CALCULATIONS

--- EX 1.1
SELECT
	EventName,
	LEN(EventName) AS LENGTH,
	EventDate
FROM
	tblEvent
ORDER BY
	LEN(EventName) DESC;


---EX 1.2
SELECT
	EventName,
	CategoryID,
	CONCAT(EventName, ' ', 'ID', ' ', CategoryID) AS NAME_ID
FROM
	tblEvent;


---EX 1.3

SELECT
	ContinentName,
	Summary,
	ISNULL(Summary,
	'No Summary') AS [ISNULL],
	COALESCE(Summary,
	'No Summary') AS [ISNULL2],
	CASE
		WHEN Summary is null THEN 'No Summary'
		ELSE 'Summary'
	END AS [Modified]
FROM
	tblContinent;


---EX 1.4

SELECT
	CountryName, 
	CASE 
		WHEN ContinentID in (1,3) THEN 'Eurasia'
		WHEN ContinentID in (5,6) THEN 'Americas'
		WHEN ContinentID in (2,4) THEN 'Somewhere hot'
		WHEN ContinentID = 7 THEN 'Somewhere cold'
		ELSE 'Somewhere else'
	END AS [Continent]

FROM
	tblCountry
ORDER BY 
	[Continent] ASC;

---EX 1.5
SELECT
	Country,
	KmSquared,
	CONCAT((KmSquared / 20761), ' ', 'times') AS [How Bigger]
FROM
	CountriesByArea
ORDER BY
	(KmSquared / 20761) DESC;

---EX 1.6

SELECT
	EventName,
	LEFT(EventName,
	1),
	RIGHT(EventName,
	1)
FROM
	tblEvent
WHERE
	(LEFT(EventName,1 ) like 'a'
    or LEFT(EventName,1 ) like 'e'
	or LEFT(EventName,1 ) like 'u'
	or LEFT(EventName,1 ) like 'i'
	or LEFT(EventName,1 ) like 'o')
	AND
    (RIGHT (EventName,1) like 'a'
    or RIGHT (EventName,1) like 'e'
	or RIGHT (EventName,1) like 'u'
	or RIGHT (EventName,1) like 'i'
	or RIGHT (EventName,1) like 'o');


---EX 1.7

SELECT
	EventName,
	LEFT(EventName,1) as [begin =],
	RIGHT(EventName,1) as [end =]
FROM
	tblEvent
WHERE
	LEFT(EventName,1 ) = RIGHT (EventName,1);




-- SECTION II CALCULATIONS USING DATES
-- EX 2.1
SELECT 
	EventName,
	EventDate,
	FORMAT(EventDate,
	'dd/MM/yyyy') AS [FORMAT]
FROM
	tblEvent
WHERE
	year(EventDate) = 1991;


--EX 2.2

SELECT
	EventName,
	EventDate,
	FORMAT(EventDate,
	'dd/MM/yyyy') AS [FORMAT],
	DATEDIFF(day, EventDate, 1991-09-30) AS [DIFF],
	ABS(DATEDIFF(day, EventDate, 1991-09-30))
FROM
	tblEvent
WHERE
	year(EventDate) = 1991
ORDER BY
	ABS(DATEDIFF(day, EventDate, 1991-09-30)) asc;


--EX 2.3

SELECT
	EventName,
	EventDate,
	FORMAT(EventDate,
	'dd/MM/yyyy') AS [FORMAT],
	DATENAME(weekday, EventDate) AS Weekday,
	DATEPART(day, EventDate) AS DayNumber
FROM
	tblEvent
WHERE
DATENAME(weekday, EventDate) like '%Friday%'
	and
DATEPART(day, EventDate) = 13;

-----------------------
SELECT
	EventName,
	EventDate,
	FORMAT(EventDate,
	'dd/MM/yyyy') AS [FORMAT],
	DATENAME(weekday, EventDate) AS Weekday,
	DATEPART(day, EventDate) AS DayNumber
FROM
	tblEvent
WHERE
DATENAME(weekday, EventDate) = 'Thursday'
	and
DATEPART(day, EventDate) = 12;

-----------------------

SELECT
	EventName,
	EventDate,
	FORMAT(EventDate,
	'dd/MM/yyyy') AS [FORMAT],
	DATENAME(weekday, EventDate) AS Weekday,
	DATEPART(day, EventDate) AS DayNumber
FROM
	tblEvent
WHERE
DATENAME(weekday, EventDate) = 'Saturday'
	and
DATEPART(day, EventDate) = 14;


--EX 2.4

----- Version 1
SELECT
	EventName,
    concat(datename(weekday, EventDate), ' ',
           datename(day, EventDate), ' ',  
           CASE 
	WHEN datename(day, EventDate) in (01,21,31) then 'st'
	WHEN datename(day, EventDate) in (02,22) then 'nd'
	WHEN datename(day, EventDate) in (03,23) then 'rd'
	ELSE 'th'
           END, ' ', 
           datename(month, EventDate), ' ',  
           datename(year, EventDate)) AS [FullDate]
FROM  
tblEvent
ORDER BY EventDate ASC;


----- Version 2 full
SELECT
	EventName,
	datename(weekday, EventDate) as [DayName], 
	datename(day, EventDate) as [Day],
	datename(month, EventDate) as [Month],
	datename(year, EventDate) as [Year],
		
	Case 
	WHEN datename(day, EventDate) in (01,21,31) then 'st'
	WHEN datename(day, EventDate) in (02,22) then 'nd'
	WHEN datename(day, EventDate) in (03,23) then 'rd'
	ELSE 'th'
    END  as [ModDay],
	
    concat(datename(weekday, EventDate), ' ', datename(day, EventDate), ' ',
           CASE 
	WHEN datename(day, EventDate) in (01,21,31) then 'st'
	WHEN datename(day, EventDate) in (02,22) then 'nd'
	WHEN datename(day, EventDate) in (03,23) then 'rd'
	ELSE 'th'
           END, ' ', datename(month, EventDate), ' ',  datename(year, EventDate)) AS [FullDate]
FROM  
tblEvent
ORDER BY EventDate ASC; 
---------------


 
 