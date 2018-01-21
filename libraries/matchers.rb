if defined?(ChefSpec)
  def yourls_install(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:yourls_install, :install, resource_name)
  end
end
