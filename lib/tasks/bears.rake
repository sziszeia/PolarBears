require 'csv'
namespace :bears do
  desc "pull polar bear data into database"
  task seed_bears: :environment do

    #drop the old table data before importing the new stuff
    Deployment.destroy_all

    CSV.foreach("lib/assets/PolarBears/USGS_WC_eartag_deployments_2009-2011.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      Deployment.create!(
      BearID: row[0].to_i,
      PTT_ID: row[1].to_i,
      capture_lat: row[6].to_d,
      capture_long: row[7].to_d,
      Sex: row[9],
      Age_class: row[10],
      Ear_applied: row[11]
    )
    end
  end

  task seed_status: :environment do

    #drop the old table data before importing the new stuff
    Status.destroy_all
    @deployments = Deployment.all

    CSV.foreach("lib/assets/PolarBears/USGS_WC_eartags_output_files_2009-2011-status.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      
      if (@deployments.find_by_id(row[0]) != nil) 
        Status.create!(
          DeployID: row[0].to_i,
          Received: row[2].to_d,
          Latitude: row[4].to_d,
          Longitude: row[5],
          Temperature: row[9]
        )
      end

    end
  end

end
