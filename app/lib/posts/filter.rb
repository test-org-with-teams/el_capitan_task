class Posts::Filter
  attr_reader :start_date, :end_date

  def initialize(filter_params)
    self.start_date = filter_params[:start_date]
    self.end_date = filter_params[:end_date]
  end

  def posts
    Post.where(publicated_at: start_date..end_date)
  end

  private

  def start_date=(date)
    @start_date = date&.to_date || 1.week.ago
  end

  def end_date=(date)
    @end_date = date&.to_date || Time.now
  end
end
