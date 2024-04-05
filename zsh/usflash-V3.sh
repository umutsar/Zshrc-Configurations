# Coded by Umut Sar
# Brief: Programming stm32 with st-link in terminal environment. (You need to install st-flash requirement) ( Version 2 )


download_stm32_binfiles() {
    local repo_url="https://github.com/umutsar/STM32-BinFiles"
    local target_dir="/home/kali/stm32bin"
    
    echo "Depo indiriliyor: $repo_url"
    curl -L "$repo_url/archive/main.zip" -o "$target_dir/main.zip"
    
    unzip -q "$target_dir/main.zip" -d "$target_dir"
    
    mv "$target_dir/STM32-BinFiles-main"/* "$target_dir"/
    
    rm -rf "$target_dir/STM32-BinFiles-main"
    rm "$target_dir/main.zip"
}



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
        if [ "$1" = "reload" ]; then
            echo "Reload işlemi sürdürülüyor..."
            # Buraya github reload işlemi yap:
            download_stm32_binfiles
        else
            st-flash write "/home/kali/stm32bin/$1.bin" 0x08000000
        fi
        
    else
        echo "Invalid number of arguments. Usage: usflash [optional_project_name | reload]"
    fi
}

function _usflash {
    _files -W /home/kali/stm32bin/ -/
}

# Otomatik tamamlama işlevini usflash fonksiyonuna bağlama

compdef _usflash usflash



# usage:

# If you are in the project folder;
# usflash

# If you know project name and you are in any directory; ( You can press tab to preview projects )
# usflash ProjectName

# Synchronization command:
# usflash reload
