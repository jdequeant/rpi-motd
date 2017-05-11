let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

memavailable=`cat /proc/meminfo | grep MemAvailable | awk '{printf("%d", $2/1024)}'`
memtotal=`cat /proc/meminfo | grep MemTotal | awk '{printf("%d", $2/1024)}'`
let memallocated=$((${memtotal}-${memavailable}))

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
DARKBLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

BOLD=$(tput bold)
REGULAR=$(tput sgr0)

# get the load averages
read one five fifteen rest < /proc/loadavg

echo "${BOLD}${GREEN}
   .~~.   .~~.    `date +"%A, %e %B %Y, %r"`
  '. \ ' ' / .'   `uname -srmo`${RED}
   .~ .~~~..~.    
  : .~.'~'.~. :   ${YELLOW}Uptime.............: ${REGULAR}${CYAN}${UPTIME}${RED}${BOLD}
 ~ (   ) (   ) ~  ${YELLOW}Memory.............: ${REGULAR}${CYAN}${memallocated}/${memtotal}MB${RED}${BOLD}
( : '~'.~.'~' : ) ${YELLOW}Load Averages......: ${REGULAR}${CYAN}${one}, ${five}, ${fifteen} (1, 5, 15 min)${RED}${BOLD}
 ~ .~ (   ) ~. ~  ${YELLOW}Running Processes..: ${REGULAR}${CYAN}`ps ax | wc -l | tr -d " "`${RED}${BOLD}
  (  : '~' :  )   ${YELLOW}Local IP...........: ${REGULAR}${CYAN}`/sbin/ifconfig eth0 | /bin/grep "inet addr" | /usr/bin/cut -d ":" -f 2 | /usr/bin/cut -d " " -f 1`${RED}${BOLD}
   '~ .~~~. ~'    ${YELLOW}Public IP .........: ${REGULAR}${CYAN}`wget -q -O - http://icanhazip.com/ | tail`${RED}${BOLD}
       '~'        ${YELLOW}Weather............: ${REGULAR}${CYAN}`curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|FR|FR001|NANTES|" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`${RED}${BOLD}
${REGULAR}"
