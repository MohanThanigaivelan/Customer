class AddAttachmentPhotoToCustomer1s < ActiveRecord::Migration[5.2]
  def self.up
    change_table :customer1s do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :customer1s, :photo
  end
end
