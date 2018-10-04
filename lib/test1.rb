module Test1
	def	index1
		puts "----from module index1------"
		render :json => {"module" => "index1"}
	end
end