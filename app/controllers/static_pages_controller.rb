class StaticPagesController < ApplicationController
  def home
    @barInfo = AecDatum.getTwoPartyPreferred
    @liberalCount = @barInfo[0]
    @laborCount = @barInfo[1]
    @otherCount = @barInfo[2]
    @liberalNames = @barInfo[3]
    @laborNames = @barInfo[4]
    @otherNames = @barInfo[5]
    
    @electorates = Hash.new
    @electorates = AecDatum.getElectorateDetails
  end

  def help
  end

  def about
  end

  def contact
  end
end
