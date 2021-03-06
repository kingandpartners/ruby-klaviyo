module Klaviyo
  class Campaigns < Client
    CANCEL = 'cancel'
    CAMPAIGN = 'campaign'
    CAMPAIGNS = 'campaigns'
    SEND = 'send'

     # Retrieves all the campaigns from Klaviyo account
     # @return [List] of JSON formatted campaing objects
    def self.get_campaigns()
      v1_request(HTTP_GET, CAMPAIGNS)
    end

    # Retrieves the details of the list
    # @param campaign_id the if of campaign
    # @return [JSON] a JSON object containing information about the campaign
    def self.get_campaign_details(campaign_id)
      path = "#{CAMPAIGN}/#{campaign_id}"

      v1_request(HTTP_GET, path)
    end

    # Sends the campaign immediately
    # @param campaign_id [String] the id of campaign
    # @return will return with HTTP ok in case of success
    def self.send_campaign(campaign_id)
      path = "#{CAMPAIGN}/#{campaign_id}/#{SEND}"

      v1_request(HTTP_POST, path)
    end

    # Cancels the campaign with specified campaign_id
    # @param campaign_id [String] the id of campaign
    # @return [JSON] a JSON object containing the campaign details
    def self.cancel_campaign(campaign_id)
      path = "#{CAMPAIGN}/#{campaign_id}/#{CANCEL}"

      v1_request(HTTP_POST, path)
    end
  end
end
