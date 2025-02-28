# frozen_string_literal: true

RSpec.describe Win32SSLInit do
  it 'pulls certs' do
    cli = Win32SSLInit::CLI.new
    cli.pull_certs
    expect(cli.certs).to(be_all{|it| it.is_a?(OpenSSL::X509::Certificate)})
  end

  it 'places certs based on the ruby version number' do
    versions = %w[2.4.0 2.5.0 2.6.0 2.7.0 3.0.0 3.1.0 3.2.0 3.3.0 3.4.0]
    versions.each do |version|
      stub_const("RUBY_VERSION", version)
      cli = Win32SSLInit::CLI.new
      expected_path = %w[3.2.0 3.3.0].include?(version) ? "#{cli.ruby_instance}/bin/etc/ssl/certs/" : "#{cli.ruby_instance}/ssl/certs/"
      expect(cli.ruby_ssl_cert_folder).to eq(expected_path)
    end
  end
end
