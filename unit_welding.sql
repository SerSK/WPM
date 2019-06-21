DELETE FROM [unit_monitoring]

DBCC CHECKIDENT ('unit_welding', RESEED, 0) 

INSERT INTO [unit_welding] 
( 
        [equipment_model_id]
        ,[is_active]
        ,[name]
        ,[inventory_number]
        ,[serial_number]
        ,[date_begin]
        ,[inf]
        ,[barcode]
)
SELECT  
		[equipment].[equipment_model_id],
		[equipment].[is_active],
		[equipment].[name], 
		[equipment].[inventory_number_2], 
		[equipment].[serial_number_2],
		[equipment].[date_begin_2],
		[equipment].[inf],
		[equipment].[barcode]
FROM    [equipment]

