class BookmarksController < ApplicationController
  
  # see vendor/plugins/resource_controller/
  resource_controller
  
   # acts_as_taggable_on_steroids plugin
  helper TagsHelper
  
  before_filter :verify_user, :except => :index
  
  # overrides the ResourceController collection method
  # see vendor/plugins/resource_controller/
  def collection
    user_id = current_user ? current_user.id : nil
    assocations = nil
    conditions = ['user_id = ?', user_id]
    if params[:a] == 'find' && ! params[:q].blank?
      q = "%#{params[:q]}%"
      conditions.first << ' AND (tags.name LIKE ? OR title LIKE ? OR notes LIKE ?)'
      conditions += [q, q, q]
      assocations = [:tags]
    end
    Bookmark.paginate_by_tag(params[:tag], :per_page => 8, :page => params[:page], :order => 'bookmarks.id ASC', :conditions => conditions, :include => assocations)
  end
  
  update.wants.html { redirect_to :back }
  
  def create
    if current_user.bookmarks.create(params[:bookmark])
      flash[:notice] = I18n.t(:"bookmarks.action.saved")
    else
      flash[:error] = I18n.t(:"bookmarks.error.saved")
    end
    redirect_to :back
  end
  
  def destroy
    if current_user.bookmarks.delete(Bookmark.find(params[:id]))
      flash[:notice] = I18n.t(:"bookmarks.action.destoryed")
    else
      flash[:error] = I18n.t(:"bookmarks.error.destoryed")
    end
    redirect_to :back
  end
  
  def clear    
    if current_user.bookmarks.clear
      flash[:notice] = I18n.t(:"bookmarks.action.cleared")
    else
      flash[:error] = I18n.t(:"bookmarks.error.cleared")
    end
    redirect_to :action => "index"
  end
  
  protected
  def verify_user
    flash[:error] = I18n.t(:"bookmarks.user_required") and redirect_to :back unless current_user
  end
end
