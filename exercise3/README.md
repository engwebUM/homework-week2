Use the `mailbox.rb` file. Fill in and complete the following class
definitions:

```ruby
class Email
  # your class from the last exercise
end

class Mailbox
  # your class from the last exercise
end

class MailboxTextFormatter
  # fill in this class body
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
```

Your goal is to complete the code in a way so it outputs the following:

```
Mailbox: Ruby Study Group

+------------+---------+------------------------+
| Date       | From    | Subject                |
+------------+---------+------------------------+
| 2014-12-01 | Ferdous | Homework this week     |
| 2014-12-01 | Dajana  | Keep on coding! :)     |
| 2014-12-02 | Ariane  | Re: Homework this week |
+------------+---------+------------------------+
```

You are allowed to add as many methods to the classes `Email`, `Mailbox` and
`MailboxTextFormatter` as you deem useful. In your final solution you are not
allowed to change any of the code outside (after) the class definitions. For
debugging purposes, you can, of course, change all the code you want.

Try to come up with a working solution first. It does not matter how elegant,
generic, or pretty it is. Whatever produces the required output is fine for a
first solution. Then, later, look at your code, and try to improve it by
cleaning up everything that you do not like, or deem ugly.

Eventually, one goal to aim for would be: Adding another column to the
table only requires minimal changes, e.g. changes to one or two places in your
formatter class.
