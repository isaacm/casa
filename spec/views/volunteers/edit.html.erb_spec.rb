require "rails_helper"

RSpec.describe "volunteers/edit", type: :view do
  it "allows an administrator to edit a volunteers email address" do
    administrator = build_stubbed :casa_admin
    enable_pundit(view, administrator)
    allow(view).to receive(:current_user).and_return(administrator)

    volunteer = create :volunteer

    assign :volunteer, volunteer
    assign :supervisors, []

    render template: "volunteers/edit"

    expect(rendered).to_not have_field("volunteer_email", readonly: true)
  end

  it "allows a supervisor to edit a volunteers email address" do
    supervisor = build_stubbed :supervisor
    enable_pundit(view, supervisor)
    allow(view).to receive(:current_user).and_return(supervisor)

    volunteer = create :volunteer

    assign :volunteer, volunteer
    assign :supervisors, []

    render template: "volunteers/edit"

    expect(rendered).to_not have_field("volunteer_email", readonly: true)
  end

  it "does not allow a supervisor to edit a volunteers email address" do
    supervisor = build_stubbed :supervisor
    enable_pundit(view, supervisor)
    allow(view).to receive(:current_user).and_return(supervisor)

    volunteer = create :volunteer

    assign :volunteer, volunteer
    assign :supervisors, []

    render template: "volunteers/edit"

    expect(rendered).to_not have_field("volunteer_email", readonly: true)
  end
end
