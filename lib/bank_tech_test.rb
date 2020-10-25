require 'date'

class Account
  def initialize
    @activity = []
    @balance = 0
  end

  def deposit(date, amount)
    @activity << [format_date(date), format_amount(amount), nil, balance(amount)]
  end

  def withdraw(date, amount)
    @activity << [format_date(date), nil, format_amount(amount), balance(-amount)]
  end

  def statement_print
    puts "date || credit || debit|| balance"
    @activity.sort { |action1, action2|
      action2[0] <=> action1[0]
    }.each { |action|
      puts "#{action.join(' || ')}"
    }
  end

  private
  def format_date(date)
    DateTime.parse(date.to_s).strftime("%d/%m/%Y")
  end

  def format_amount(amount)
    sprintf('%.2f', amount)
  end

  def balance(amount)
    format_amount(@balance += amount)
  end
end

account = Account.new
account.deposit("10-01-2012", 1000.00)
account.deposit("13-01-2012", 2000.00)
account.withdraw("14-01-2012", 500.00)

account.statement_print
