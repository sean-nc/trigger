class SearchTerm < ApplicationRecord
  require 'roo'

  has_one :bookmark, dependent: :destroy
  validates :query, presence: true, uniqueness: true

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, csv_options: {encoding: Encoding::ISO_8859_1})
    (spreadsheet.first_row..spreadsheet.last_row).each do |i|
      term = spreadsheet.row(i)[0]
      term += ' -top -dir'
      SearchTerm.create(query: term)
    end
  end
end
