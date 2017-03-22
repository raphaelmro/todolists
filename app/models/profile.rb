class Profile < ActiveRecord::Base
  belongs_to :user
  def first_and_last_not_null
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, "cannot be null along with a null last name")
      errors.add(:last_name, "cannot be null along with a null first name")
    end
  end
  def sue_cannot_be_male
    if gender == "male" && first_name == "Sue"
      errors.add(:first_name, "cannot be male")
      errors.add(:gender, "cannot be Sue")
    end
  end
  def self.get_all_profiles(min_year, max_year)
    Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).order(:birth_year)
  end
  validates :gender, inclusion: {in: ["male", "female"]}
  validate :first_and_last_not_null
  validate :sue_cannot_be_male
end