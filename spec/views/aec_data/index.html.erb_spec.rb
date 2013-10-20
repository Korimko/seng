require 'spec_helper'

describe "aec_data/index" do
  before(:each) do
    assign(:aec_data, [
      stub_model(AecDatum),
      stub_model(AecDatum)
    ])
  end

  it "renders a list of aec_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
