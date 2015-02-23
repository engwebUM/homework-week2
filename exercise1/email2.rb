class Email

	attr_reader :subject, :date, :from

	def initialize(subject, hash={})
	@subject=subject
	@date=hash[:date]
	@from=hash[:from]
	end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"