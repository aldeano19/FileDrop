class AddAttachmentMyfileToDocxes < ActiveRecord::Migration[5.1]
def self.up
    create_table :docxes do |t|
      t.string :filename
      t.string :words

      t.timestamps
    end

    change_table :docxes do |t|
      t.attachment :myfile
    end
  end

  def self.down
    remove_attachment :docxes, :myfile
  end
end
