class RatingsController < ApplicationController
  before_action :set_rating,            only: %i[ edit update destroy ]
  before_action :set_formatted_rating,  only: %i[ show ]

  # GET /ratings or /ratings.json
  def index
    @ratings = format_ratings(Rating.all)
    @rating = Rating.new
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # POST /ratings or /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to rating_url(@rating), notice: "Avaliação criada com sucesso" }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url(@ratings), notice: "Avaliação deletada com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def format_rating(r)
      rating = r.clone
      rating[:rating] = rating[:rating].ceil(1)
      rating
    end

    def set_formatted_rating
      @rating = format_rating(Rating.find(params[:id]))
    end
    
    def format_ratings(ratings)
      ratings.map(&method(:format_rating))
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:img_url, :rating, :description, :imdb_id, :string)
    end
end
