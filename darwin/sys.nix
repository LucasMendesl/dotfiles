{ inputs, pkgs, hostname, ... }: 

let 
 self = inputs.self;
in {
  system.defaults.smb.NetBIOSName = hostname;
  
  system.activationScripts.postUserActivation.text = ''
    # activateSettings -u will reload the settings from the database and apply
    # them to the current session, so we do not need to logout and login again
    # to make the changes take effect.
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

    # improvments in bluetooth sound
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
  '';

  system.nvram.variables = {
    StartupMute = "%01";
  };

  system.defaults = {
    loginwindow.GuestEnabled = false;
    loginwindow.SHOWFULLNAME = true;

    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      ApplePressAndHoldEnabled = false;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      AppleInterfaceStyle = "Dark";
      AppleICUForce24HourTime = true;
      AppleShowScrollBars = "Automatic";
      NSDocumentSaveNewDocumentsToCloud = false;
    };

    dock = {
      show-recents = false;
      mru-spaces = false;
      persistent-apps = [
       "${pkgs.vscode}/Applications/Visual Studio Code.app"
       "${pkgs.google-chrome}/Applications/Google Chrome.app"
       "${pkgs.kitty}/Applications/Kitty.app"
       "/System/Applications/Reminders.app"
       "/System/Applications/Calendar.app"
       "/System/Applications/App Store.app"
       "/System/Applications/System Settings.app"
      ];
      tilesize = 70;
      wvous-tl-corner = 2;  # top-left - Mission Control
      wvous-tr-corner = 13;  # top-right - Lock Screen
      wvous-bl-corner = 3;  # bottom-left - Application Windows
      wvous-br-corner = 4;  # bottom-right - Desktop
    };

    finder = {
      ShowStatusBar = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "clmv";
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
      FXEnableExtensionChangeWarning = false;
    };

    controlcenter = {
      BatteryShowPercentage = true;
      Bluetooth = true;
      Sound = true;
    };

    CustomUserPreferences = {
      ".GlobalPreferences" = {
        # automatically switch to a new space when switching to the application
        AppleSpacesSwitchOnActivate = true;
      };
      NSGlobalDomain = {
        # Add a context menu item for showing the Web Inspector in web views
        WebKitDeveloperExtras = true;
      };
      "com.apple.finder" = {
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
        _FXSortFoldersFirst = true;
        
        # When performing a search, search the current folder by default
        FXDefaultSearchScope = "SCcf";
        WarnOnEmptyTrash = true;
      };
      "com.apple.desktopservices" = {
        # Avoid creating .DS_Store files on network or USB volumes
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.spaces" = {
        "spans-displays" = 0; # Display have seperate spaces
      };
      "com.apple.WindowManager" = {
        EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
        StandardHideDesktopIcons = 0; # Show items on desktop
        HideDesktop = 0; # Do not hide items on desktop & stage manager
        StageManagerHideWidgets = 0;
        StandardHideWidgets = 0;
      };
      "com.apple.screensaver" = {
        # Require password immediately after sleep or screen saver begins
        askForPassword = 1;
        askForPasswordDelay = 0;
      };
      "com.apple.screencapture" = {
        location = "/tmp";
        type = "png";
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      # Prevent Photos from opening automatically when devices are plugged in
      "com.apple.ImageCapture".disableHotPlug = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.configurationRevision = self.rev or self.dirtyRev or null;  
  system.stateVersion = 5;

  environment.shells = [
    pkgs.zsh
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "Meslo"
        "Hack"
      ];
    })
  ];
} 
