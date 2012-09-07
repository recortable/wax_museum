class Gdocstatic::StaticPagesController < ApplicationController

  def show
    load_page
  end

  def clear_cache
    load_page
    expire_fragment(@page.cache_key)
    redirect_to id: params[:id], action: :show
  end

  protected
  def load_page
    @page = Gdocstatic.find params[:id]
  end
end
