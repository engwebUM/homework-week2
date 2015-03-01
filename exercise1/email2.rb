# Copy email.rb to email2.rb.

# Change your class so that the initialize method now takes a subject 
# string, and a headers hash. This is then more in line with how actual 
# emails are stored in the real world: the values date and from are stored 
# on a hash, which is called the “email headers”.

# Doing so, in the code above the only line you should change is the one 
# that instantiates the email object, which should now read:

# email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => 
# "Ferdous" })
# Your program should now still produce the same output.

class Email
  # fill in this class body
	def initialize(subject, headers)
		#variáveis de instancia
		@subject = subject
		@date = headers[:date]
		@from = headers[:from]
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
	# ou:
	# attr_reader :date
	# attr_reader :from
	# attr_reader :subject
	
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"


# Date:    2014-12-01
# From:    Ferdous
# Subject: Homework this week