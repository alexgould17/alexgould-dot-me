require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:test_blog) { Blog.create!(title: "Test Blog", author: "Alex", hook: "Dendi", body: "Pudge at TI8!") }

  describe "attributes" do
    it "has title, author, hook & body attributes" do
      expect(test_blog).to have_attributes(title: "Test Blog", author: "Alex", hook: "Dendi", body: "Pudge at TI8!")
    end
  end
end
