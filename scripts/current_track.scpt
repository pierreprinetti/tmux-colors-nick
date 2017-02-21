(* Get the current song from iTunes or Spotify *)
if application "iTunes" is running then
  tell application "iTunes"
    if exists current track then
      set theName to the name of the current track
      set theArtist to the artist of the current track
      try
        return "♫  " & theName & " - " & theArtist
      on error err
      end try
    end if
  end tell
else if application "Spotify" is running then
    tell application "Spotify"
      set theName to name of the current track
      set theArtist to artist of the current track
      set theAlbum to album of the current track
      set theUrl to spotify url of the current track
      set theState to player state as string
      if theState is equal to "paused" then
        set theState to "(p)"
      end if
      if theState is equal to "playing" then
        set theState to ""
      end if
      try
        return theState & " " & theName & " - " & theArtist
      on error err
      end try
    end tell
end if
