Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  unless Rails.env.development?
  provider :facebook, '109989265800865','744992dd6f454af379aec458a0f86e83'
  else
  provider :facebook, "187370434717652", "8726a8623628d9497933189cbba3b577"
  end
end