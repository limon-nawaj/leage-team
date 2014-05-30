class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :update, :destroy]

  before_filter :intercept_html_requests
  layout false
  respond_to :json

  # GET /clubs.json
  def index
    @clubs = Club.all

    render_with_protection @clubs.to_json
  end

  # GET /clubs/1.json
  def show
    @club = Club.find(params[:id])

    render_with_protection @club.to_json
  end

  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    if @club.save
      render_with_protection @club.to_json, {status: :created, location: @club}
    else
      render_with_protection @club.errors.to_json, {status: :unprocessable_entity}
    end
  end

  # PUT /clubs/1.json
  def update
    @club = Club.find(params[:id])

    if @club.update_attributes(club_params)
      head :no_content
    else
      render_with_protection @club.errors.to_json, {status: :unprocessable_entity}
    end
  end

  # DELETE /clubs/1.json
  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :contact_officer, :date_created)
    end

    def intercept_html_requests
      redirect_to('/') if request.format == Mime::HTML
    end
end
