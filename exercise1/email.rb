class Email
  
  def initialize(subject, date, from)
    @Date = date
    @From = from
    @Subject = subject
  end
  
  def date
    return @Date
  end
  def from
    return @From
  end
  def subject
    return @Subject
  end
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"