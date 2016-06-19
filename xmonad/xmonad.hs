import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run (spawnPipe)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , manageHook  = myManageHooks
    , layoutHook  = myLayoutHook defaultConfig
    , logHook     = myLogHook xmproc
    } `additionalKeys` [
     (( myModMask, xK_f), spawn "firefox")
    ,(( myModMask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
    ,(( myModMask, xK_b), sendMessage ToggleStruts)
    ]

-- Windows key
myModMask = mod4Mask

--myTerminal = "urxvt"
myTerminal = "gnome-terminal"
myBorderWidth = 2

myLayoutHook config =
  avoidStruts . smartBorders $ layoutHook defaultConfig ||| simpleTabbed

myLogHook xmproc =
  dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "green" "" . shorten 50
    }

myManageHooks =
    composeAll [ manageDocks
               , isFullscreen --> doFullFloat
               , manageHook defaultConfig
    ]
