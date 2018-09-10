
if Category.count == 0
	Category.create([
		{name: "Electric"}, 
		{name: "Acoustic"}
	])
	Category.create([
	{name: "Wooden",parent_id: Category.find_by(:name => "Acoustic").id}, 
		{name: "Plastic", parent_id: Category.find_by(:name => "Electric").id}
	])	
end

Brand.create([{name: "Havana"},{name: "Photron"},{name: "MagicPittara"},{name: "Toyshine"}]) unless Brand.count > 0

if Pick.count == 0
	Pick.create([
		{name: "Alice Matte", category_id: Category.find_by(:name => "Plastic").id},
		{name: "StyleZit", category_id: Category.find_by(:name => "Wooden").id},
		{name: "PennyCreek", category_id: Category.find_by(:name => "Wooden").id},
		{name: "DreamBell", category_id: Category.find_by(:name => "Plastic").id},
	])
end 
if Strap.count == 0	
	Strap.create([{name: "Regular"},{name: "Large"},{name: "Extra Large"}])
end	

if Admin.count == 0
	Admin.create(:email => "1testmail7647@gmail.com",:password => "Amol123456",:password_confirmation => "Amol123456")
end
puts "---SEED SUCCESSFULLY-----"
# -------------------------------------------------------------------------------
