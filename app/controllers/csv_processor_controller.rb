class CsvProcessorController < ApplicationController
  require 'csv'
  
  def process_csv
    caminho = "/home/julio/ruby/cu.csv"  

    arrays = []

    CSV.foreach(caminho, headers: false, col_sep: ",") do |row|
      arrays << row 
      puts row.inspect
    end

    render json: { status: 'success', data: arrays }
  end
end
