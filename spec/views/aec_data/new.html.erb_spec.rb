require 'spec_helper'

describe "aec_data/new" do
  before(:each) do
    assign(:aec_datum, stub_model(AecDatum).as_new_record)
  end

  it "renders new aec_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aec_data_path, :method => "post" do
    end
  end
end
