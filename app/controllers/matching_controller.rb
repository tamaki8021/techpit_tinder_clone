class MatchingController < ApplicationController
  before_action :authenticate_user!

  def index
    # 自分にいいねしたユーザーを配列で取得
    got_reaction_user_ids = Reaction.where(to_user_id: current_user.id, status: 'like').pluck(:from_user_id)
    # @match_users = Reaction.where(to_user_id: got_reaction_user_ids, from_user_id: current_user.id, status: 'like').map{ |reaction| reaction.to_user } 相手、自分もいいねしているユーザーを取得
    @match_users = Reaction.where(to_user_id: got_reaction_user_ids, from_user_id: current_user.id, status: 'like').map(&:to_user)
    @user = User.find(current_user.id)
  end
end
