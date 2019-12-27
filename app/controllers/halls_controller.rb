class HallsController < ApplicationController
  before_action :set_hall, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  def index
    @halls = Hall.all
  end

  def show; end

  def new
    @hall = Hall.new
  end

  def edit; end

  def create
    @hall = Hall.new(hall_params)
    respond_to do |format|
      if @hall.save
        format.html { redirect_to @hall, notice: 'Hall was successfully created.' }
        format.json { render :show, status: :created, location: @hall }
      else
        format.html { render :new }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hall.update(hall_params)
        format.html { redirect_to @hall, notice: 'Hall was successfully updated.' }
        format.json { render :show, status: :ok, location: @hall }
      else
        format.html { render :edit }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hall.destroy
    respond_to do |format|
      format.html { redirect_to halls_url, notice: 'Hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_hall
    @hall = Hall.find(params[:id])
  end

  def hall_params
    params.require(:hall).permit(:title)
  end

  def authorize_admin
    if !(current_user && current_user.admin == true)
      redirect_to "/seances"
    end
  end
end
