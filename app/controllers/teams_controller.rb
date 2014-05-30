class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]
  
  before_filter :intercept_html_requests
  layout false
  respond_to :json

  # GET /teams.json
  def index
    @teams = Team.all

    render_with_protection @teams.to_json
  end

  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    render_with_protection @team.to_json
  end

  # POST /teams.json
  def create
    @team = Team.new(team_params)

    if @team.save
      render_with_protection @team.to_json, {status: :created, location: @team}
    else
      render_with_protection @team.errors.to_json, {status: :unprocessable_entity}
    end
  end

  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(team_params)
      head :no_content
    else
      render_with_protection @team.errors.to_json, {status: :unprocessable_entity}
    end
  end

  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:club_id, :name, :captain, :date_created)
    end

    def intercept_html_requests
      redirect_to('/') if request.format == Mime::HTML
    end
end
