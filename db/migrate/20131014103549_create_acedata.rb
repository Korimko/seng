class CreateAcedata < ActiveRecord::Migration
  def change
    create_table :acedata do |t|

      t.timestamps
    end
  end
end
