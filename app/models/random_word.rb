class RandomWord
  def self.random
    if Random.rand < 0.5
      'Campus'
    else
      'Code'
    end
  end
end
