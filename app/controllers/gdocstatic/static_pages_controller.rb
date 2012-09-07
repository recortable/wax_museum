class Gdocstatic::StaticPagesController < ApplicationController
  def show
    @page = Gdocstatic.find params[:id]
  end
end
