module Metasploit
  module Framework
    module Version
      MAJOR = 4
      MINOR = 11
      PATCH = 2
      PRERELEASE = '2015052901'
    end

    VERSION = "#{Version::MAJOR}.#{Version::MINOR}.#{Version::PATCH}-#{Version::PRERELEASE}"
    GEM_VERSION = VERSION.gsub('-', '.pre.')
  end
end
