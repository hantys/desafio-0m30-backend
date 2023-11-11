require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    assign(:citizen, Citizen.create!(
      full_nome: "Full Nome",
      document_number: "Document Number",
      cns: "Cns",
      email: "Email",
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Nome/)
    expect(rendered).to match(/Document Number/)
    expect(rendered).to match(/Cns/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
  end
end
