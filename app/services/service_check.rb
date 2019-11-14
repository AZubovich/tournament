module ServiceCheck
  class << self
    def check_args(distribution, winner, limit)
      message = 'OK!'
      message = 'Uncorrect number of winners' if winner.to_i > limit.to_i
      message = 'Uncorrect distribution' if check_prize(distribution) != 1.0
      message = 'Prize winners and distribution are not equal' if distribution.split(',').count != winner.to_i
      message
    end

    def check_prize(distribution)
      temp_prize = 0
      distribution.split(',').each { |i| temp_prize += i.to_f }
      temp_prize
    end

    def check_participants(community)
      users = User.where(community_id: community.id).count
      users < community.limit
    end
  end
end
