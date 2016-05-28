class TrainsController < ApplicationController

  def index
    @trains = Train.order("train_number").page(params[:page]).per(4)
  end

  def show
    @train = Train.find(params[:id_train])
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(params[:train])
    if @train.save
      session[:train_number] = @train_number
      flash[:success] = ""
      redirect_to @train
    else
      render 'new'
    end
  end



  private

  def train_params
    params.require(:train).permit(:train_number)
  end
end
