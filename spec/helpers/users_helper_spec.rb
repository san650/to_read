require 'spec_helper'

describe UsersHelper do
  it "#render_date" do
    Timecop.freeze(Time.utc(2012, 1, 1, 10, 0)) do
      date = 1.year.ago
      expect(render_date(date)).
        to eq('<small class="date" title="2011-01-01 10:00:00 UTC">about 1 year</small>')
    end
  end

  context "#render_description" do
    it "escape description text" do
      expect(render_description("<lorem ipsum dolor")).
        to eq("<p>&lt;lorem ipsum dolor</p>")
    end

    it "doesn't render nil content" do
      expect(render_description(nil)).
        to eq(nil)
    end

    it "doesn't render empty content" do
      expect(render_description("")).
        to eq(nil)
    end
  end

  it "#render_user" do
    expect(render_user(FactoryGirl.build(:user, name: "john"))).
      to eq('<span class="author john">john</span>')
  end
end
