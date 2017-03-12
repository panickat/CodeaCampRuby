class Word < ActiveRecord::Base
  # Remember to create a migration!
  def anagrams
    Word.where("canonical = '#{self.canonical}'")
  end
end
