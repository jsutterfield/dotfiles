local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	print("autopairs couldn't be loaded")
	return
end

autopairs.setup()
