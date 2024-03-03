
function changeDirectory {
    if [ "$#" -gt 0 ]; then
        cd "/Path/To/Your/$1/subFolder"
    else
        cd "/Path/To/Your"
    fi
}


# Implementation:

# nano ~/.zshrc
# go to the bottom of the file and write above codes. 
# ctrl + o and ctrl + x (for save and exit)
# source ~/.zshrc ( For persistent implementation.)
