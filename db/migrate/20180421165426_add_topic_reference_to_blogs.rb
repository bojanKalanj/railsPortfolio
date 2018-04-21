class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.1]
  def change
    # add_column :blogs, :topic, :refereneces
    add_reference :blogs, :topic, foreign_key: true
  end
end
