class SheetsController < ApplicationController
    def index
        @lineA_sheets = Sheet.where(id: 1..5)
        @lineB_sheets = Sheet.where(id: 6..10)
        @lineC_sheets = Sheet.where(id: 11..15)
    end
end
