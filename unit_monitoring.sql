DELETE FROM [unit_monitoring]

DBCC CHECKIDENT ('unit_monitoring', RESEED, 0) 

INSERT INTO [unit_monitoring] 
( 
    [is_active]
    ,[name]
    ,[inventory_number]
    ,[serial_number]
    ,[date_begin]
    ,[mac]
    ,[gsm_num]
    ,[imei]
    ,[inf]
    ,[_wifi]
    ,[_navigreciever]
    ,[_barscan]
    ,[_wiremeter]
    ,[_gazmeter]
    ,[_energymeter]
    ,[_lightcolumn]
    ,[_clocks]
    ,[_intmemory]
    ,[type_protocol]
    ,[barcode]
)
SELECT  [equipment].[is_active],
		[equipment].[name], 
		[equipment].[inventory_number], 
		[equipment].[serial_number],
		[equipment].[date_begin],
		[equipment].[mac],
		[equipment].[gsm_num],
		[equipment].[imei],
		[equipment].[inf],
		[equipment].[_wifi],
		[equipment].[_navigreciever],
		[equipment].[_barscan],
		[equipment].[_wiremeter],
		[equipment].[_gazmeter],
		[equipment].[_energymeter],
		[equipment].[_lightcolumn],
		[equipment].[_clocks],
		[equipment].[_intmemory],
		[type_protocol] = (SELECT [type_protocol] FROM [equipment_model] WHERE [equipment_model].[id] = [equipment].[equipment_model_id]),
		[equipment].[barcode]
FROM    [equipment]

