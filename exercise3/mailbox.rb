class Email
  attr_reader :date
  attr_reader :from
  attr_reader :subject

  def initialize(subject, headers)
    @date = headers[:date]
    @from = headers[:from]
    @subject = subject
  end
end

class Mailbox
  attr_reader :name
  attr_reader :emails

  def initialize(name, emails)
    @name = name
    @emails = emails
  end
end

class MailboxTextFormatter
  attr_reader :mailbox

  def initialize(mailbox)
    @mailbox = mailbox
  end

  def format
    if @mailbox.emails.nil?
      "Emails not found"
    else @mailbox.emails.respond_to?("each")
      columns = ["date", "from", "subject"] #columns goes here
      #initializes hash with column size as value
      #prevents case when fields are slower than columns name
      columnsMaxSizeHash = Hash[columns.map {|column| [column, column.length]}]
      #finds the field with max value for each column
      mailbox.emails.each do |email|
        columnsMaxSizeHash.each do |column,size|
          value = email.instance_variable_get("@#{column}")
          #prevents case when column does not match any instance variable
          if value != nil
            columnsMaxSizeHash[column] = [size, value.to_s.strip.length].max
          end
        end
      end
      printTable(columnsMaxSizeHash)
    end
  end

  private

  def printTable(hash)
    printName + printEdge(hash) + "\n" + printHeader(hash) + "\n" +
    printEdge(hash) + "\n" + printEmails(hash) + printEdge(hash)
  end

  def printName
    if mailbox.name.to_s.strip.length != 0
      "Mailbox: #{mailbox.name}\n\n"
    else
      "Mailbox: Name not found\n\n"
    end
  end

  def printEdge(hash)
    str = ""
    hash.each {|key, value| str += "+-" + repeat("-", value) + "-"}
    str += "+" #finish line
  end

  def printHeader(hash)
    str = ""
    hash.each {|key, value|
      str += "| #{key.capitalize}" + repeat(" ", (value - key.length)) + " "}
    str += "|" #finish line
  end

  def printEmails(hash)
    str = ""
    mailbox.emails.each do |email|
      hash.each do |column,size|
        value = email.instance_variable_get("@#{column}")
        if value != nil
          str += "| #{value.to_s.strip}" + repeat(" ", (size - value.to_s.strip.length)) + " "
        else
          str += "| " + repeat(" ", (size)) + " "
        end
      end
      str += "|\n" #finish line
    end
    str
  end

  def repeat(text, n)
    text * n
  end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
