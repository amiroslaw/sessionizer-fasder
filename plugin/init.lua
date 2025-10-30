local wezterm = require "wezterm"

local generator = {}

generator.Zoxide = function(opts)
    return function()
        local res = {}
        local success, stdout, stderr = wezterm.run_child_process {
            "fasder",
            "-d",
            "-l",
        }
        for line in stdout:gmatch "[^\n]+" do
            table.insert(res, { label = line, id = line })
        end
        return res
    end
end

return generator
