class CsvProcessorController < ApplicationController
  require 'csv'
  before_action :verificar_senha, only: [:process_csv]

  def process_csv
    file_path = Rails.root.join('db', 'data', 'cu.csv.enc').to_s
    senha_csv = ENV['CSV']
    data = `openssl enc -d -aes-256-cbc -in #{file_path} -k #{senha_csv}`

    arrays = []

    CSV.parse(data, headers: false, col_sep: ",") do |row|
      arrays << row 
    end

    render json: { status: :success, data: arrays }
  end

  private

  def verificar_senha
    senha = params[:senha]
    senha_correta = ENV['SENHA']

    unless senha == senha_correta
      render json: { erro: "Acesso negado" }, status: :forbidden
    end
  end
end
