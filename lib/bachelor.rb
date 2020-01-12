def get_first_name_of_season_winner(data, season)
  winner = nil
  data.each do |season_number, details|
    if season == season_number
      details.each do |contestant|
        if contestant["status"] == "Winner"
          winner = contestant["name"].split(" ")[0]
        end
      end
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  person = nil
  data.each do |season_number, details|
    details.each do |contestant|
      if contestant["occupation"] == occupation
        person = contestant["name"]
      end
    end
  end
  person
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_number, details|
    details.each do |contestant|
      if contestant["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  occupation_array = []
  data.each do |season_number, details|
    details.each do |contestant|
      if contestant["hometown"] == hometown
        occupation_array << contestant["occupation"]
      end
    end
  end
  occupation_array[0]
end

def get_average_age_for_season(data, season)
  age_array = []
  data.each do |season_number, details|
    if season_number == season
      details.each do |contestant|
        age_array << contestant["age"].to_f
      end
    end
  end
  sum = 0
  i = 0
  while i < age_array.length
    sum += age_array[i]
    i += 1
  end
  (sum/age_array.length).round
end
