class Email
  
  def initialize(subject, a)
    @Date = a[:date]
    @From = a[:from]
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

email = Email.new("Keep on coding! :)", { :date => "2014-12-01",  :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"