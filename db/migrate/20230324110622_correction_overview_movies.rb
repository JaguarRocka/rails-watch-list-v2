class CorrectionOverviewMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :overiew, :overview
  end
end
