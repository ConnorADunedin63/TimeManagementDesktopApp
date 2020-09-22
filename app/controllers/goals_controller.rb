class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)

    if @goal.save
      # Redirect to the goals page, if successful
      redirect_to goals_path
    else
      # Render the form with errors
      flash[:errors] = @goal.errors.full_messages
      redirect_to new_goal_path
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :due_date, :tasks)
  end
end
