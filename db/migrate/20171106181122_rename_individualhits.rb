class RenameIndividualhits < ActiveRecord::Migration[5.1]
  def change
	rename_table('individualhits', 'individual_hits')
  end
end
