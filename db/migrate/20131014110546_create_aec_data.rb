class CreateAecData < ActiveRecord::Migration
  def change
    create_table :aec_data do |t|

      t.timestamps
    end
  end
end
