require "pry"
require "json"

data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def get_first_name_of_season_winner(data, season)
  
  person_index = 0
  data[season].each_with_index do |person_data, index|
      person_data.each do |key, value|
           if key == "status" && value == "Winner"
               person_index = index
           end
      end
  end
  
  winner_name = data[season][person_index]["name"].split(" ")
  first_name = winner_name[0].to_s
  first_name
end




def get_contestant_name(data, occupation)
    person_index = 0
    contestant_season = ""
    data.each do |season, season_data|
    season_data.each_with_index do |person_data, index|
        person_data.each do |key, value|
            if key == "occupation" && value == occupation
                person_index = index
                contestant_season = season
            end
        end
    end
    end
    winner_name = data[contestant_season][person_index]["name"]
    winner_name
end




def count_contestants_by_hometown(data, hometown)
    hometown_count = 0
    data.each do |season, season_data|
        season_data.each do |person_data|
            if person_data.has_value?(hometown)
                hometown_count += 1
            end
        end
    end
    hometown_count
end




def get_occupation(data, hometown)
    person_index = 0
    contestant_season = ""
    data.each do |season, season_data|
        season_data.each_with_index do |person_data, index|
            person_data.each do |key, value|
                if key == "hometown" && value == hometown && contestant_season == ""
                    person_index = index
                    contestant_season = season
                end
            end
        end
    end
    winner_name = data[contestant_season][person_index]["occupation"]
    winner_name
end




def get_average_age_for_season(data, season)
    total_age_for_season = 0
    total_contestants = data[season].length
    
    data[season].each do |person_data|
        person_data.each do |key, value|
            if key == "age"
                total_age_for_season += value.to_f
            end
        end
   end

    (total_age_for_season / total_contestants).round
    
end
