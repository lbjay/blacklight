class SearchHistoryController < ApplicationController
  def index
    @searches = searches_from_history
  end
  
  #TODO we may want to remove unsaved (those without user_id) items from the database when removed from history
  def destroy
    if session[:history].delete_at(params[:id].to_i)
      flash[:notice] = I18n.t(:search_history_destory)
    else
      flash[:error] = I18n.t(:search_history_destory_error)
    end
    redirect_to :back
  end
  
  #TODO we may want to remove unsaved (those without user_id) items from the database when removed from history
  def clear
    if session[:history].clear
      flash[:notice] = I18n.t(:search_history_clear)
    else
      flash[:error] = I18n.t(:search_history_clear_error)
    end
    redirect_to :back
  end
end
