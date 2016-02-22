namespace :genetics do

  namespace :load do

    desc "Load data from 'gemelos' database"
    task :gemelos do
      ExcelExtractor.run
    end
  end

end