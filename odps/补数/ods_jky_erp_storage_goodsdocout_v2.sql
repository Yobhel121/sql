SELECT
  CONCAT(
    '{"code": 200,"developerInfo": "","msg": "查询成功！","result": {"contextId": "2349844539783250176","data": ',
        '[',
            '"applyCompanyCode":"', COALESCE(CAST(applyCompanyCode AS STRING), ''), '",',
            '"applyCompanyId":"', COALESCE(CAST(applyCompanyId AS STRING), ''), '",',
            '"applyCompanyName":"', COALESCE(CAST(applyCompanyName AS STRING), ''), '",',
            '"applyDepartId":"', COALESCE(CAST(applyDepartId AS STRING), ''), '",',
            '"applyDepartName":"', COALESCE(CAST(applyDepartName AS STRING), ''), '",',
            '"applyUserId":"', COALESCE(CAST(applyUserId AS STRING), ''), '",',
            '"applyUserName":"', COALESCE(CAST(applyUserName AS STRING), ''), '",',
            '"billNo":"', COALESCE(CAST(billNo AS STRING), ''), '",',
            '"channelCode":"', COALESCE(CAST(channelCode AS STRING), ''), '",',
            '"channelId":"', COALESCE(CAST(channelId AS STRING), ''), '",',
            '"channelName":"', COALESCE(CAST(channelName AS STRING), ''), '",',
            '"comment":"', COALESCE(CAST(comment AS STRING), ''), '",',
            '"companyCode":"', COALESCE(CAST(companyCode AS STRING), ''), '",',
            '"companyId":"', COALESCE(CAST(companyId AS STRING), ''), '",',
            '"companyName":"', COALESCE(CAST(companyName AS STRING), ''), '",',
            '"currencyCode":"', COALESCE(CAST(currencyCode AS STRING), ''), '",',
            '"currencyRate":"', COALESCE(CAST(currencyRate AS STRING), ''), '",',
            '"departCode":"', COALESCE(CAST(departCode AS STRING), ''), '",',
            '"field1":"', COALESCE(CAST(field1 AS STRING), ''), '",',
            '"field10":"', COALESCE(CAST(field10 AS STRING), ''), '",',
            '"field2":"', COALESCE(CAST(field2 AS STRING), ''), '",',
            '"field3":"', COALESCE(CAST(field3 AS STRING), ''), '",',
            '"field4":"', COALESCE(CAST(field4 AS STRING), ''), '",',
            '"field5":"', COALESCE(CAST(field5 AS STRING), ''), '",',
            '"field6":"', COALESCE(CAST(field6 AS STRING), ''), '",',
            '"field7":"', COALESCE(CAST(field7 AS STRING), ''), '",',
            '"field8":"', COALESCE(CAST(field8 AS STRING), ''), '",',
            '"field9":"', COALESCE(CAST(field9 AS STRING), ''), '",',
            '"financeBillStatus":"', COALESCE(CAST(financeBillStatus AS STRING), ''), '",',
            '"gmtCreate":"', COALESCE(CAST(gmtCreate AS STRING), ''), '",',
            '"gmtModified":"', COALESCE(CAST(gmtModified AS STRING), ''), '",',
            '"goodsDocDetailList":"', COALESCE(CAST(goodsDocDetailList AS STRING), ''), '",',
            '"goodsdocNo":"', COALESCE(CAST(goodsdocNo AS STRING), ''), '",',
            '"inOutDate":"', COALESCE(CAST(inOutDate AS STRING), ''), '",',
            '"inOutReason":"', COALESCE(CAST(inOutReason AS STRING), ''), '",',
            '"inouttype":"', COALESCE(CAST(inouttype AS STRING), ''), '",',
            '"inouttypeName":"', COALESCE(CAST(inouttypeName AS STRING), ''), '",',
            '"logisticCode":"', COALESCE(CAST(logisticCode AS STRING), ''), '",',
            '"logisticList":"', COALESCE(CAST(logisticList AS STRING), ''), '",',
            '"logisticName":"', COALESCE(CAST(logisticName AS STRING), ''), '",',
            '"logisticNo":"', COALESCE(CAST(logisticNo AS STRING), ''), '",',
            '"logisticType":"', COALESCE(CAST(logisticType AS STRING), ''), '",',
            '"memo":"', COALESCE(CAST(memo AS STRING), ''), '",',
            '"outBillNo":"', COALESCE(CAST(outBillNo AS STRING), ''), '",',
            '"recId":"', COALESCE(CAST(recId AS STRING), ''), '",',
            '"receive":"', COALESCE(CAST(receive AS STRING), ''), '",',
            '"receiveAddress":"', COALESCE(CAST(receiveAddress AS STRING), ''), '",',
            '"receiveCityName":"', COALESCE(CAST(receiveCityName AS STRING), ''), '",',
            '"receiveCompanyName":"', COALESCE(CAST(receiveCompanyName AS STRING), ''), '",',
            '"receiveCountryName":"', COALESCE(CAST(receiveCountryName AS STRING), ''), '",',
            '"receiveEmail":"', COALESCE(CAST(receiveEmail AS STRING), ''), '",',
            '"receivePhone":"', COALESCE(CAST(receivePhone AS STRING), ''), '",',
            '"receiveProvinceName":"', COALESCE(CAST(receiveProvinceName AS STRING), ''), '",',
            '"receiveStreetName":"', COALESCE(CAST(receiveStreetName AS STRING), ''), '",',
            '"receiveTel":"', COALESCE(CAST(receiveTel AS STRING), ''), '",',
            '"receiveTownName":"', COALESCE(CAST(receiveTownName AS STRING), ''), '",',
            '"redStatus":"', COALESCE(CAST(redStatus AS STRING), ''), '",',
            '"send":"', COALESCE(CAST(send AS STRING), ''), '",',
            '"sendAddress":"', COALESCE(CAST(sendAddress AS STRING), ''), '",',
            '"sendCityName":"', COALESCE(CAST(sendCityName AS STRING), ''), '",',
            '"sendCompanyName":"', COALESCE(CAST(sendCompanyName AS STRING), ''), '",',
            '"sendCountryName":"', COALESCE(CAST(sendCountryName AS STRING), ''), '",',
            '"sendEmail":"', COALESCE(CAST(sendEmail AS STRING), ''), '",',
            '"sendPhone":"', COALESCE(CAST(sendPhone AS STRING), ''), '",',
            '"sendProvinceName":"', COALESCE(CAST(sendProvinceName AS STRING), ''), '",',
            '"sendStreetName":"', COALESCE(CAST(sendStreetName AS STRING), ''), '",',
            '"sendTel":"', COALESCE(CAST(sendTel AS STRING), ''), '",',
            '"sendTownName":"', COALESCE(CAST(sendTownName AS STRING), ''), '",',
            '"sourceBillNo":"', COALESCE(CAST(sourceBillNo AS STRING), ''), '",',
            '"userName":"', COALESCE(CAST(userName AS STRING), ''), '",',
            '"vendCustomerId":"', COALESCE(CAST(vendCustomerId AS STRING), ''), '",',
            '"vendCustomerName":"', COALESCE(CAST(vendCustomerName AS STRING), ''), '",',
            '"warehouseCode":"', COALESCE(CAST(warehouseCode AS STRING), ''), '",',
            '"warehouseName":"', COALESCE(CAST(warehouseName AS STRING), ''), '"',
        ']',
    ',"desensitizationItem": [],"handlerInfo": '',"noPrivilegeItem": '',"pageInfo": {"expand": '',"offset": 0,"pageIndex": 0,"pageSize": 100,"sortField": "","sortOrder": "ASC","total": 0}},"subCode": "0033100001"}'
  ) as json_result
FROM qtmm_test.tmp_erp_storage_goodsdocout_v2
WHERE pt = '20250101'
LIMIT 10;





select * from ods_jky_warehouse_info where dt = '20251116' limit 10 ;





-- {"code": 200,"developerInfo": "","msg": "查询成功！","result": {"contextId": "2349844539783250176","data":
--     [

--     ]
-- ,"desensitizationItem": [],"handlerInfo": '',"noPrivilegeItem": '',"pageInfo": {"expand": '',"offset": 0,"pageIndex": 0,"pageSize": 100,"sortField": "","sortOrder": "ASC","total": 0}},"subCode": "0033100001"}