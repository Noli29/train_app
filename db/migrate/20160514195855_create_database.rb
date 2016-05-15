class CreateDatabase < ActiveRecord::Migration

  def up
    puts execute(File.read(File.expand_path('../../create_database.sql', __FILE__)))
  end

  def down
    puts execute(File.read(File.expand_path('../../drop_database.sql', __FILE__)))
  end

end
