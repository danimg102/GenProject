require Rails.root + 'app/models/extractors/excel_extractor'

namespace :genetics do

  namespace :load do

    desc "Load data from 'gemelos' database"
    task :gemelos do
      Extractors::ExcelExtractor.run
    end

    task :otro do

    end
  end

end