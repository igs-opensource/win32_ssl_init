module Win32SSLInit
  class CLI

    def self.execute!
      new.execute
    end

    def execute
      pull_certs
      ruby_instance
      dump_certs
      rehash_certs
    end

    def pull_certs
      @certs ||= Certs.instance.to_a.uniq
    end
    alias_method :certs, :pull_certs

    ##
    # Finds the root of the running ruby installation by checking the 2nd to last entry in the load path
    # TODO: Check if this is always true... it seems to be so far.
    def ruby_instance
      @ruby_instance ||= $LOAD_PATH[-2].split("/")[0..-4].join("/")
    end

    def ruby_ssl_cert_folder
      if (Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.2.0')) && (Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.4.0'))
        "#{ruby_instance}/bin/etc/ssl/certs/"
      else
        "#{ruby_instance}/ssl/certs/"
      end
    end

    def dump_certs
      @certs.each do |cert|
        file_name = determine_file_name(cert)
        dump_cert(ruby_ssl_cert_folder + file_name, cert)
      end
    end

    def dump_cert(cert_path, cert)
      File.write(cert_path, cert)
    end

    ##
    # Uses cert authority to name the cert.
    def determine_file_name(cert)
      cert_name = cert.subject.to_s.split("/").reverse.first { |it| it.include?("CN") }.split("=").last.downcase
      "#{cert_name}.pem"
    end

    def rehash_certs
      Dir.chdir ruby_ssl_cert_folder do
        puts "Certs placed in #{ruby_ssl_cert_folder}, rehashing"
        puts `ruby ./c_rehash.rb`
      end
    end

  end
end