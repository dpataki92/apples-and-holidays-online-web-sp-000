require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |key, value|
    value << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  collection = holiday_hash.collect do |season, holidays|
    if season == :winter
      holidays.collect do |holiday, supplies|
        supplies
      end
    end
  end
  collection.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts season.to_s.capitalize! + ":"
    holidays.each do |holiday, supplies|
      holiday_to_print = holiday.to_s.split("_").collect {|word| word.capitalize!}.join(" ")
      supplies_to_print = supplies.join(", ")
      puts "  #{holiday_to_print}: #{supplies_to_print}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  result = []
  holiday_hash.colleachect do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        result << holiday
      end
    end
  end
  result
end
