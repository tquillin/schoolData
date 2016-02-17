class Api::ScoresController < ApplicationController

#   def index
#     @scores = Score.all
#   end
#
#   if params[:search]
#       search_term = params[:search]
#       scores = Score.where("admin ILIKE ?", "%#{search_term}%")
#   end
#   render json: {scores: scores}
#
# end
#
# private
# def scores_params
#   permit.require(:scores_params).permit(:name, :admin, :level, :grade)
#
# end
def index

  limit = (params[:limit] || 10).to_i

  if params[:search]
    search_term = params[:search]
    scores = Score.where("name ILIKE ?", "%#{search_term}%")
                          .limit(limit)
  else
    page = (params[:page] || 0).to_i
    scores = Score.offset(limit*page).limit(limit)
  end

  render json: {scores: scores}
end

# private
# def scores_params
#   params.require(:scores_params).permit(:name, :admin, :level, :grade)
# end

end
