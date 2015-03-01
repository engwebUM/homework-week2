class Email
  attr_reader :subject, :date, :from
  def initialize(subject, headers)
      @subject=subject
      @date=headers[:date]
      @from=headers[:from]
   end
end


class Mailbox
  attr_reader :name, :emails
  def initialize(name, emails)
      @name=name
      @emails=emails
   end
end


class MailboxTextFormatter
  attr_reader :mailbox
  def initialize(mailbox)
    @mailbox=mailbox
  end

  #This method gets the max string length of <from> and <subject>
  def get_max_lengths(emails)
    max_from = 0
    max_subject = 0
    emails.each do |email|
      from_length = email.from.length
      if from_length > max_from
        max_from = from_length
      end
      subject_length = email.subject.length
      if subject_length > max_subject
        max_subject = subject_length
      end
    end
    max_lengths = [max_from, max_subject]
    return max_lengths
  end

  #This method prints all the mailbox, formatted
  def format
    @finalResult = "Mailbox: #{@mailbox.name}\n\n"

    max_lengths = get_max_lengths(@mailbox.emails)

    @finalResult << "+" + "-"*12 + "+" + "-"*(max_lengths[0]+2) + "+" + "-"*(max_lengths[1]+2) + "+
| Date       | From" + " "*(max_lengths[0]-3) + "| Subject" + " "*(max_lengths[1]-6) +"|
+" + "-"*12 + "+" + "-"*(max_lengths[0]+2) + "+" + "-"*(max_lengths[1]+2) + "+\n"

    @mailbox.emails.each do |email|
      from_length = 0
      subject_length = 0
      from_length = email.from.length
      subject_length = email.subject.length
      @finalResult << "|" + " #{email.date} | #{email.from} " + " "*(max_lengths[0]-from_length) + "| #{email.subject} " + " "*(max_lengths[1]-subject_length) + "|\n"
    end
    @finalResult << "+" + "-"*12 + "+" + "-"*(max_lengths[0]+2) + "+" + "-"*(max_lengths[1]+2) + "+\n"
  end
  @finalResult
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
