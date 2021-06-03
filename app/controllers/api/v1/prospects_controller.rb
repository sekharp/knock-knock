class Api::V1::ProspectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]

  def index
    @prospects = current_user.prospects.all
  end

  def show
  end

  def create
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
end
