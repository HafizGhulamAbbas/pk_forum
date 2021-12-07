# this file is created via rails g task import data where “import" is the namespace and “data" is the task name
# to execute task --> bundle exec rails import:data

require 'roo'

namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts 'Importing Data'

    data = Roo::Spreadsheet.open('lib/Scrapped_MCQs.xlsx')
    headers = data.row(1) # get header row

    data.each_with_index do |row, idx|
      next if idx == 0 # skip header

      # create hash from headers and cells
      mcq_data = Hash[[headers, row].transpose]
      puts mcq_data
      if Mcq.exists?(question: mcq_data['Question'])
        puts "Question with title '#{mcq_data['Question']}' already exists"
        next
      end
      
      mcq = Mcq.new(mcq_data)
      puts "Saving Question with title #{mcq.question}"
      mcq.save!
    end
  end

end
