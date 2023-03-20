class Member::TrainingsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  private
  def training_params
    params.require(:training).permit(:member_id, :training_genre_id, :feedback, :progress)
  end
end
