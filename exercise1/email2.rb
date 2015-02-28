class Email
  attr_accessor :subject
  attr_accessor :date
  attr_accessor :from

  def initialize(subject,headers)
  	@subject=subject
  	@date=headers[:date]
  	@from=headers[:from]
  end
end

#testing
email1 = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })
puts "Date:    #{email1.date}"
puts "From:    #{email1.from}"
puts "Subject: #{email1.subject}"

email2 = Email.new("Just another Subject", { :date => "2020-12-11", :from => "Some Random Guy" })
puts "Date:    #{email1.date}"
puts "From:    #{email1.from}"
puts "Subject: #{email1.subject}"
