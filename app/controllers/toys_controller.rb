class ToysController < ApplicationController
  wrap_parameters format: []
  

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    #toy = Toys.create(toy_params)
    #render json: toy, status: :created
    toy = Toy.new(toy_params)
    if toy.save
      render json: toy, status: :created
    else
      render json: toy.errors, status: :unprocessable_entity
    end
  end

  def update
    #toy = Toy.find_by(id: params[:id])
    #toy.update(toy_params)
    toy = Toy.find_by(id: params[:id])
    if toy.update(toy_params)
    render json: toy
    else
    render json: toy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes, :id)
  end

end
