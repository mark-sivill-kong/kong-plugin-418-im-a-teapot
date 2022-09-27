--
-- Return http error status 418 - I'm a Teapot
-- https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#418
-- Allows for configurable content type and body
-- 
-- Written by Mark Sivill Sep 2022
--

local plugin = {
  PRIORITY = 1000,
  VERSION = "3.0.0",
}


-- runs in the 'access_by_lua_block'
function plugin:access(plugin_conf)

  kong.log.debug("I ain't no coffee machine")

  local return_content_type = plugin_conf.content_type
  local return_body = plugin_conf.body

  kong.log.debug("Responding with content " .. return_content_type .. " and body " .. return_body)

  kong.response.exit(
    418, return_body, { ["Content-Type"] = return_content_type}
  )

end


-- return our plugin object
return plugin
