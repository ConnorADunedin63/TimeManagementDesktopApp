class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
