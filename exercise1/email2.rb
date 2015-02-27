class Email
  def initialize(subject, hash)
    @subject = subject
    @date = hash[:date]
    @from = hash[:from]
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

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
