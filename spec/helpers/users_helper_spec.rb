require 'spec_helper'

describe UsersHelper do
  it "#render_date" do
    Timecop.freeze(Time.utc(2012, 1, 1, 10, 0)) do
      date = 1.year.ago
      expect(render_date(date)).
        to eq('<small class="date" title="2011-01-01 10:00:00 UTC">about 1 year</small>')
    end
  end
end
