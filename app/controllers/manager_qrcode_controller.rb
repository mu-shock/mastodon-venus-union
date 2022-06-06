# frozen_string_literal: true

class ManagerQrcodeController < ApplicationController
  def show
    username = params[:username]
    text = Account.find_by(username: username).manager_id
    if text.empty? then
      render body: nil
      return
    end
    qr = Rails.cache.fetch("manager_qrcode/#{text}", expired_in: 6.hours) do
      RQRCode::QRCode.new(text).as_svg(offset: 5,module_size: 5).html_safe
    end
    render(body: qr,content_type: 'image/svg+xml')
  end
end
