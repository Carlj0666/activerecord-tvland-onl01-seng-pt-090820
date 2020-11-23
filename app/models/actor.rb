class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    show_name = self.shows.map do |n|
      n.name
    end
    char_name = self.characters.map do |s|
      s.name
    end
    n = char_name.join()
    s = show_name.join()
    n + " - " + s
  end

end