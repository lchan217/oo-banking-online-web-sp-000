class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver
    @status = status 
    @amount = amount
  end 
  def valid?
    @sender.valid?
    @receiver.valid?
  end 
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
  end 
  def reverse_transfer
    if @status == "compelte"
      @status = "reversed"
     @sender.balance += @amount
     @receiver.balance -= @amount
   end
  end
end 