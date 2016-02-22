require 'spreadsheet'
require 'spreadsheet/excel/error'

class ExcelExtractor
  attr_reader :file_path

  def ExcelExtractor.run
    puts "entre aqui sin problema"
    #extractor = ExcelExtractor.new '/home/kernel/Cent_Prueba.xls'
    #extractor.extract_centenarios_data
  end

  def initialize(file_path)
    @file_path = file_path
  end


  def extract_centenarios_data
    sheet1 = Spreadsheet.open(@file_path).worksheet(0)
    centen_obj = get_cent_fromDb
    # Add attribs first
    add_centenarios_attribs(sheet1.row(0), centen_obj.id)
    attribs = get_centenarios_attribs(centen_obj.id)
    #row = sheet1.row(1)

    patient_id = 0
=begin
    sheet1.each 1 do |row|
      row.each_with_index do |cell, index|
        if index > 0
          begin
            cell.value
            #puts cell.value << " -- #{index}"
          rescue
            add_value(attribs[index - 1].id, patient_id, cell)
            #puts (cell.to_s.squish == "").to_s << " -- #{index}"
          end
        else
          patient_id = create_patient(centen_obj, cell)
        end
      end
    end
=end
    puts 'Job done!!!!!'
    #s = row[11].value

  end

  private
  # Add the attribs of the 'Centenarios' System
  def add_centenarios_attribs(row, system_id)
    row.each_with_index do |cell, index|
      if index > 0
        begin
          cell.value
          #puts cell.value << " -- #{index}"
        rescue
          Attrib.new(system_id: system_id, name: cell, attr_type: 'string')
        end
      end
    end
  end

  def get_centenarios_attribs(system_id)
    Attrib.where(system_id: system_id)
  end

  # Get the System object from the database
  def get_cent_fromDb
    System.find_by(name: 'Centenarios')
  end

  # Create a new Patient for the System:'centen_obj' and Code:'cell'. Returns the new Patient 'id'
  def create_patient(centen_obj, code)
    patient = Patient.new(code: code)
    centen_obj.patients << patient
    return patient.id
  end

  # Add the value of the 'cell' to the database
  def add_value(attrib_id, patient_id, cell)
    if cell.nil? or cell.to_s == ""
      return 0
    else
      Attvalue.new(attrib_id: attrib_id, value: cell, patient_id: patient_id)
    end
  end
end

