require 'spec_helper'

describe "aec_data/edit" do
  before(:each) do
    @aec_datum = assign(:aec_datum, stub_model(AecDatum))
  end

  it "renders the edit aec_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aec_data_path(@aec_datum), :method => "post" do
    end
  end
end
