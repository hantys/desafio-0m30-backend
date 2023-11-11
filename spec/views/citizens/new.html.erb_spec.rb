require 'rails_helper'

RSpec.describe "citizens/new", type: :view do
  before(:each) do
    assign(:citizen, Citizen.new(
      full_nome: "MyString",
      document_number: "MyString",
      cns: "MyString",
      email: "MyString",
      status: 1
    ))
  end

  it "renders new citizen form" do
    render

    assert_select "form[action=?][method=?]", citizens_path, "post" do

      assert_select "input[name=?]", "citizen[full_nome]"

      assert_select "input[name=?]", "citizen[document_number]"

      assert_select "input[name=?]", "citizen[cns]"

      assert_select "input[name=?]", "citizen[email]"

      assert_select "input[name=?]", "citizen[status]"
    end
  end
end
