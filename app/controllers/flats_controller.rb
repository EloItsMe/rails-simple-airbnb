class FlatsController < ApplicationController
  before_action :list, only: %i[index create]
  before_action :set_flat, only: %i[show destroy]
  before_action :new_flat, only: %i[index show]

  def index
  end

  def show
  end

  def create
    @new_flat = Flat.new(flat_params)
    if @new_flat.save
      redirect_to flat_path(@new_flat)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def new_flat
    @new_flat = Flat.new
  end

  def list
    @flats = Flat.all
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
