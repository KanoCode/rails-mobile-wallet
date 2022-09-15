class RemoveExtraColumnFromPaymentsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :payments, :category_id
  end
end
