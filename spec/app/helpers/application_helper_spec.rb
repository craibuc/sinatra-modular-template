require 'spec_helper'

class TestHelper
  include ApplicationHelper
end

describe ApplicationHelper do

  subject(:app) { TestHelper.new }

  context "#title" do

    let(:title) {"foobarbaz"}

    example "supplying a title will return the application's name and the title" do
      expect(subject.title(title)).to eq("Template - #{title}")
    end

    example "not supplying a title will return the application's name" do
      expect(subject.title).to eq("Template")
    end

  end # /context

end
