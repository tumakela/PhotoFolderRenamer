rootDirectory = "/Users/tumakela/Pictures/Raaka/"
renamed = false

Dir.foreach(rootDirectory) do |item|
	schemas =
		[/[0-9]{8}/] #yyyymmdd
	next item if item.start_with?(".")
	schemas.each do |schema|
		if schema.match(item)
			oldName = rootDirectory + item
			newName = rootDirectory + item[0, 4] + "-" + item[4, 2] + "-" + item[6, 2]
			puts "Renaming " + oldName + " to " + newName
			File.rename oldName, newName
			renamed = true
		end
	end
end

puts "No matches found" unless renamed