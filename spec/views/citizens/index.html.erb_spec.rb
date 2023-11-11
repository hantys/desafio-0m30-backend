require 'rails_helper'

RSpec.describe "citizens/index", type: :view do
  before(:each) do
    assign(:citizens, [
      Citizen.create!(
        full_nome: "Full Nome",
        document_number: "Document Number",
        cns: "Cns",
        email: "Email",
        status: 2
      ),
      Citizen.create!(
        full_nome: "Full Nome",
        document_number: "Document Number",
        cns: "Cns",
        email: "Email",
        status: 2
      )
    ])
  end

  it "renders a list of citizens" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Full Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Document Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cns".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
