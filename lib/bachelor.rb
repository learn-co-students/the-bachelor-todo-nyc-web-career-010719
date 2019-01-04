def get_first_name_of_season_winner(data, season)
  # code here
  data[season].each do |contestant_hash|
    if contestant_hash["status"] == "Winner"
      return contestant_hash["name"].split(" ").first
    end
  end
end

def get_contestant_name(data, occupation)
  # code here
  data.each do |season, contestants|
    contestants.each do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        return contestant_hash["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  data.each do |season, contestants|
    contestants.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  # code here
  data.each do |season, contestants|
    contestants.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        return contestant_hash['occupation']
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # code here
  age_total = 0
  num_of_contestants = 0
  data[season].each do |contestant_hash|
    age_total += (contestant_hash["age"]).to_i
    num_of_contestants += 1
  end
  (age_total / num_of_contestants.to_f).round(0)
end
