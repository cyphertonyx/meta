# -*- encoding: utf-8 -*-
# stub: metasploit-framework-pcap 4.11.0.pre.dev ruby lib

Gem::Specification.new do |s|
  s.name = "metasploit-framework-pcap"
  s.version = "4.11.0.pre.dev"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Metasploit Hackers"]
  s.date = "2015-04-20"
  s.description = "Gems needed to capture packets in metasploit-framework"
  s.email = ["metasploit-hackers@lists.sourceforge.net"]
  s.homepage = "https://www.metasploit.com"
  s.licenses = ["BSD-3-clause"]
  s.rubygems_version = "2.4.3"
  s.summary = "metasploit-framework packet capture dependencies"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<metasploit-framework>, ["= 4.11.0.pre.dev"])
      s.add_runtime_dependency(%q<network_interface>, ["~> 0.0.1"])
      s.add_runtime_dependency(%q<pcaprub>, [">= 0"])
    else
      s.add_dependency(%q<metasploit-framework>, ["= 4.11.0.pre.dev"])
      s.add_dependency(%q<network_interface>, ["~> 0.0.1"])
      s.add_dependency(%q<pcaprub>, [">= 0"])
    end
  else
    s.add_dependency(%q<metasploit-framework>, ["= 4.11.0.pre.dev"])
    s.add_dependency(%q<network_interface>, ["~> 0.0.1"])
    s.add_dependency(%q<pcaprub>, [">= 0"])
  end
end
