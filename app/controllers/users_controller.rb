class UsersController < ApplicationController

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

end

