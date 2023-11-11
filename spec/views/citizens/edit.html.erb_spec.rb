require 'rails_helper'

RSpec.describe "citizens/edit", type: :view do
  let(:citizen) {
    Citizen.create!(
      full_nome: "MyString",
      document_number: "MyString",
      cns: "MyString",
      email: "MyString",
      status: 1
    )
  }

  before(:each) do
    assign(:citizen, citizen)
  end

  it "renders the edit citizen form" do
    render

    assert_select "form[action=?][method=?]", citizen_path(citizen), "post" do

      assert_select "input[name=?]", "citizen[full_nome]"

      assert_select "input[name=?]", "citizen[document_number]"

      assert_select "input[name=?]", "citizen[cns]"

      assert_select "input[name=?]", "citizen[email]"

      assert_select "input[name=?]", "citizen[status]"
    end
  end
end
