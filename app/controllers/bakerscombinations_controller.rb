class BakerscombinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Bakerscombination.ransack(params[:q])
    @bakerscombinations = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @bakerscombination = Bakerscombination.new
    @user = User.find(current_user.id)
  end

  def create
    bakerscombination = Bakerscombination.new(bakers_combination_params)
    bakerscombination.user_id = current_user.id
      if bakerscombination.save
        redirect_to :action => "index"
      else
        redirect_to :action => "NewPost"
      end
  end

  def show
    @bakerscombination = Bakerscombination.find(params[:id])
    @review = Review.new
  end

  def calculation
    @bakerscombination = Bakerscombination.find(params[:id])
    my_number = params.dig(:data, :integer).to_i
    results = { :message => my_number}
    render partial: 'show_partial', locals: { :results => results }
  end

  def edit
    @bakerscombination = Bakerscombination.find(params[:id])
  end

  def update
    bakerscombination = Bakerscombination.find(params[:id])
    if bakerscombination.update(bakers_combination_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    bakerscombination = Bakerscombination.find(params[:id])
    bakerscombination.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def bakers_combination_params
    params.require(:bakerscombination).permit(:name, :ingredient_1_name, :ingredient_1, :ingredient_2_name, :ingredient_2, 
    :ingredient_3_name, :ingredient_3, :ingredient_4_name, :ingredient_4, :ingredient_5_name, :ingredient_5, :ingredient_6_name, :ingredient_6, 
    :ingredient_7_name, :ingredient_7, :microwave_manufacturer, :microwave_number, :bakery_manufacturer, :bakery_number, 
    :image, :ferment1_time_minutes, :ferment1_time_seconds, :ferment1_temperature, :ferment2_time_minutes, :ferment2_time_seconds, :ferment2_temperature,
    :roasted_time_minutes, :roasted_time_seconds, :roasted_temperature)
  end
  

end
