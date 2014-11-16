module ScammersHelper
  def circular(picture_url)
    style = %Q{
      width: 300px;
      height: 300px;
      border-radius: 150px;
      -webkit-border-radius: 150px;
      -moz-border-radius: 150px;
      background: url(#{picture_url}) no-repeat;
    }
  end
end
