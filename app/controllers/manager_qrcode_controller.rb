# frozen_string_literal: true

class ManagerQrcodeController < ApplicationController
  def show
    not_found and return unless current_account

    username = params[:username]
    account = Account.find_by(username: username)
    not_found and return if account.nil? || account.blocking?(current_account)

    text = account.manager_id
    not_found and return unless text

    qr = Rails.cache.fetch("manager_qrcode/#{text}", expired_in: 6.hours) do
      RQRCode::QRCode.new(text).as_svg(offset: 4,module_size: 4).html_safe
    end
    render(body: qr,content_type: 'image/svg+xml')
  end
end
