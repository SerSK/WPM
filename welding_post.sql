DELETE FROM [welding_post]

DBCC CHECKIDENT ('welding_post', RESEED, 0) 

INSERT INTO [welding_post] 
( 
		[name]
		,[is_active]
		,[facility_id]
		,[unit_welding_id]
		,[unit_monitoring_id]
		,[pult_id]
		,[worktime_id]
		,[time_operation]
		,[related_time]
		,[pos2d_x]
		,[pos2d_y]
		,[inf]
)
SELECT  
		[equipment].[name], 
		[equipment].[is_active],
		[equipment].[facility_id],
		[unit_welding_id] = (SELECT [id] FROM [unit_welding] WHERE [unit_welding].[name] = [equipment].[name]),
		[unit_monitoring_id] = (SELECT [id] FROM [unit_monitoring] WHERE [unit_monitoring].[name] = [equipment].[name]),
		NULL,
		1,
		0,
		0,
		[equipment].[pos2d_x],
		[equipment].[pos2d_y],
		[equipment].[inf]
FROM    [equipment]

