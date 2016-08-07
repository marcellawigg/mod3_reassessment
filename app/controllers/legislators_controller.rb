class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.find_by_zip(params["zip"])
  end

  def show
    first_name = Legislator.rebuild_first(params["legislator_slug"])
    last_name = Legislator.rebuild_last(params["legislator_slug"])
    @legislator = Legislator.find_by_name(first_name, last_name)

    @committees = Committee.find_committees(@legislator.bioguide_id)
  end
end
