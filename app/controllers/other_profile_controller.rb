class OtherProfileController < ApplicationController
  def index
    @user = User.find(params[:id])
    @message = Message.all.where(user: params[:id])
    @messages = @message.order("created_at DESC")
  end

  def friends
    ids_of_users_i_follow = Relationship.where(follower: @current_user.id).pluck(:user_id)

    @friends = Message.where(user_id: ids_of_users_i_follow).includes(:user).order("created_at DESC")

    @bb = []
    @friends.each do |user|
      @bb << User.find_by(id: user.user_id)
    end

    @other_peeps = (User.all - @bb)-[@current_user]

    follower = Relationship.where(user_id: @current_user.id).pluck(:follower)

    @followers = User.where(id: follower)
  end

  def create_relationship
    follower = User.find(params[:follower])
    user = User.find(params[:user_id])
    Relationship.create user: user, follower: follower.id

    redirect_to friends_path(@current_user.id)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to profile_path(@current_user.id)
  end

  def delete
    follower = User.find(params[:follower])
    user = User.find(params[:user_id])
    @relationship = Relationship.find_by(user_id: user, follower: follower)
    @relationship.destroy

    redirect_to friends_path(@current_user.id)
  end
end
