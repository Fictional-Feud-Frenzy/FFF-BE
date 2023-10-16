class AddPowerStatsWeightedAverageToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :power_stats_weighted_average, :float
  end
end
