class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find(params[:id])
        if params[:search_1] == nil
            @bakerscombinations= Bakerscombination.where(user_id: params[:id]).order(created_at: :desc).page(params[:page_1]).per(5)
        elsif params[:search_1] == ''
            @bakerscombinations= Bakerscombination.where(user_id: params[:id]).order(created_at: :desc).page(params[:page_1]).per(5)
        else
        #部分検索
            @bakerscombinations = Bakerscombination.where(user_id: params[:id]).where("name LIKE ? ",'%' + params[:search_1] + '%').order(created_at: :desc).page(params[:page_1]).per(5)
        end
        
        @items = @user.bakerscombinations
        likes = Like.where(user_id: params[:id]).pluck(:bakerscombination_id)
        
        if params[:search_2] == nil
            @likes_list_array = Bakerscombination.order(created_at: :desc).find(likes)
            @likes_list = Kaminari.paginate_array(@likes_list_array).page(params[:page_2]).per(5)
        elsif params[:search_2] == ''
            @likes_list_array = Bakerscombination.order(created_at: :desc).find(likes)
            @likes_list = Kaminari.paginate_array(@likes_list_array).page(params[:page_2]).per(5)
        else
        #部分検索
            @likes_list = Bakerscombination.where("name LIKE ? ",'%' + params[:search_2] + '%').where(id: likes).order(created_at: :desc).page(params[:page_2]).per(5)
        end
        
    end

    def default
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        redirect_to user_path(current_user.id)
    end



    private
    def user_params
        params.require(:user).permit(:ingredient_1_name, :ingredient_1, :ingredient_2_name, :ingredient_2, 
        :ingredient_3_name, :ingredient_3, :ingredient_4_name, :ingredient_4, :ingredient_5_name, :ingredient_5, :ingredient_6_name, :ingredient_6, 
        :ingredient_7_name, :ingredient_7, :microwave_manufacturer, :microwave_number, :bakery_manufacturer, :bakery_number, 
        :ferment1_time_minutes, :ferment1_time_seconds, :ferment1_temperature, :ferment2_time_minutes, :ferment2_time_seconds, :ferment2_temperature,
        :roasted_time_minutes, :roasted_time_seconds, :roasted_temperature)
    end
    
end

