USE [WebDevServer]
GO

UPDATE [dbo].[equipment_state]
   SET [welding_post_id] = (SELECT [welding_post].[id] FROM [welding_post]  WHERE [welding_post].[name] = [equipment].[name])
FROM [equipment]
WHERE [equipment].[id] = [equipment_state].[equipment_id]

GO


