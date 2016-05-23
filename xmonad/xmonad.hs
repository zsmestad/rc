import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders (smartBorders0)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ defaultConfig
    { terminal    = myTerminal
    , modMask     = mod4Mask
    , borderWidth = myBorderWidth
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts . smartBorders $ layoutHook defaultConfig
    , logHook = myLogHook xmproc
    }

myTerminal = "urxvt"
myBorderWidth = 2

myLogHook xmproc =
  dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "green" "" . shorten 50
    }
