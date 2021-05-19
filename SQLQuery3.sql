
/*
// /////////////////////////////////////////////////////////////////////////////////////
//                           Copyright (c) 2014 - 2020
//                            Coyote Logistics L.L.C.
//                          All Rights Reserved Worldwide
//
// WARNING:  This program (or document) is unpublished, proprietary
// property of Coyote Logistics L.L.C. and is to be maintained in strict confidence.
// Unauthorized reproduction, distribution or disclosure of this program
// (or document), or any program (or document) derived from it is
// prohibited by State and Federal law, and by local law outside of the U.S.
// /////////////////////////////////////////////////////////////////////////////////////
*/

declare @StartDate as DATETIME = dateadd(day,-10,getdate()) 
    IF OBJECT_ID('tempdb.dbo.#FirestoneLoads', 'U') IS NOT NULL
        DROP TABLE #FirestoneLoads
    SELECT l.ID AS 'LoadID',
           l.progresstype,
           mn1.number AS 'MultiNumber1',
           mn2.number AS 'MultiNumber2',
           ls.arrivedatetime,
           ls.arriveupdatedate,
           ls.departdatetime,
           ls.departupdatedate,
           ls.[type],
           ls.[sequence]
    INTO #FirestoneLoads
    FROM dbo.[Load] l
        INNER JOIN dbo.LoadCustomer lcus
            ON lcus.LoadID = l.ID
        INNER JOIN dbo.LoadStop ls
            on ls.LoadId = l.id
        INNER JOIN dbo.MultiNumber mn1
            on mn1.EntityId = lcus.Id
        INNER JOIN dbo.MultiNumber mn2
            on mn2.EntityId = ls.Id
    WHERE lcus.CustomerID = 76501
          AND mn1.EntityType = 12 --loadcustomer
          AND mn1.NumberType = 1 --reference numbers
          AND mn2.EntityType = 14 --loadstop ref numbers
          AND mn2.NumberType = 2 --pu numbers
          AND lcus.Main = 1
          AND l.Mode = 1
          AND l.StateType = 1
          AND l.ProgressType
          BETWEEN 3 AND 7 --dispatched through picked up
          AND (
                  ls.arriveupdatedate <> '1753-01-01 00:00:00.000'
                  AND ls.departupdatedate <> '1753-01-01 00:00:00.000'
              )
          AND l.LoadDate > @StartDate;

    IF OBJECT_ID('tempdb.dbo.#FirestoneLoadsWithTracking', 'U') IS NOT NULL
        DROP TABLE #FirestoneLoadsWithTracking
    SELECT lt.Loadid,
           ROW_NUMBER() OVER (PARTITION BY lt.LoadId ORDER BY lt.Id DESC) as 'row',
           lt.EntryDate as 'trackingnoteentrydate',
           lt.CityID,
           lc.Latitude,
           lc.Longitude,
           lt.NextStopDistanceMiles
    INTO #FirestoneLoadsWithTracking
    FROM dbo.LoadTracking lt
        INNER JOIN dbo.#FirestoneLoads fl
            on fl.loadid = lt.loadid
        INNER JOIN dbo.LocationCity lc
            ON lc.cityId = lt.cityId

    SELECT fl.LoadID,
           fl.ProgressType,
		   fl.MultiNumber1,
		   fl.MultiNumber2,
           fl.ArriveDateTime,
           fl.ArriveUpdateDate,
           fl.DepartDatetime,
           fl.DepartUpdateDate,
           fl.[Type],
           fl.[Sequence],
           flt.CityID,
           flt.Latitude,
           flt.Longitude,
           flt.NextStopDistanceMiles,
           flt.trackingnoteentrydate
    FROM dbo.#FirestoneLoads fl
        INNER JOIN dbo.#FirestoneLoadsWithTracking flt
            on flt.loadid = fl.loadid
    WHERE flt.[row] = 1
