class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users, &:timestamps
  end
end
