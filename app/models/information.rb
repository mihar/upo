# == Schema Information
# Schema version: 102
#
# Table name: information
#
#  id                 :integer(11)     not null, primary key
#  title              :string(255)
#  address            :string(255)
#  post               :string(255)
#  post_id            :integer(11)
#  phone              :string(255)
#  fax                :string(255)
#  web                :string(255)
#  email              :string(255)
#  vatid              :string(255)
#  tax                :boolean(1)
#  office_hours       :string(255)
#  maticna_stevilka   :string(255)
#  trr                :string(255)
#  summary            :text
#  about              :text
#  image              :string(255)
#  email_contact      :string(255)
#  email_contact_copy :string(255)
#

class Information < ActiveRecord::Base

  file_column :image, 
      :magick => {
        :versions => {
        "normal" => "400x300>",
        "thumb" => "100x100>"
      }}

end
