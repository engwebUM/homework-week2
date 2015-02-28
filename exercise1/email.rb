#In a new file email.rb write a class Email that has a subject, 
#date, and from attribute. Make it so that these attributes can 
#be populated through new and initialize.

class Email
  # fill in this class body
	def initialize(date, from, subject)
		#variáveis de instancia
		@date = date
		@from = from
		@subject = subject
	end
	
	def date
		@date
	end
	
	def from
		@from
	end
	
	def subject
		@subject
	end	
	
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"


# Date:    2014-12-01
# From:    Ferdous
# Subject: Homework this week