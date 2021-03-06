class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends.by_name.decorate
    friendable_users = UserDecorator.decorate_collection(current_user.friendable_users)
    @friendable_users = friendable_users.map(&:full_name)
  end

  def create
    friend = User.all.decorate.find {|user| user.full_name == params[:friendship][:friend_name]} # TODO: Figure out a way to pass ID

    if friend.present? && Friendship.create_friendship(user: current_user, friend: friend)
      redirect_to friends_path, notice: t('friend.success', friend: friend.full_name)
    else
      redirect_to friends_path, notice: failure_notice
    end
  end

  def destroy
    friend = User.find(params[:id])
    Friendship.remove_friendship(user: current_user, friend: friend)

    redirect_to friends_path, notice: t('friend.destroy', friend: friend.decorate.full_name)
  end

  private

  def failure_notice
    if params[:friend_name].present?
      t('friend.failure', friend: params[:friend_name])
    else
      t('friend.no_params')
    end
  end
end
