# chrome-remote-desktop

Some notes to get chrome remote desktop working.

## Requirements

1. Need a second desktop VM. You are going to disable things in this 2nd desktop.

## Notes

1. Run this first.
2. Go to remotedesk

## FAQ

### stuck installer

If the GUI is stuck, remove the deb and try again.

```sh
sudo apt remove chrome-remote-ddesktop
```

### Missing .config/chrome-remote-desktop

```sh
mkdir ~/.config/chrome-remote-desktop
```

## Links

https://www.reddit.com/r/linux4noobs/comments/1358re6/finally_i_got_to_setup_chrome_remote_desktop_on/

https://cloud.google.com/architecture/chrome-desktop-remote-on-compute-engine#gnome