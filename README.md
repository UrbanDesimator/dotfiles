# dotfiles
These are my config files if you find them useful you could star them thanks. all files used at your own risk.

My mpv dir has my custom mpv.conf for 1080p playback using cpu for decoding and gpu for shaders. All the scripts, shaders, fonts and uosc from https://github.com/tomasklaen/uosc "bit shout to tomasklaen ur usoc rocks" that I'm currently using.
I have spent a lot of time looking at mpv.conf other kind folks who have shared their's files and info. 
I have used the mpv manual extensivly and google to genrate my mpv.conf and maily use it to watch films and tv series @1080p, x264, x265 and hvec. 
I watch via a AMD FX 4 Core @4500Ghz 16GB ddr3 2133 Linux PC with an MSi Geforece GTX660 Ti twin frozr 3GB DDr5 and a 37" Toshiba TV at 1920x1080p connected via hdmi. One of biggest improvements I got was swapping TV mode from PC to Movie and googling sttings for my tv in that mode. 
I also use https://gitlab.com/lvml/mpv-plugin-xrandr which matches the display refresh rate with the fps of the file being played in mpv.
November 2024 I have made a big change to my mpv.conf file, after more reading I learned you can add additional profiles by using profile=deband_1 for example. I used this to setup 4 different profiles of deband settings and then I could test them much quicker and reliably.
The other big change is a friend pointed me to link below.

https://github.com/noelsimbolon/mpv-config/blob/windows/mpv.conf

Huge thanks to noelsimbolon for sharing thier conf file, I had video playback looking really nice. Then I used the "high-quality" profile from the above link with few tweaks specific to my system and # out conf enteries included in the porofile setup my deband profiles. And WoW the improvement is quight stagering particuly the colour in films and this is only at 1080p. I was stunned to say the least and really glad I found the conf file huge cudos to noelsimbolon. I have used nearly all thier settings the only changes was vo gpu context gpu api. I have even started an email conversation with some of the folks who control whats included in the distro I use as all the shaders used are gpl and I think it would be very cool to blow the users socks of with a default mpv.conf. when I shared they were as blown away as me several said they were ditching their current player and going to mpv. I agree with them the defaults in mpv are not even in the same ballpark as the results we got. I only use a Geforce GTX660 Ti 2GB ddr5 graphics card thats 10 years old several people I have shared with have much newer and said at full 4k 2060p it was stunning.

