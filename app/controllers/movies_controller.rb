class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        
        # キーワードでの絞り込み
        if params[:keyword].present?
            @movies = @movies.looks(params[:keyword])
        end

        # 公開中または公開予定の絞り込み
        if params[:is_showing] == '1'
            @movies = @movies.where(is_showing: true)
        elsif params[:is_showing] == '0'
            @movies = @movies.where(is_showing: false)
        end
        
    end
end
