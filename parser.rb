require 'nokogiri'
require 'open-uri'

SOURCE_URL = "https://www.w3schools.com/colors/colors_ncs.asp"
DUMP_FILE = "/mnt/c/dev/ncs_colors.html"
NCS_TABLE = "table[class='w3-table-all notranslate']" 
PATTERN = /^#/

def load_colors
	page = Nokogiri::HTML(open(SOURCE_URL))
	color_table = page.css(NCS_TABLE).to_s

	File.open(DUMP_FILE, 'w') do |f|
		f.write(color_table)
	end
end

load_colors
