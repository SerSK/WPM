USE [WebDevServer]
GO

UPDATE [dbo].[pult_state]
   SET [welding_post_id] = (SELECT [welding_post].[id] FROM [welding_post]  WHERE [welding_post].[name] = [equipment].[name])
FROM [equipment]
WHERE [equipment].[id] = [pult_state].[equipment_id]

GO


