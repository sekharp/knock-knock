class Api::V1::ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]

  def index
    @prospects = Prospect.all
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
end
