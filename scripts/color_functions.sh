function dull_red()     {echo "$(tput setaf 1)$1$(tput sgr0)"}
function dull_green()   {echo "$(tput setaf 2)$1$(tput sgr0)"}
function dull_yellow()  {echo "$(tput setaf 3)$1$(tput sgr0)"}
function dull_blue()    {echo "$(tput setaf 4)$1$(tput sgr0)"}
function dull_magenta() {echo "$(tput setaf 5)$1$(tput sgr0)"}
function dull_cyan()    {echo "$(tput setaf 6)$1$(tput sgr0)"}
function dull_white()   {echo "$(tput setaf 7)$1$(tput sgr0)"}
function dull_black()   {echo "$(tput setaf 8)$1$(tput sgr0)"}
function hot_red()      {echo "$(tput setaf 9)$1$(tput sgr0)"}
function hot_green()    {echo "$(tput setaf 10)$1$(tput sgr0)"}
function hot_yellow()   {echo "$(tput setaf 11)$1$(tput sgr0)"}
function hot_blue()     {echo "$(tput setaf 12)$1$(tput sgr0)"}
function hot_magenta()  {echo "$(tput setaf 13)$1$(tput sgr0)"}
function hot_cyan()     {echo "$(tput setaf 14)$1$(tput sgr0)"}
function hot_white()    {echo "$(tput setaf 15)$1$(tput sgr0)"}
function hot_black()    {echo "$(tput setaf 16)$1$(tput sgr0)"}

# for debugging
if [ "$1" = '--debug' ]; then
    echo "dull_red:\t $(dull_red yolooooooooooooooooooo)"
    echo "dull_green:\t $(dull_green yolooooooooooooooooooo)"
    echo "dull_yellow:\t $(dull_yellow yolooooooooooooooooooo)"
    echo "dull_blue:\t $(dull_blue yolooooooooooooooooooo)"
    echo "dull_magenta:\t $(dull_magenta yolooooooooooooooooooo)"
    echo "dull_cyan:\t $(dull_cyan yolooooooooooooooooooo)"
    echo "dull_white:\t $(dull_white yolooooooooooooooooooo)"
    echo "dull_black:\t $(dull_black yolooooooooooooooooooo)"
    echo "hot_red:\t $(hot_red yolooooooooooooooooooo)"
    echo "hot_green:\t $(hot_green yolooooooooooooooooooo)"
    echo "hot_yellow:\t $(hot_yellow yolooooooooooooooooooo)"
    echo "hot_blue:\t $(hot_blue yolooooooooooooooooooo)"
    echo "hot_magenta:\t $(hot_magenta yolooooooooooooooooooo)"
    echo "hot_cyan:\t $(hot_cyan yolooooooooooooooooooo)"
    echo "hot_white:\t $(hot_white yolooooooooooooooooooo)"
    echo "hot_black:\t $(hot_black yolooooooooooooooooooo)"
fi
