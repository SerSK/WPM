USE [WebDevServer]
GO

UPDATE [dbo].[control_command]
   SET [welding_post_id] = (SELECT [welding_post].[id] FROM [welding_post]  WHERE [welding_post].[name] = [equipment].[name])
FROM [equipment]
WHERE [equipment].[id] = [control_command].[equipment_id]

GO


