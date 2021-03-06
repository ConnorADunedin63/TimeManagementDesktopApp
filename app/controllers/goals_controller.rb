class GoalsController < ApplicationController
  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)
    @goal.user = current_user

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
    @goal = Goal.find_by(id: params[:id])
    if @goal.due_date.present?
      @due_date = @goal.due_date.to_s[0, @goal.due_date.to_s.size - 7]
      @due_date[10] = "T"
    end
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
    if @goal.due_date.present?
      @due_date = @goal.due_date.to_s[0, @goal.due_date.to_s.size - 7]
      @due_date[10] = "T"
    end
  end

  def update
    @goal = Goal.find_by(id: params[:id])

    if @goal.update_attributes(goal_params)
      redirect_to goals_path
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to edit_goal_path(@goal)
    end
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy
    redirect_to goals_path
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :due_date, :label, :tasks)
  end
end
