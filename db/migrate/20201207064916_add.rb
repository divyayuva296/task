class Add < ActiveRecord::Migration[6.0]
  def change
  end
end
class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
  end
end