class Email
	attr_accessor :subject, :date, :from

	def initialize(s, args)
		@subject = s
		args.each do |k,v|
      		instance_variable_set("@#{k}", v) unless v.nil?
    	end
	end
end


class Mailbox
	attr_accessor :nome, :emails

	def initialize(n, e)
		@nome = n
		@emails = e
	end
end


emails = [
	Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
	Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
	Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
	puts "Date:    #{email.date}"
	puts "From:    #{email.from}"
	puts "Subject: #{email.subject}"
	puts
end