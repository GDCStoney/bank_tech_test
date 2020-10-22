require 'date'

class Account
  def initialize
    @activity = []
    @balance = 0
  end

  def deposit(date, amount)
    @balance += amount
    @activity << [DateTime.parse(date.to_s).strftime("%d-%m-%Y"), sprintf('%.2f', amount), nil, sprintf('%.2f', @balance)]
  end

  def withdraw(date, amount)
    @balance -= amount
    @activity << [DateTime.parse(date.to_s).strftime("%d-%m-%Y"), nil, sprintf('%.2f', amount), sprintf('%.2f', @balance)]
  end

  def statement_print
    puts "date || credit || debit|| balance"
    @activity.sort! { |action1, action2| action2[0] <=> action1[0] }
    @activity.each { |action| puts "#{action.join(' || ')}" }
  end

  private
  def balance(amount)
    @balance += amount
  end
end

account = Account.new
account.deposit(Time.new(2012, 01, 10).strftime("%d-%m-%Y"), 1000.00)
account.deposit(Time.new(2012, 01, 13).strftime("%d-%m-%Y"), 2000.00)
account.withdraw(Time.new(2012, 01, 14), 500.00)

account.statement_print
