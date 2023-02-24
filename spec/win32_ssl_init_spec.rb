# frozen_string_literal: true

RSpec.describe Win32SSLInit do
  it 'pulls certs' do
    cli = Win32SSLInit::CLI.new
    cli.pull_certs
    expect(cli.certs).to(be_all{|it| it.is_a?(OpenSSL::X509::Certificate)})
  end
end
