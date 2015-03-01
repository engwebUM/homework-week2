class Email
  attr_reader :subject, :date, :from

  def initialize(subject, date, from)
    @subject = subject
    @date = date
    @from = from
  end
end


email = Email.new("Homework", "2015-02-26", "Filipa")
puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
