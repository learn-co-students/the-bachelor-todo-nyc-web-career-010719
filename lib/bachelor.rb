require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |info|
    if info["status"] == "Winner"
      return info["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.each do |value|  
      if value["occupation"] == occupation
        return value["name"]
      end
    end
  end 
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, info|
    info.each do |value|
      if value["hometown"] == hometown
        counter += 1 
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |season, info|
    info.each do |value|
      if value["hometown"] == hometown
        return value["occupation"]
      end
    end
  end 
end

def get_average_age_for_season(data, season)
  counter = 0 
  age = 0 
  data[season].each do |info|
    info.collect do |k, v|
      if k == "age"
        counter += 1 
        age += v.to_f 
      end
    end
  end
  answer = (age / counter).round 
  return answer
      
end
