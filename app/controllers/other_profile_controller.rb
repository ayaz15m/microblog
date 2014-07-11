class OtherProfileController < ApplicationController
  def index
    @user = User.find(params[:id])
    @message = Message.all.where(user: params[:id])
  end

  def friends
    @relationship = Relationship.where(follower: @current_user.id)

    @friends = []

    @relationship.each do |relationship|
      @friends << Message.find_by(user_id: relationship.user_id)
    end


    @other_relationship = Relationship.where.not(follower: @current_user.id)
    @other_people = @other_relationship.where.not(user_id: @current_user.id)

    @others = []

    @other_people.each do |relationship|
      @others<< Message.find_by(user_id: relationship.follower)
    end

    @bb = []


    @friends.each do |user|
      @bb << User.find_by(id: user.user_id)
    end

    @cu = [@current_user]
    @cc = User.all

    @other_peeps = (@cc - @bb)-@cu


    #### when all other ppl are followed and dont have message---- need to sort users not by messages
    ### BLOCK USER
    ### add devise to user
    ### show messages most current

  end

  def create_relationship
    follower = User.find(params[:follower])
    user = User.find(params[:user_id])
    Relationship.create user: user, follower: follower.id
    redirect_to root_path
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to profile_path(@current_user.id)
  end

end
