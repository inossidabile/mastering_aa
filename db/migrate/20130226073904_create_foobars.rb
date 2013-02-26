class CreateFoobars < ActiveRecord::Migration
  def change
    create_table :foobars do |t|
      t.belongs_to  :foo
      t.string      :title
      t.integer     :priority
      t.timestamps
    end
  end
end
