class CsvProcessorController < ApplicationController
  require 'csv'
  
  def process_csv
    file_path = Rails.root.join('db', 'data', 'cu.csv').to_s

    arrays = []

    CSV.foreach(file_path, headers: false, col_sep: ",") do |row|
      arrays << row 
      puts row.inspect
    end

    render json: { status: :success, data: arrays }
  end
end
