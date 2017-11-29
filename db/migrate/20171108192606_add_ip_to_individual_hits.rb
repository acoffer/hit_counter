class AddIpToIndividualHits < ActiveRecord::Migration[5.1]
  def change
  	add_column :individual_hits, :ip, :string
  end
end
