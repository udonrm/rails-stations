class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        
        # キーワードでの絞り込み
        if params[:name].present?
            @movies = @movies.looks(params[:name])
        end
        
        # 公開中または公開予定の絞り込み
        if params[:is_showing] == 'true'
            @movies = @movies.where(is_showing: true)
        elsif params[:is_showing] == 'false'
            @movies = @movies.where(is_showing: false)
        end
        
    end
end
