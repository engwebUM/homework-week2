class Email

  attr_reader :subject
  attr_reader :date
  attr_reader :from

  attr_writer :subject
  attr_writer :date
  attr_writer :from




  def initialize
    @subject=""
    @date=""
    @from=""
  end

  def initialize(subject,date,from)
    @subject=subject
    @date=date
    @from=from
  end

  def subject=(subject)
    @subject=subject
  end

  def date=(date)
    @date=date
  end

  def from=(from)
    @from=from
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

email = Email.new("Homework this week", "2014-12-01", "Ferdous")


puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"


