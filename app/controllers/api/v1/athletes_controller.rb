class Api::V1::AthletesController < ApiController

  before_action :find_athlete_and_result
  before_action :authenticate_api_v1_user!, only: [:create, :destroy, :edit]

  def index
    sorted_athletes
    render json: @sorted_athletes, status: :ok
  end

  def show
    render json: @athlete, serializer: Athlete::ShowSerializer, status: :ok
  end

  def edit
    render_message('Athlete updated successfully!')  if @athlete.update(athlete_params)
  end

  def create
    athlete = Athlete.new(athlete_params)
    if athlete.save
      Result.create(athlete: athlete)
      render_message('Athlete successfully created!')
    else
      render_message('Please fill in all fields.')
    end
  end

  def destroy
    athlete = Athlete.find_by(id: params[:id])
    athlete.destroy
    render_message('Athlete successfully deleted!')
  end

  def voting
    render_message('Thank you for casting your vote!') if @result.updated_votes(params)
  end

  private

  def athlete_params
    params.permit(:name, :age, :home)
  end

  def sorted_athletes
    athletes = Athlete.all
    @sorted_athletes = athletes.sort_by { |athlete| athlete[:starttime] }
    @sorted_athletes
  end

  def find_athlete_and_result
    @athlete = Athlete.find_by(id: params[:id])
    @result = Result.find_by(athlete: params[:id])
  end

  def render_message(message)
    render json: { status: message }
  end
end
