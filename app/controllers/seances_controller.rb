class SeancesController < ApplicationController
  before_action :set_seance, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @film = Film.all
      @seances = Seance.search(params[:search]).order('updated_at').reverse
    else
      @seances = Seance.all.order('updated_at').reverse
    end

  end

  def show; end

  def new
    @film = Film.all
    @seance = Seance.new
  end

  def edit; end

  def create
    @seance = Seance.new(seance_params)
    respond_to do |format|
      if @seance.save
        format.html { redirect_to @seance, notice: 'Seance was successfully created.' }
        format.json { render :show, status: :created, location: @seance }
      else
        format.html { render :new }
        format.json { render json: @seance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @seance.update(seance_params)
        format.html { redirect_to @seance, notice: 'Seance was successfully updated.' }
        format.json { render :show, status: :ok, location: @seance }
      else
        format.html { render :edit }
        format.json { render json: @seance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @seance.destroy
    respond_to do |format|
      format.html { redirect_to seances_url, notice: 'Seance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def seance_params
    params.require(:seance).permit(:film_id, :time, :hall_id)
  end
end
