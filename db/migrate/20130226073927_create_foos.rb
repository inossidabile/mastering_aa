class CreateFoos < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.string      :title
      t.string      :kind
      t.timestamps
    end
  end
end
