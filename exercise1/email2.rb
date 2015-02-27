class Email
	 attr_reader :subject  
	 attr_reader :date
	 attr_reader :from   

	def initialize (s="subject" , d="date" , f="from")
		@subject = s
		@date = d
		@from = f
	end

end


