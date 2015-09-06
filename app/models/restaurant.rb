class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_attached_file :image, styles: { medium: "200x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :address, :phone, :website, :image, presence: true
  validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
                            message: "must be in the format (123) 456-7890" }
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
                            message: "must start with http:// or https://"}
  validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
                                message: "must be in the format 350 Fifth Avenue, New York, NY 10118"}
end