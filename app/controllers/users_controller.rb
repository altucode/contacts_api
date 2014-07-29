class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorites
    @user = User.find(params[:id])
    favs = @user.contacts.where(favorite: true)
    favs += @user.contact_shares.where(favorite: true).map do |share|
      share.contact
    end

    render json: favs
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
