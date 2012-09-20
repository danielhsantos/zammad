class RecentViewedController < ApplicationController
  before_filter :authentication_check

=begin

Resource:
GET /api/recent_viewed

Response:
{
  ...
}

Test:
curl http://localhost/api/recent_viewed.json -v -u #{login}:#{password} -H "Content-Type: application/json" -X GET

=end

  def recent_viewed
    recent_viewed = History.recent_viewed_fulldata(current_user)

    # return result
    render :json => recent_viewed
  end

end