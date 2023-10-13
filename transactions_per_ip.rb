# transaction_id, datetime, ip_address

class IpAddress
  def initialize
    @transactions = {}
  end

  def add_transaccion(transaction_id, options={})
    unless @transactions.key?(transaction_id)
      @trasactions[transaction_id] = options
    else
      @transactions[transaction_id].merge!(options)
    end
  end

  def transactions_avg
    @transactions.map { |transaction|
      (transaction[:end_date] - transaction[:start_date]).duration
    }.avg
  end
end

class LogReader
  def initialize(start_log, end_log)
    @ip_addresses = {}
    @start_log = start_log
    @end_log   = end_log
  end

  def read_log(file_path, date_type)
    CVS.read(file_path) do |row|
      transaction_id = row[0]
      time = Datetime.parse(row[1])
      ip_address = row[0]

      @ip_address[ip_address] = IpAddress.new unless @ip_addresses.key?(ip_address)

      @ip_address.add_transaction(transaction_id, date_type: date_type)
    end
  end

  def run!
    read_log(@start_log, :start_time)
    read_log(@end_log, :start_time)
  end

  def print_avg_transactions
    @ip_addresses.each do |ip_address|
      puts [ip_addres.ip_address, ip_address.transactions_avg].join(',')
    end
  end
end
