class KeepsController < ApplicationController
  CONFIG_FILE = '/Users/tomklaasen/timekeeper.yml'
  
  def index
    view do |tv|
      @keeps = tv.all
      if params[:filter] == 'untracked'
        @keeps.reject!{|k|k.tracked}
      end
    end  
  end
  
  def update_tracked
    keeper do |tk|
      if params[:value] == 'true'
        tk.track(params[:pk], params[:name])
      else
        untrack(params[:pk], params[:name])
      end
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
  
  def untrack(pk, name)
    config = YAML.load_file(CONFIG_FILE)
    tracking_table = Rufus::Tokyo::Table.new(File.join(config["db_path"],"tracking-time.tct"))
    key = tracking_table.query{|q|
      q.add 'name', :eq, name
      q.add 'keep_id', :eq, pk 
    }.first[:pk]
    tracking_table.delete(key)
    tracking_table.close
  end
end
