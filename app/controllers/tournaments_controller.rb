# TournamentsController
class TournamentsController < ApplicationController
  # include ActionController::Live
  before_action :authenticate_user!
  before_action :current_tournament

  def show
    @current_challenges = @current_tournament.challenges.current.order(:start_time).limit(4)
    @previous_challenges = @current_tournament.challenges.previous.order('start_time desc').page(params[:page]).per(2)
    @prediction = Prediction.new
  end

  def predict_match
    @challenge_id = params[:challenge_id]
    @match_id = params[:match_id]
    match = Match.find_by_id(@match_id)
    if match && !match.started?
      user_challenge = current_user.user_challenges.by_challenge(params[:challenge_id]).first_or_initialize
      user_challenge.point_booster = 
        params[:point_booster] if current_user.point_booster_available? || params[:point_booster].blank?
      user_challenge.save
      params[:match_question].each do |key, value|
        prediction = user_challenge.predictions.by_match_question(key).first_or_initialize
        prediction.user_answer = value
        prediction.save
      end
     end
    respond_to do |format|
      format.js
      format.html
    end
   end

  def update_match
    return unless current_user.admin
    @challenge_id = params[:challenge_id]
    @match_id = params[:match_id]
    params[:match_question].each do |key, value|
      match_question = MatchQuestion.find_by_id(key)
      next if match_question.nil?
      match_question.answer = value
      match_question.save
    end
  end

  def leaderboard
    tournament = Tournament.find(params[:id])
    @leaderboards = tournament.leader_board
  end

  # Old leader_board data
  def leader_board
    tournament = Tournament.find(params[:id])
    @leaderboards = tournament.leaderboard(params[:from])
  end
end
