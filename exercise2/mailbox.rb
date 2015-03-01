class Email
  attr_reader :subject, :date, :from

  def initialize(subject, headers)
    @subject = subject
    @date = headers[:date]
    @from = headers[:from]

  end
end


class Mailbox
  attr_reader :name, :emails

  def initialize(name, emails)
    @name = name
    @emails = [:email]
    @emails = emails
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
