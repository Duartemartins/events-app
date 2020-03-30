class ChangeColName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :events, :User_Id, :user_id
  end
end
