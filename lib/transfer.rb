class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@status = 'pending'
@amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

def execute_transaction
  if !sender.valid? || sender.balance < amount
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  elsif @status == 'pending'
    sender.balance -= amount
    receiver.balance += amount
    return @status = 'complete'
  end
end

def reverse_transfer
    if (@status == 'complete')
sender.balance += amount
receiver.balance -= amount
    @status == 'reversed'
    end
  end
end
