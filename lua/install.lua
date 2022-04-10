-- Installs plugins with packer.
local plugins = require "plugins"

PACKER_BOOTSTRAP = require "bootstrap"

local packer = require "config.packer"

-- Install your plugins here
return packer.startup(function(use)
  for _, plugin in ipairs(plugins) do
    use(plugin)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
