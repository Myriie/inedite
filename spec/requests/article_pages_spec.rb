require 'spec_helper'

describe "Article pages" do


subject { page }

  describe "show page" do
    before { visit show_path }

    it { should have_selector('h1',    text: 'Article') }
    it { should have_selector('title', text: full_title('Article')) }
  end
end


#  describe "GET /article_pages" do
#    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get article_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end
