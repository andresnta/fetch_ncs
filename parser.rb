require 'nokogiri'
require 'open-uri'

SOURCE_URL = "https://www.w3schools.com/colors/colors_ncs.asp"
DUMP_FILE = "/mnt/c/dev/ncs_colors.html"
NCS_TABLE = "table[class='w3-table-all notranslate']" 
PATTERN = /#[A-Fa-f0-9]{6}/

def load_colors
	page = Nokogiri::HTML(open(SOURCE_URL))
	color_table = page.css(NCS_TABLE).to_s

	clean_colors = color_table.scan(PATTERN)

#File.open(DUMP_FILE, 'w') do |f|
	
	with_markup = %{}
	clean_colors.each do |color|
		with_markup << "<h3 style='color: #{color}'>#{color}<h3>"
	end
	puts with_markup

	File.open(DUMP_FILE, 'w') do |f|
		f.write(with_markup)
	end
end

load_colors
