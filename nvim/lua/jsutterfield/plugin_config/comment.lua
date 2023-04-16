local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	print("Comment couldn't be loaded")
	return
end

comment.setup()
