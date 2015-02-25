class Email
  attr_reader :date, :from, :subject

  def initialize(subject, date, from)
    @subject, @date, @from = subject, date, from
  end
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
