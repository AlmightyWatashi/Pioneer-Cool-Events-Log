# Pioneer Cool Events Log
A small mod for Pioneer Space Sim that logs cool events to a text file.

## What?

If you play [Pioneer Space Sim](https://pioneerspacesim.net/), when something Cool happens (you took off, you entered hyperspace, etc) this mod will write a notification to the file `event_log.txt` where you always read the last Cool Event that happened to you.

## Why?

This is a first step to expanding Pioneer to other screens, peripherals or computers. While I don't expect to be able to turn it into a full bridge sim where you get the system map on your grandma's laptop, it's a good step towards stuff like trade info screen and who knows what else.

If you have a simpit or a similar microcontroller toy, you can always use this mod to make your lights go red when you get hit, or your launch button can glow while you're docked, or something like that.

If not, you can always have a script that shows the last notification on your second monitor, or you can feed it to a speech synthesizer, or a web page idk do whatever you want, I'm not your mother.

## This is awfully basic, I could have done that myself

But you didn't so I did it. You're welcome.

## How do I install?

The main folder should be:
- in Windows probably `%USERPROFILE%\Documents\Pioneer\Mods`
- in Linux it's usually `~/.local/share/pioneer/mods`

Extract it so this readme ends up in the folder `eventlog`. Don't keep it zipped, as the `event_log.txt` is also inside the mod, so you might as well have it all extracted

## Why so much files?

- `./readme.md` - the file you are reading right now
- `./event_log.txt` - the log file that remembers the last cool thing you did - have your little machines read this for maximum fun
- `./showlog.py` - the python script that displays the last event from event_log.txt. It's mostly code from the internet, idk how it works. Delete if you don't need.
- `./showlog.bat` - windows startup for the python script. Run it, enlarge the font, make it full screen and you have a notification screen. Delete if you deleted the python file or are using linux.
- `./modules/eventlog/init.lua` - the mod itself!

## How do I fidget around the mod?

It's all in `modules/eventlog/init.lua`

Line 11 - if you change "w" to "a" you can fill the log file like a real log instead of having it display just the last thing. But be careful, if you forget about it, it may bloat to whole kilobytes, maybe even megabytes.

After line 19 you can find the Cool Events. Most of it is tested. It's mostly stuff from the [Pioneer Api Reference](https://codedoc.pioneerspacesim.net/#) that didn't require much effort like "constantly checking for hitpoints" or whatnot. I would love to expand on it one day, but you are also free to do that instead of me.

### Currently the events are:
- `onGameStart` - Welcome back, pilot.
- `onShipLanded` - when you land. Not dock, land, probably in wilderness. It tells you which planet you landed on.
- `onShipTakeoff` - you left wilderness.
- `onShipDocked` - you docked with the station and it tells you the name of the station.
- `onShipUndocked` - you undocked.
- `onEnterHyperspace` - you entered hyperspace towards a certain system, it tells you which one.
- `onEnterSystem` - you left hyperspace.
- `onShipCollided` - the most awkward of notifications.
- `onJettison` - you dumped cargo from your ship.

**This mod is available under licence please steal all of it and make something better and I will pretend you wrote it all and probably want to try whatever you did with it**
