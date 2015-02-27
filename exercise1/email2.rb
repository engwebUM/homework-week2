class Email2
   attr_reader :date, :from

	def initialize(subject, options={})
   	@subject, @date, @from  = subject, options[:date], options[:from]
	end

	def subject
	  	@subject
	end

	def date
	  	@date
	end

	def from
	  	@from
	end
end

email = Email2.new("of your interest", { :date => "2015-02-27", :from => "A guy" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"