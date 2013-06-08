module UsersHelper
  def render_date(date)
    human_date = distance_of_time_in_words_to_now(date)
    iso_date = date.to_s
    %'<small class="date" title="#{iso_date}">#{human_date}</small>'
  end
end
