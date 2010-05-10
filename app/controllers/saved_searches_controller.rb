class SavedSearchesController < ApplicationController
  before_filter :verify_user, :except => :index
  
  def index
    @searches = current_user ? Search.find_all_by_user_id(current_user.id) : []
  end
  
  def save    
    if Search.update(params[:id], :user_id => current_user.id)
      flash[:notice] = I18n.t(:saved_searches_save)
    else
      flash[:error] = I18n.t(:saved_searches_save_error)
    end
    redirect_to :back
  end

  # Only dereferences the user rather than removing the item in case it
  # is in the session[:history]
  def destroy
    if current_user.search_ids.include?(params[:id].to_i) && Search.update(params[:id].to_i, :user_id => nil)
      flash[:notice] = I18n.t(:saved_searches_destory)
    else
      flash[:error] = I18n.t(:saved_searches_destroy_error)
    end
    redirect_to :back
  end
  
  # Only dereferences the user rather than removing the items in case they
  # are in the session[:history]
  def clear    
    if Search.update_all("user_id = NULL", "user_id = #{current_user.id}")
      flash[:notice] = I18n.t(:saved_searches_clear)
    else
      flash[:error] =  I18n.t(:saved_searches_clear_error)
    end
    redirect_to :action => "index"
  end


  protected
  def verify_user
    flash[:error] = I18n.t(:saved_searches_user_required) and redirect_to :back unless current_user
  end
end
