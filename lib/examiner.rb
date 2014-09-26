class Examiner
  class << self
    def run source, target
      Rational source.count - Hash[source.to_a - target.to_a].count, source.count
    end
  end
end
