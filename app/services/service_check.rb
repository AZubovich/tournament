module ServiceCheck
  class << self
    def check_args(distribution, winner, limit, prize)
      message = 'OK!'
      message = 'Uncorrect number of winners' if winner.to_i > limit.to_i
      message = 'Prize and distribution are not equal' if prize.to_i != check_prize(distribution)
      message = 'Uncorrect distribution' if distribution.split(',').count != winner.to_i
      message
    end

    def check_prize(distribution)
      temp_prize = 0
      distribution.split(',').each { |i| temp_prize += i.to_i }
      temp_prize
    end
  end
end
