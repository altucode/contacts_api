class GroupsController < ApplicationController
  def index
    render json: User.find(params[:user_id]).groups
  end

  def show
    render json: Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params) do |g|
      g.owner_id = owner_id
    end

    if @group.save
      render json: @group
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if @group.destroy
      render json: @group
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def contacts
    render json: Group.find(params[:id]).contacts
  end

  def add_member
    member = Contact.find(params[:contact_id])
    GroupMembership.create(group_id: params[:id], contact_id: params[:contact_id])
    render json: member
  end

  private

  def owner_id
    params.permit(:user_id).first.last
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
