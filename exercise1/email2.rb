class Email
	attr_accessor :subject
	attr_reader :date, :from

	def initialize(s, args)
		@subject = s
		args.each do |k,v|
      		instance_variable_set("@#{k}", v) unless v.nil?
    	end
	end

end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"