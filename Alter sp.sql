USE [Bazooka]
GO
/****** Object:  StoredProcedure [Automation].[spGreatMinds_GetLoadUpdates]    Script Date: 4/21/2021 3:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

ALTER PROCEDURE [Automation].[spGreatMinds_GetLoadUpdates]
    @MinsFromNowStart INT,
    @MinsFromNowEnd INT,
    @CustomerId INT
AS
BEGIN

    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    SET XACT_ABORT ON;

    DECLARE @StartDate AS DATETIME = DATEADD(MINUTE, @MinsFromNowStart, GETDATE());
    DECLARE @EndDate AS DATETIME = DATEADD(MINUTE, @MinsFromNowEnd, GETDATE());

    SELECT orderNum.Number AS OrderNumber,
           ShipNum.Number AS ShipmentNumber,
           l.ID AS LoadId,
           car.SCAC AS Carrier,
           lCar.Name AS CarrierName,
           lCar.BookNumber AS ProNumber,
           l.TotalRate AS FreightCharge,
           l.ProgressType AS ProgressType,
           l.StateType AS StateType,
           lStop.LoadByDate AS ShippedDate
    FROM dbo.Load l
        JOIN dbo.LoadCustomer lCust
            ON l.ID = lCust.LoadID
        JOIN dbo.LoadCarrier lCar
            ON l.ID = lCar.LoadID
        JOIN dbo.Carrier car
            ON lCar.CarrierID = car.ID
        JOIN dbo.LoadStop lStop
            ON l.ID = lStop.LoadID
        LEFT JOIN dbo.MultiNumber orderNum
            ON lCust.ID = orderNum.EntityID AND orderNum.NumberType = 8 AND orderNum.EntityType = 12 
        LEFT JOIN dbo.MultiNumber shipNum
            ON lCust.ID = shipNum.EntityID  AND shipNum.NumberType = 1 AND shipNum.EntityType = 12  AND ShipNum.Number like 'S0%' 
    WHERE (
              l.StateType = 2 -- StateType Cancelled
              OR l.ProgressType = 3 -- ProgressType Dispatched
          )  
   
          AND orderNum.NumberType = 8
          AND orderNum.EntityType = 12 
          AND lStop.Type = 1 -- PickUp StopType
          AND lCar.Main = 1
          AND lCust.Main = 1
          AND l.UpdateDate
          BETWEEN @StartDate AND @EndDate
          AND lCust.CustomerID = @CustomerId;

END
