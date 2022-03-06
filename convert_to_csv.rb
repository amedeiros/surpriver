require 'csv'
require 'json'

json = JSON.parse(File.open(ARGV[0]).read)
header = json[0].keys
csv_string = CSV.generate do |csv|
  csv << header
  json.each do |hash|
    csv << hash.values
  end
end

filename=ARGV[0].split(".")[0] + ".csv"
File.write(filename, csv_string)
puts "Wrote CSV to #{filename}"

