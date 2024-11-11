#!/bin/bash

while true; do
    # Limpa o terminal
    clear

    # Exibe a tipografia "NH" em azul escuro
    echo -e "\e[34m<3<3             <3             <3\e[0m"
    echo -e "\e[34m<3   <3          <3             <3\e[0m"
    echo -e "\e[34m<3      <3       <3<3<3<3<3\e[0m"
    echo -e "\e[34m<3         <3    <3             <3\e[0m"
    echo -e "\e[34m<3           <3  <3             <3\e[0m"
    echo -e "\e[34m<3             <3<3             <3\e[0m"

    # Informações e opções
    echo ""
    echo -e "\e[36mProject by 4b1ss4l Beta version\e[0m"
    echo -e "\e[32mEnter a number...\e[0m"
    echo -e "\e[36m[1] RANDOM // Takes you to a random Nhentai page\e[0m"
    echo -e "\e[36m[2] SPECIFIC // You enter a page number\e[0m"
    echo -e "\e[36m[3] LATEST // Go to the latest Nhentai upload\e[0m"
    echo -e "\e[36m[4] POPULAR // Go to the popular section\e[0m"
    echo -e "\e[36m[5] SEARCH // Search by tag or keyword\e[0m"
    echo -e "\e[36m[6] EXIT // Exit the script\e[0m"
    echo -e "\e[36m[7] INFO OPTIONS // Displays information about the script and options\e[0m"
    echo -e "\e[36m[8] RANDOM TAG // Get a random tag and search for it\e[0m"
    echo -e "\e[36m[9] UPDATE SCRIPT // Update script from the GitHub repository\e[0m"

    # Lê a opção do usuário
    echo -e "\e[32mSelect an option: \e[0m\c"
    read option

    case $option in
        1)
            termux-open-url "https://nhentai.net/random"
            ;;
        2)
            echo -e "\e[34mEnter a number from 1-80,000: \e[0m\c"
            read page_number
            termux-open-url "https://nhentai.net/g/$page_number/"
            ;;
        3)
            termux-open-url "https://nhentai.net/?sort=recent"
            ;;
        4)
            termux-open-url "https://nhentai.net/?sort=popular"
            ;;
        5)
            echo -e "\e[32mPopular Tags (Press Enter to go back): \e[0m"
            # Lista de tags populares
            tags=("Anal" "Harem" "Vanilla" "Bukkake" "BDSM" "Futanari" "Femdom" "Yaoi" "Yuri" "Tentacle" 
            "Cuckold" "Coping" "NTR" "Incest" "Lactation" "Mobility" "Toys" "Group" "Crossover" "Manga" 
            "Cream pie" "Big Tits" "Blowjob" "Furry" "Females" "Futas" "Futanari Male" "Domination" "Loli" 
            "Shota" "18+" "Mature" "Pet Play" "Fisting" "Threesome" "Yuri-on-Yuri" "Tentacles" "Mindbreak" "Whipping" "Bestiality" "Storyline" "Bondage" "Spanking" "Groping" "Massage" "Pee" 
            "Public" "Cowgirl" "MILF" "Shemale" "Hentai Girls" "Masturbation" "Crossdressing" "Striptease" 
            "Golden Shower" "Oral" "Choking" "Giantess" "Feet" "Grannies" "Footjob" "Tease" "Submissive" 
            "Blackmail" "Fur" "Chimera" "Dom/sub" "Glasses" "Big Ass" "Anime" "Furry" "Puppy Play" 
            "Masturbation" "Fucked in the ass" "Petplay" "Tickling" "Handjob" "Nude" "Swimsuit" "Pussy")
            echo -e "\e[34mSelect a tag from the list: \e[0m"
            select tag in "${tags[@]}"; do
                if [ -n "$tag" ]; then
                    termux-open-url "https://nhentai.net/search/?q=$tag"
                    break
                else
                    echo "Invalid selection, please try again."
                fi
            done
            ;;
        6)
            echo -e "\e[31mExiting... Bye!\e[0m"
            exit 0
            ;;
        7)
            echo -e "\e[36mINFO OPTIONS\e[0m"
            echo -e "\e[32m1) RANDOM: Opens a random page on Nhentai.\e[0m"
            echo -e "\e[32m2) SPECIFIC: You input a page number to go directly to it.\e[0m"
            echo -e "\e[32m3) LATEST: Takes you to the latest uploaded content.\e[0m"
            echo -e "\e[32m4) POPULAR: Directs you to the popular section of Nhentai.\e[0m"
            echo -e "\e[32m5) SEARCH: Search content by a specific tag or keyword.\e[0m"
            echo -e "\e[32m6) EXIT: Closes the script.\e[0m"
            echo -e "\e[32m7) INFO OPTIONS: Displays this help page.\e[0m"
            echo -e "\e[32m8) RANDOM TAG: Gives a random tag and searches for it.\e[0m"
            echo -e "\e[32m9) UPDATE SCRIPT: Updates the script from GitHub.\e[0m"
sleep 10
            ;;
        8)
            random_tag=${tags[$RANDOM % ${#tags[@]}]}
            echo -e "\e[32mSearching for random tag: $random_tag\e[0m"
            termux-open-url "https://nhentai.net/search/?q=$random_tag"
            ;;
        9)
            echo -e "\e[36mUpdating the script from GitHub...\e[0m"
            git pull https://github.com/4b1ss4l/nhscript/nh.sh.git
            ;;
        *)
            echo -e "\e[31mInvalid option, please select a valid number.\e[0m"
            ;;
    esac

    # Espera antes de limpar e reiniciar o loop
    sleep 1
done
