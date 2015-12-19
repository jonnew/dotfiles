-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:Fixed-9",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Top,
    lowerOnStart = True,
    commands = [
        Run BatteryP ["BAT0"] [ "-t", "<acstatus>"
                              , "-L", "10", "-H", "80"
                              , "-h","#CEFFAC","-l","#FFB6B0","-n","#FFFFCC"
                              , "--", "-O", "Charging", "-o", "Battery: <left>%"
                              ] 10, 
        -- Run Battery ["-t","<left>% / <timeleft>","-L","50","-H","75","-h","green","-n","yell","-l","red"] 10 
        Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "wlan0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " %StdinReader% }{ %wlan0%  |  %multicpu%   %memory%   %swap%  |  %battery%  |  <fc=#FFFFCC>%date%</fc> "
}
