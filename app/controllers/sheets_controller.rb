class SheetsController < ApplicationController
  def index
    @sheets = Sheet.order(:row, :column).group_by(&:row)
  end
end
