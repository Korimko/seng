class AecDatum < ActiveRecord::Base
  require 'Nokogiri'
  attr_accessible :date, :name, :time
  
  #Get two party preferred vote count, at the moment just for the bar at the top of the screen
  def self.getTwoPartyPreferred
    Rails.logger = Logger.new(STDOUT)
    logger.info("***Start Testing Two Party Preferred***")
    liberalCount = 0
    laborCount = 0
    otherCount = 0
    #aec-mediafeed-results-standard-verbose-17496.xml
    myFile = File.open("#{Rails.root.to_s}/app/models/aec-mediafeed-results-standard-verbose-17496 - Copy.xml")
    xml = Nokogiri::XML(myFile)
    myFile.close
    xml.remove_namespaces!
    xml.xpath('//TwoCandidatePreferred').each do |line|
      currentMaxVotes = 0
      currentParty = ""
      tempName = ""
      tempVotes = 0
      logger.info("Start new electorate")
      line.xpath('.//Candidate').each do |line2|
        tempName = line2.xpath('.//RegisteredName').text
        if tempName == ""
          tempName = "Independent"
        end
        tempVotes = line2.xpath('./Votes').text
        logger.info("Look here!!!!! We have " + tempVotes);
        tempVotes = line2.xpath('./Votes').text.to_i
        if tempVotes > currentMaxVotes
          currentMaxVotes = tempVotes
          currentParty = tempName
        end
      end
      if currentParty.match(/Liberal/) or currentParty.match(/The Nationals/)
        liberalCount += 1
      elsif currentParty.match(/Labor/)
        laborCount += 1
      else
        otherCount += 1
      end
      logger.info("End electorate")
    end
    logger.info("***End Testing Two Party Preferred***")
    return [liberalCount, laborCount, otherCount]
  end
  
  def self.getElectorateDetails()
    Rails.logger = Logger.new(STDOUT)
    logger.info("***Start Testing Get Electorate Details***")
    electorates = Hash.new
    myFile = File.open("#{Rails.root.to_s}/app/models/aec-mediafeed-results-standard-verbose-17496 - Copy.xml")
    xml = Nokogiri::XML(myFile)
    myFile.close
    xml.remove_namespaces!
    xml.xpath('//House//Contest').each do |line|
      newElectorate = line.xpath('.//ContestName').text
      newElectorate = newElectorate.gsub(/[^a-zA-Z ]/,"")
      logger.info("-----" + newElectorate)
      twoCandidateNames = []
      twoCandidatePartyNames = []
      twoCandidateVotes = []
      allCandidateNames = []
      allCandidatePartyNames = []
      allCandidateVotes = []
      allCandidateHistoricVotes = []
      line.xpath('./TwoCandidatePreferred').each do |line2|
        line2.xpath('.//CandidateName').each do |text|
          twoCandidateNames << text.text.gsub(/[^a-zA-Z\s]/,"")
        end
        line2.xpath('.//RegisteredName').each do |text|
          twoCandidatePartyNames << text.text.gsub(/[^a-zA-Z\s]/,"")
        end
        twoCandidatePartyNames.each do |party|
          if party == ""
            party = "Independent"
          end
        end
        line2.xpath('./Candidate/Votes').each do |text|
          twoCandidateVotes << text.text.to_s
        end
      end
      line.xpath('./FirstPreferences').each do |line2|
        line2.xpath('./Candidate').each do |candidate|
          allCandidateNames << candidate.xpath('.//CandidateName').text.gsub(/[^a-zA-Z\s]/,"")
          currentParty = candidate.xpath('.//RegisteredName').text
          logger.info("currentParty is " + currentParty)
          if currentParty == ""
            currentParty = "Independent"
          end
          allCandidatePartyNames << currentParty.gsub(/[^a-zA-Z\s]/,"")
          allCandidateVotes << candidate.xpath('./Votes').text.to_s
          allCandidateHistoricVotes << candidate.xpath('./Votes/@Historic').text.to_s
        end
      end
      electorates[newElectorate] = Array.new;
      electorates[newElectorate] << twoCandidateNames
      electorates[newElectorate] << twoCandidatePartyNames
      electorates[newElectorate] << twoCandidateVotes
      electorates[newElectorate] << allCandidateNames
      electorates[newElectorate] << allCandidatePartyNames
      electorates[newElectorate] << allCandidateVotes
      electorates[newElectorate] << allCandidateHistoricVotes
      logger.info("LOOK HERE!")
      logger.info(allCandidateHistoricVotes)
    end
    logger.info("***End Testing Get Electorate Details***")
    return electorates
  end

  #Adds the static AEC file in the same directory to the database, shouldn't be needed unless the database has somehow lost it's data
  def self.loadFile
  end
end