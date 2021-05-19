INSERT INTO [dbo].[SpotQuoteManagementLog]
           ([CustomerCode]
           ,[RestURL]
           ,[Input]
           ,[IsSuccess]
           ,[BazookaSpotQuoteID]
           ,[Output]
           ,[CreateDate]
           ,[Action]
           ,[MethodName]
           ,[RobotName]
           ,[ExecutionId]
           ,[LastUpdated]
           ,ReferenceNumber)
     VALUES
           ('QUAOATOH'
           ,'http://prospotqmapi-fast.coyote.com/COYOTE.PROCUREMENT.SPOT.QUOTEMANAGEMENT.WEB.API/api/v1.0/spotquotes?applicationSource=5'
           ,'{
  "AvailableDate" : "2021-04-06T08:21:36Z",
  "AvailableDateUTC" : "2021-04-06T13:21:36Z",
  "customerId" : 23540,
  "contactId" : 0,
  "equipmentType" : 1,
  "equipmentLength" : 0,
  "equipmentWidth" : 0,
  "equipmentHeight" : 0,
  "originCityId" : 7672,
  "destinationCityId" : 13505,
  "distance" : 491,
  "customerDistance" : 491,
  "isWinner" : false,
  "internalNotes" : "",
  "weight" : 45119.0,
  "dropTrailerOptions" : 1,
  "estimatedCost" : 0,
  "totalRate" : 3390.0,
  "dateQuotedUTC" : "2021-04-06T14:35:47Z",
  "dateQuoted" : "2021-04-06T09:35:47Z",
  "expectedShipmentDate" : "1753-01-01T00:00:00",
  "expectedShipmentToDate" : "1753-01-01T00:00:00",
  "numberOfLoads" : 1,
  "numberOfWinningLoads" : 0,
  "isHazmat" : false,
  "isDropTrailer" : false,
  "isFreezeProtect" : false,
  "mode" : 1,
  "expectedShipmentDateUTC" : "1753-01-01T05:00:00",
  "expectedShipmentToDateUTC" : "1753-01-01T05:00:00",
  "originZip" : "46201      ",
  "destinationZip" : "64701-1224",
  "originStateId" : 16,
  "destinationStateId" : 25,
  "validUntil" : "1753-01-22T00:00:00",
  "sourceType" : 5,
  "includeFuel" : false,
  "transitDays" : 0,
  "temperature" : 0,
  "quoteDetails" : [
                     {
                       "spotQuoteDetailId" : 0,
                       "chargeCodeId" : 1,
                       "ratePerUnit" : 3390.0,
                       "totalRate" : 3390.0,
                       "unitsInDecimal" : 1,
                       "spotQuoteId" : 0,
                       "createDate" : "2021-04-09T10:54:22Z",
                       "createDateUTC" : "2021-04-09T15:54:22Z",
                       "updateDate" : "2021-04-09T10:54:22Z",
                       "updateDateUTC" : "2021-04-09T15:54:22Z",
                       "createByUserId" : 506181,
                       "updateByUserId" : 506181
                     }
                   ],
  "quoteStops" : [
                   {
                     "spotQuoteStopId" : 0,
                     "sequenceNumber" : 2,
                     "cityId" : 13505,
                     "stateId" : 25,
                     "zipCode" : "64701-1224",
                     "cityName" : "Harrisonville",
                     "stateCode" : "MO",
                     "latitude" : 38.653,
                     "longitude" : -94.349,
                     "spotQuoteId" : 0,
                     "createDate" : "2021-04-09T10:54:22Z",
                     "createDateUTC" : "2021-04-09T15:54:22Z",
                     "updateDate" : "2021-04-09T10:54:22Z",
                     "updateDateUTC" : "2021-04-09T15:54:22Z",
                     "createByUserId" : 506181,
                     "updateByUserId" : 506181
                   },
                   {
                     "spotQuoteStopId" : 0,
                     "sequenceNumber" : 1,
                     "cityId" : 7672,
                     "stateId" : 16,
                     "zipCode" : "46201      ",
                     "cityName" : "Indianapolis",
                     "stateCode" : "IN",
                     "latitude" : 39.768,
                     "longitude" : -86.158,
                     "spotQuoteId" : 0,
                     "createDate" : "2021-04-09T10:54:22Z",
                     "createDateUTC" : "2021-04-09T15:54:22Z",
                     "updateDate" : "2021-04-09T10:54:22Z",
                     "updateDateUTC" : "2021-04-09T15:54:22Z",
                     "createByUserId" : 506181,
                     "updateByUserId" : 506181
                   }
                 ],
  "quoteAttributes" : {
                        "spotQuoteAttributeId" : 0,
                        "isBlind" : false,
                        "isFloodRelief" : false,
                        "isGovt" : false,
                        "isHRHV" : false,
                        "isLiquor" : false,
                        "isSeal" : false,
                        "isPowerOnly" : false,
                        "isDrayage" : false,
                        "isPPE" : false,
                        "isAirRide" : false,
                        "isTCR" : false,
                        "isExitPass" : false,
                        "isDisasterRelief" : false,
                        "isTrailerControl" : false,
                        "isTeam" : false,
                        "isTwic" : false,
                        "isOverDimension" : false,
                        "isCtpat" : false,
                        "isTankerEndorsement" : false,
                        "isBondedCarrier" : false,
                        "isPalletJack" : false,
                        "isEnglishSpeaking" : false,
                        "isDuraplate" : false,
                        "isHVHRPlus" : false,
                        "isTradeShow" : false,
                        "isIntraMexico" : false,
                        "isDoubleTrailer" : false,
                        "isTripleTrailer" : false,
                        "isCoyoteGO" : false,
                        "isUIIA" : false,
                        "spotQuoteId" : 0,
                        "createDate" : "2021-04-09T10:54:22Z",
                        "createDateUTC" : "2021-04-09T15:54:22Z",
                        "updateDate" : "2021-04-09T10:54:22Z",
                        "updateDateUTC" : "2021-04-09T15:54:22Z",
                        "createByUserId" : 0,
                        "updateByUserId" : 0
                      },
  "quoteWinningLoads" : [],
  "marketRate" : 0.0,
  "marketCost" : 0.0,
  "spotQuoteId" : 0,
  "createDate" : "2021-04-09T10:54:22Z",
  "createDateUTC" : "2021-04-09T15:54:22Z",
  "updateDate" : "2021-04-09T10:54:22Z",
  "updateDateUTC" : "2021-04-09T15:54:22Z",
  "createByUserId" : 506181,
  "updateByUserId" : 506181,
  "website" : "JDA",
  "rate" : 0,
  "referenceNumber" : "55632922"
}'
           ,0
           ,NULL
           ,'{"isSuccess":false,"message":"Validation failed: \r\n -- ExpectedShipmentDate.Date: 'Date' must not be equal to '1/1/1753 12:00:00 AM'.\r\n -- ExpectedShipmentToDate.Date: 'Date' must not be equal to '1/1/1753 12:00:00 AM'.","result":null}'
           ,'2021-04-09 11:54:25.782'
           ,'POST'
           ,'SpotQuotes'
           ,'SpotQuoteConsumer1-3'
           ,'DesignStudiob8077d110000001e'
           ,GETDATE()
           ,'55632922')

