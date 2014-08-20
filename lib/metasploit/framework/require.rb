# @note needs to use explicit nesting. so this file can be loaded directly without loading 'metasploit/framework', this
#   file can be used prior to Bundler.require.
module Metasploit
  module Framework
    # Extension to `Kernel#require` behavior.
    module Require
      #
      # Module Methods
      #

      # Tries to require `name`.  If a `LoadError` occurs, then `without_warning` is printed to standard error using
      # `Kernel#warn`, along with instructions for reinstalling the bundle.  If a `LoadError` does not occur, then
      # `with_block` is called.
      #
      # @param name [String] the name of the library to `Kernel#require`.
      # @param without_warning [String] warning to print if `name` cannot be required.
      # @yield block to run when `name` requires successfully
      # @yieldreturn [void]
      # @return [void]
      def self.optionally(name, without_warning)
        begin
          require name
        rescue LoadError
          warn without_warning
          warn "Bundle installed '--without #{Bundler.settings.without.join(' ')}'"
          warn "To clear the without option do `bundle install --without ''` " \
           "(the --without flag with an empty string) or " \
           "`rm -rf .bundle` to remove the .bundle/config manually and " \
           "then `bundle install`"
        else
          if block_given?
            yield
          end
        end
      end

      # Tries to `require 'metasploit/credential/creation'` and include it in the `including_module`.
      #
      # @param including_module [Module] `Class` or `Module` that wants to `include Metasploit::Credential::Creation`.
      # @return [void]
      def self.optionally_include_metasploit_credential_creation(including_module)
        optionally(
            'metasploit/credential/creation',
            "metasploit-credential not in the bundle, so Metasploit::Credential creation will fail for #{including_module.name}",
        ) do
          including_module.send(:include, Metasploit::Credential::Creation)
        end
      end

      #
      # Instance Methods
      #

      # Tries to `require 'metasploit/credential/creation'` and include it in this `Class` or `Module`.
      #
      # @example Using in a `Module`
      #   require 'metasploit/framework/require'
      #
      #   module MyModule
      #     extend Metasploit::Framework::Require
      #
      #     optionally_include_metasploit_credential_creation
      #   end
      #
      # @return [void]
      def optionally_include_metasploit_credential_creation
        Metasploit::Framework::Require.optionally_include_metasploit_credential_creation(self)
      end
    end
  end
end
