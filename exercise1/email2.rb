class Email
  attr_reader :date
  attr_reader :from
  attr_reader :subject

  def initialize(subject, date, from)
    @date = date
    @from = from
    @subject = subject
  end
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
