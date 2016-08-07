class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.find_by_zip(params["zip"])
  end
end
