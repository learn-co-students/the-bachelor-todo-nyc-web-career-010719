require 'pry'

def get_first_name_of_season_winner(data, season)

  data[season].each do |hashes|
    if hashes["status"] = "Winner"
      return hashes["name"].split(" ").first
    end
  end

end



def get_contestant_name(data, occupation)

  data.each do |season, info|
    info.each do |information|
      if information["occupation"] == occupation
        return information["name"]
      end
    end
  end

end



def count_contestants_by_hometown(data, hometown)

  counter = 0

  data.each do |season, info|
    info.each do |information|
      information.each do |type, datas|
        if datas == hometown
          counter += 1
        end
      end
    end
  end

  return counter

end

def get_occupation(data, hometown)

  data.each do |season, info|
    info.each do |information|
      if information["hometown"] == hometown
        return information["occupation"]
      end
    end
  end
end


def get_average_age_for_season(data, season)

  age_array = []

  data[season].each do |information|
    age_array.push(information["age"].to_i)
  end

  sum = 0

  age_array.each do |num|
    sum += num
  end

  avg_age = (sum.to_f/age_array.length.to_f).round

  return avg_age

end
