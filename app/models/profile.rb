class Profile < ApplicationRecord
  require 'roo'

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+/, on: :create

  def self.search(term)
    if term
      self.where('email ILIKE ?', "%#{term}%").or(self.where('title ILIKE ?', "%#{term}%"))
    else
      self.all
    end
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, csv_options: {encoding: Encoding::ISO_8859_1})
    (spreadsheet.first_row..spreadsheet.last_row).each do |i|
      email = spreadsheet.row(i)[0]
      Profile.create(email: email)
    end
  end
end
