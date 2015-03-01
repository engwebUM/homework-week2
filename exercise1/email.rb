class Email
	attr_reader :subject,:date,:from
	def initialize(sub,dt,fr)
       @subject = sub
       @date = dt
       @from = fr

    end
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"