class AddUserIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :User_Id, :integer
  end
end
