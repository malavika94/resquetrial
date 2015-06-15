require 'rubygems'
require 'google-refine'
require 'open-uri'
require 'json'
require 'csv'
require 'net/ftp'

apiFullDescURL = "https://api.import.io/store/connector/aab8c3da-299c-436a-aa09-45159cc3c6bc/_attachment/snapshot/6226d6cc-08e9-475e-b9dc-fbc8621e170e?_user=6a7a92ff-7178-44bc-a625-a15c53ce83f4&_apikey=6a7a92ff-7178-44bc-a625-a15c53ce83f4%3AkuoZoen0z%2BLd71z9apa49%2FVGhegHYPgTpAWVakjM3HhLasSA4IjuKuCElkc96Lk%2BI%2FhvRJFPHs58OyLqndrnvQ%3D%3D"

array1 = []
array2 = []
array3 = []
array4 = []
array5 = []
array6 = []
array7 = []
array8 = []

contents = URI.parse(apiFullDescURL).read
data_hash = JSON.parse(contents)
res_hash = data_hash["tiles"][0]["results"][0]["pages"]

 
CSV.open('DBSFullTrialFinal.csv', 'ab') do |csv|
	res_hash.each do |hash| 
		results_hash = hash["results"]

		resultNo_hash = results_hash[0]["_resultNumber"]
		array1 = []
		array1.push(resultNo_hash)

		title_hash = results_hash[0]["title"][0]
		array2 = []
		array2.push(title_hash)

		image_hash = results_hash[0]["image"][0]
		array3 = []
		array3.push(image_hash)

		promotion_hash = results_hash[0]["promotion"][0]
		array4 = []
		array4.push(promotion_hash)

		promoPeriod_hash = results_hash[0]["promotion_period"][0]
		array5 = []
		array5.push(promoPeriod_hash)

		merch_hash = results_hash[0]["merchant"][0]
		array6 = []
		array6.push(merch_hash)

		valid_hash = results_hash[0]["validity"][0]
		array7 = []
		array7.push(valid_hash)

		allDetails_hash = results_hash[0]["all_details"][0]
		array8 = []
		array8.push(allDetails_hash)

		table = [array1, array2, array3, array4, array5, array6, array7, array8].transpose
		table.each do |row|
	        csv << row
	    end

	end
end



###Code to convert csv file to tsv and upload onto Google Refine

# CSV.open("DBStrial2.csv", "w") {|csv| array.to_a.each {|elem| csv << elem} }
# File.open("tmp.tsv","w") {|out|
#   CSV.foreach("json2csvtest.csv") {|l|
#     out.write(l.join("\t")+"\n")
#   }
# }

# prj = Refine.new('project_name' => 'DBSmodifiedCSVLatest', 'file_name' => 'tmp.tsv')
