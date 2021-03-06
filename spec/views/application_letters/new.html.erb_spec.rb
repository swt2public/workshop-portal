require 'rails_helper'

RSpec.describe "application_letters/new", type: :view do
  before(:each) do
    @application_letter = FactoryGirl.build(:application_letter)
    assign(:application_letter, @application_letter)
    @event = assign(:event, FactoryGirl.create(:event))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", application_letters_path, "post" do
      assert_select "textarea#application_letter_motivation[name=?]", "application_letter[motivation]"
      assert_select "input#application_letter_emergency_number[name=?]", "application_letter[emergency_number]"
      assert_select "input#application_letter_vegetarian[name=?]", "application_letter[vegetarian]"
      assert_select "input#application_letter_vegan[name=?]", "application_letter[vegan]"
      assert_select "textarea#application_letter_allergies[name=?]", "application_letter[allergies]"
      assert_select "textarea#application_letter_annotation[name=?]", "application_letter[annotation]"
      @application_letter.event.custom_application_fields.each { |field_name|
        assert_select "label.control-label[for=custom_application_fields_]", field_name
      }
      assert_select "input#custom_application_fields_", count: @application_letter.event.custom_application_fields.count
    end
  end
end
