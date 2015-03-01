class Email
  attr_reader :date, :from, :subject

  def initialize(subject, headers)
    @subject, @date, @from = subject, headers[:date], headers[:from]
  end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })
puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
