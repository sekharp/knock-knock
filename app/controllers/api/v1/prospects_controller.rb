class Api::V1::ProspectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]

  def index
    @prospects = current_user.prospects.all
  end

  def show
    if authorized?
        respond_to do |format|
          format.json { render :show }
        end
    else
        handle_unauthorized
    end
  end

  def create
    @prospect = current_user.prospects.build(prospect_params)
    if authorized?
      respond_to do |format|
        if @prospect.save
          format.json { render :show, status: :created, location: api_v1_prospect_path(@prospect) }
        else
          format.json { render json: @prospect.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_prospect
      @prospect = Prospect.find(params[:id])
  end

  def authorized?
    @prospect.user == current_user
  end

  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  # strong params to prevent bulk data mutations
  def prospect_params
    params.require(:prospect).permit(:name, :email, :notes)
  end
end
