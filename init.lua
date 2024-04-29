
local modules = {
    'caffeine',
  }
  local hyper = { "cmd", "ctrl", "alt",  "shift" }
  
  
  hs.alert.defaultStyle.strokeColor = {white = 1, alpha = 0}
  hs.alert.defaultStyle.fillColor = {white = 0.05, alpha = 0.75}
  hs.alert.defaultStyle.radius = 10
  hs.window.animationDuration = 0
  
  
    hs.hotkey.bind(hyper, "Left", function()
      local win = hs.window.focusedWindow();
      if not win then return end
    win:moveToUnit(hs.layout.left50)
    end)
    hs.hotkey.bind(hyper, "Up", function()
      local win = hs.window.focusedWindow();
      if not win then return end
    win:moveToUnit(hs.layout.maximized)
    end)
    hs.hotkey.bind(hyper, "Right", function()
      local win = hs.window.focusedWindow();
      if not win then return end
    win:moveToUnit(hs.layout.right50)
    end)
    hs.hotkey.bind(hyper, "Down", function()
      local win = hs.window.focusedWindow();
      if not win then return end
    win:minimize()
    end)
  
  
  function moveToScreen(screenPos)
      window = hs.window.focusedWindow()
      
      if screenPos == 1 then
        screen = hs.screen.find({x=0, y=0})
        window:moveToScreen(screen)
        window:moveToUnit(hs.layout.left50)
      elseif screenPos == 2 then
        screen = hs.screen.find({x=0, y=0})
        window:moveToScreen(screen)
        window:moveToUnit(hs.layout.right50)
      elseif screenPos == 3 then
        screen = hs.screen.find({x=1, y=0})
        window:moveToScreen(screen)
        window:moveToUnit(hs.layout.left50)
      elseif screenPos == 4 then
        screen = hs.screen.find({x=1, y=0})
        window:moveToScreen(screen)
        window:moveToUnit(hs.layout.right50)
      end
    end
    
    hs.hotkey.bind(hyper, "1", function()
      moveToScreen(1)
    end)
    
    hs.hotkey.bind(hyper, "2", function()
      moveToScreen(2)
    end)

    hs.hotkey.bind(hyper, "3", function()
      moveToScreen(3)
    end)

    hs.hotkey.bind(hyper, "4", function()
      moveToScreen(4)
    end)
  
  
  
  
  local leftScreen = hs.screen{x=0,y=0}
  local rightScreen = hs.screen{x=1,y=0}
  
  
  
  local twoScreenLayout = {
   {"Google Chrome", nil, rightScreen, hs.layout.left50, nil, nil},
   {"iTerm2", nil, rightScreen, hs.layout.right50, nil, nil},
   {"Spotify", nil, leftScreen, hs.layout.right50, nil, nil},
   {"Code", nil, rightScreen, hs.layout.right50, nil, nil},
   {"Slack", nil, leftScreen, hs.layout.left50, nil, nil},
  }
  
  function switchLayout()
    local numScreens = #hs.screen.allScreens()
    hs.alert.show(numScreens)
    local layout = {}
    if numScreens == 1 then
      layout = twoScreenLayout
    elseif numScreens == 2 then
      hs.alert.show("YO")
      layout = twoScreenLayout
    end
    hs.layout.apply(layout)
  end
  
  hs.hotkey.bind(hyper, "w", function()
    switchLayout()
  end)
  
  
  hs.hotkey.bind(hyper, "delete", function()
    hs.caffeinate.lockScreen()
  end)
  
  
  hs.hotkey.bind(hyper, "end", function()
    hs.caffeinate.shutdownSystem()
  end)
  
    local applicationHotkeys = {
      c = 'Google Chrome',
      s = 'Spotify',
      t = "iTerm",
      v = "Visual Studio Code",
      m = "Mail",
      f = "Finder",
      a = "Activity Monitor",
      b = "Bitwarden",
      z = "zoom.us",
      d = "Calendar",
      i = "IntelliJ IDEA CE",
      r = "Reminders",
      y = "PyCharm CE with Anaconda Plugin",
      l = "Slack",
      n = "Notes",
    }
  
    for key, app in pairs(applicationHotkeys) do
      hs.hotkey.bind(hyper, key, function()
        hs.application.launchOrFocus(app)
      end)
    end
  
    function pingResult(object, message, seqnum, error)
      local seconds = 2
      if message == "didFinish" then
          avg = tonumber(string.match(object:summary(), '/(%d+.%d+)/'))
          if avg == 0.0 then
              hs.alert.show("No network", seconds)
          elseif avg < 200.0 then
              hs.alert.show("Network good (" .. avg .. "ms)", seconds)
          elseif avg < 500.0 then
              hs.alert.show("Network poor(" .. avg .. "ms)", seconds)
          else
              hs.alert.show("Network bad(" .. avg .. "ms)", seconds)
          end
      end
  end
  
  
    hs.hotkey.bind(hyper, 'space', function()
      local seconds = 2
      local message = os.date("%I:%M%p") .. "\n" .. os.date("%a %b %d") .. "\nBattery: " ..
         hs.battery.percentage() .. "%"
      hs.alert.show(message, seconds)
      hs.network.ping.ping("8.8.8.8", 1, 0.01, 1.0, "any", pingResult)
    end)
  
    hs.hotkey.bind(hyper, "DELETE", function()
      hs.caffeinate.lockScreen()
    end)
  
  
    hs.hotkey.bind(hyper, 'p', hs.spotify.playpause)
    hs.hotkey.bind(hyper, ']', hs.spotify.next)
    hs.hotkey.bind(hyper, '[', hs.spotify.previous)
  
    hs.alert.show("Hammerspoon config loaded")
  
  
  
  
  
  
  
      