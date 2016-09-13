class QuestionsController < ApplicationController
  before_filter :authorize, only: [:new, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @user = User.find(current_user.id)
    @question = @user.questions.new
  end

  def create
    @user = User.find(current_user.id)
    @question = @user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
    @question = @user.questions.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @question = @user.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

private
  def question_params
    params.require(:question).permit(:title, :content, :votes, :user_id)
  end
end
