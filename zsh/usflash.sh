# Coded by Umut Sar
# Brief: Programming stm32 with st-link in terminal environment. (You need to install st-flash requirement)

function usflash {
    local bin_file=$(find . -maxdepth 1 -type f -name '*.bin' -print -quit)
    
    if [ "$#" -eq 0 ]; then
        if [ -n "$bin_file" ]; then
            echo "Found .bin file: $bin_file"
            st-flash write "$bin_file" 0x08000000
        else
            echo "No .bin file found in the current directory."
        fi
    elif [ "$#" -eq 1 ]; then
        st-flash write "/home/superuser/STM32CubeIDE/workspace_1.14.0/$1/Debug/$1.bin" 0x08000000
    else
        echo "Invalid number of arguments. Usage: usflash [optional_project_name]"
    fi
}

# usage:

# If you are in the project folder;
# usflash

# If you know project name and you are in any directory;
# usflash ProjectName

