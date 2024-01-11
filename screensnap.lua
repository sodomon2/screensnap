local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")
local Gdk = lgi.require("Gdk", "3.0")
local GdkPixbuf = lgi.require("GdkPixbuf", "2.0")

local help =[[
Test usage:
	screensnap [filename] [file_type]

example:
	screensnap screenshot.jpg jpg
]]

local win = Gdk:get_default_root_window()
local height = win:get_height()
local width = win:get_width()

function screenshot(filename, file_type)
	pb = Gdk.pixbuf_get_from_window(win, 0, 0, width, height)
	pb:savev(filename, file_type, nil, nil)
end

if #arg == 0 then
	print(help)
else
	screenshot(arg[1], arg[2])
end
