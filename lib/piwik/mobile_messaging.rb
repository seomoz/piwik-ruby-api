module Piwik
  class MobileMessaging < ApiModule
    available_methods %W{
      areSMSAPICredentialProvided
      getSMSProvider
      setSMSAPICredential
      addPhoneNumber
      getCreditLeft
      removePhoneNumber
      validatePhoneNumber
      deleteSMSAPICredential
      setDelegatedManagement
      getDelegatedManagement
    }
  end
end