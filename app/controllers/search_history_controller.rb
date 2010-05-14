class SearchHistoryController < ApplicationController
  def index
    @searches = searches_from_history
  end
  
  #TODO we may want to remove unsaved (those without user_id) items from the database when removed from history
  def destroy
    if session[:history].delete_at(params[:id].to_i)
      flash[:notice] = I18n.t(:"search_history.action.destroy")
    else
      flash[:error] = I18n.t(:"search_history.error.destroy")
    end
    redirect_to :back
  end
  
  #TODO we may want to remove unsaved (those without user_id) items from the database when removed from history
  def clear
    if session[:history].clear
      flash[:notice] = I18n.t(:"search_history.action.clear")
    else
      flash[:error] = I18n.t(:"search_history.error.clear")
    end
    redirect_to :back
  end
end
