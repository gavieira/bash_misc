Always use the '-f best' parameter.

Stripped from [youtube-dl README](https://github.com/ytdl-org/youtube-dl)

```
$ youtube-dl --get-filename -o '%(title)s.%(ext)s' BaW_jenozKc
youtube-dl test video ''_ä↭𝕐.mp4    # All kinds of weird characters

$ youtube-dl --get-filename -o '%(title)s.%(ext)s' BaW_jenozKc --restrict-filenames
youtube-dl_test_video_.mp4          # A simple file name

# Download YouTube playlist videos in separate directory indexed by video order in a playlist
$ youtube-dl -f best -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=PLwiyx1dc3P2JR9N8gQaQN_BCvlSlap7re

# Download all playlists of YouTube channel/user keeping each playlist in separate directory:
$ youtube-dl -f best -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/user/TheLinuxFoundation/playlists

# Download Udemy course keeping each chapter in separate directory under MyVideos directory in your home
$ youtube-dl -u user -p password -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s' https://www.udemy.com/java-tutorial/

# Download entire series season keeping each series and each season in separate directory under C:/MyVideos
$ youtube-dl -o "C:/MyVideos/%(series)s/%(season_number)s - %(season)s/%(episode_number)s - %(episode)s.%(ext)s" https://videomore.ru/kino_v_detalayah/5_sezon/367617

# Stream the video being downloaded to stdout
$ youtube-dl -o - BaW_jenozKc

# Download all mp3 playlists of YouTube channel/user keeping each playlist in separate directory:

youtube-dl -i -x --add-metadata --embed-thumbnail --audio-format mp3 -o '%(uploader)s/%(playlist)s/%(title)s.%(ext)s' https://www.youtube.com/channel/UC-zQnWIPHqhJm4NdjQmPy5g/playlists

# Download single playlist in a new directory (ordered and with autosubs, ignoring errors):

youtube-dl -f best -o "%(playlist)s/%(autonumber)s-%(title)s.%(ext)s" -i --write-auto-sub <playlist url>



```
