class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users/create_many
  def createMany
    users_data = user_params[:users] 

    if users_data.nil? || users_data.empty?
      render json: { error: 'Nenhum usuário fornecido' }, status: :unprocessable_entity
      return
    end

    begin
      users_data.each do |user_attributes|
        user = User.new(user_attributes)
        if user.save
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          return
        end
      end

      render json: { message: 'Usuários criados com sucesso!', users: users_data}, status: :created

    rescue => e
      render json: { error: "Erro interno: #{e.message}" }, status: :internal_server_error
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if params[:users]
        params.permit(users: [:nome, :uuid, :email]) 
        
      
    else
       params.require(:user).permit(:nome, :uuid, :email)
    end
  end
end
