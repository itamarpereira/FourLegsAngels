class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def create
    @request = Request.new
    @request.user = current_user
    @request.pet = Pet.find(params[:pet_id])
    if @request.save
      redirect_to pet_path(@request.pet)
    else
      render 'pets/show'
    end
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:status, :pet_id, :user_id)
  end
end
