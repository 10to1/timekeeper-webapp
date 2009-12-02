class KeepsController < ApplicationController
  CONFIG_FILE = '/Users/tomklaasen/timekeeper.yml'
  def index
    view do |tv|
      @keeps = tv.all
    end  
  end
  
  def update_tracked
    keeper do |tk|
      tk.track(params[:pk], params[:name])
    end
    
    render :nothing => true
  end
  
  def view
    tv = Timekeeper::Viewer.new
    tv.config(CONFIG_FILE)
    yield(tv)
    tv.close
  end
  
  def keeper
    tk = Timekeeper::Keeper.new
    tk.config(CONFIG_FILE)
    yield(tk)
  end
end
