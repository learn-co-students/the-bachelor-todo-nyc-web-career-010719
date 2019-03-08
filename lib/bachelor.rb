def get_first_name_of_season_winner(data, season)
  season_winner_first_name = ""
  data.each do |data_season, contestants|
    # binding.pry
    if season == data_season
      contestants.each do |contestant|
        # binding.pry
        if contestant["status"] == "Winner"
          season_winner_first_name = contestant["name"].split(" ")[0]
        end
      end
    end
  end
  season_winner_first_name
end

def get_contestant_name(data, occupation)
  contestant_match = ""
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["occupation"] == occupation
        contestant_match = contestant["name"]
      end
    end
  end
  contestant_match
end

def count_contestants_by_hometown(data, hometown)
  hometown_hits = 0
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        hometown_hits += 1
      end
    end
  end
  hometown_hits
end

def get_occupation(data, hometown)
  occupation_of_first_match = ""
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

# def get_average_age_for_season(data, season)
#   season_ages = []
#   num_of_contestants = 0
#   data.each do |data_season, contestants|
#     if data_season == season
#       contestants.each do |contestant|
#         season_ages << contestant["age"].to_i
#         num_of_contestants +=1
#       end
#     end
#   end
#   sum_of_ages = season_ages.reduce(:+)
#   (sum_of_ages / num_of_contestants).round(0)
# end

def get_average_age_for_season(data, season)
  age_total = 0
  num_of_contestants = 0
  data[season].each do |contestant_hash|
    age_total += (contestant_hash["age"]).to_i
    num_of_contestants += 1
  end
  (age_total / num_of_contestants.to_f).round(0)
end
