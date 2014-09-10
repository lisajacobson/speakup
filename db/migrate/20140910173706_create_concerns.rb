class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
    	t.timestamp :date
    	t.text :text
    	t.references :user
    end
  end
end
